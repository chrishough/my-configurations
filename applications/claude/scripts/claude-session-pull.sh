#!/bin/bash
# claude-session-pull.sh
# Claude Code SessionStart hook.
# Pulls latest chezmoi state (including sessions from other machines).
# Blocks on conflict; warns on network/other failures.

command -v chezmoi >/dev/null 2>&1 || exit 0

# Detect stale rebase from previous failed sync
if chezmoi git -- status 2>&1 | grep -q "rebase in progress"; then
  echo "[chezmoi-sync] Previous rebase still in progress" >&2
  echo "  To abort: chezmoi git -- rebase --abort" >&2
  echo "  To continue: chezmoi git -- rebase --continue" >&2
  exit 1
fi

output=$(chezmoi update --force 2>&1)
[ $? -eq 0 ] && exit 0

# Conflict vs network failure
if echo "$output" | grep -qi -e "conflict" -e "could not apply" -e "rebase"; then
  echo "[chezmoi-sync] Conflict detected:" >&2
  echo "$output" >&2
  echo "Resolve: chezmoi git -- status" >&2
  echo "Skip:    chezmoi git -- rebase --abort" >&2
  exit 1
fi

echo "[chezmoi-sync] chezmoi update failed (network?), skipping" >&2
exit 0
