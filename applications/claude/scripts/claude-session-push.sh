#!/bin/bash
# claude-session-push.sh
# Claude Code Stop hook.
# Selectively adds the most recent session per project into chezmoi.
# chezmoi auto git handles add/commit/push automatically.

command -v chezmoi >/dev/null 2>&1 || exit 0
[ -d "$HOME/.claude" ] || exit 0

LOCKFILE="/tmp/claude-session-push.lock"
MAX_WAIT=30

# --- Serialize concurrent Stop hooks (multiple sessions stopping at once) ---
waited=0
while [ -f "$LOCKFILE" ] && [ "$waited" -lt "$MAX_WAIT" ]; do
  sleep 1
  waited=$((waited + 1))
done
[ -f "$LOCKFILE" ] && rm -f "$LOCKFILE"

touch "$LOCKFILE"
trap 'rm -f "$LOCKFILE"' EXIT

# --- Don't push if a rebase is stuck ---
if chezmoi git -- status 2>&1 | grep -q "rebase in progress"; then
  echo "[chezmoi-sync] Rebase in progress — skipping push" >&2
  exit 0
fi

# --- Pull first to minimize conflicts ---
chezmoi git -- pull --rebase --autostash origin main 2>/dev/null || \
chezmoi git -- pull --rebase --autostash origin master 2>/dev/null || true

# --- Build list of files to sync ---
files_to_add=()

# Always sync settings
[ -f "$HOME/.claude/settings.json" ] && files_to_add+=("$HOME/.claude/settings.json")

# For each project, add the most recent session + its index
for project_dir in "$HOME/.claude/projects"/*/; do
  [ -d "$project_dir" ] || continue

  # sessions-index.json (needed for the picker)
  [ -f "${project_dir}sessions-index.json" ] && files_to_add+=("${project_dir}sessions-index.json")

  # Find the most recently modified .jsonl (the active session)
  latest_jsonl=$(find "$project_dir" -maxdepth 1 -name "*.jsonl" -not -name "agent-*" -type f -print0 \
    | xargs -0 ls -t 2>/dev/null | head -1)

  if [ -n "$latest_jsonl" ]; then
    files_to_add+=("$latest_jsonl")

    # If there's a matching UUID directory, include it too
    session_id=$(basename "$latest_jsonl" .jsonl)
    [ -d "${project_dir}${session_id}" ] && files_to_add+=("${project_dir}${session_id}")
  fi
done

# --- Add everything in one pass (triggers one auto commit+push cycle) ---
if [ ${#files_to_add[@]} -gt 0 ]; then
  chezmoi add "${files_to_add[@]}" 2>/dev/null || true
fi

exit 0
