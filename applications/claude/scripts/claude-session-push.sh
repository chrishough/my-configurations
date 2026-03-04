#!/bin/bash
# claude-session-push.sh
# Claude Code Stop hook.
# Re-adds session data into chezmoi source.
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

# --- Re-add session data (autoAdd + autoCommit + autoPush does the rest) ---
chezmoi re-add "$HOME/.claude" 2>/dev/null || {
  chezmoi add "$HOME/.claude" 2>/dev/null || true
}

exit 0
