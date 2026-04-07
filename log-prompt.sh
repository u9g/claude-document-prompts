#!/bin/bash
INPUT=$(cat)
PROMPT=$(echo "$INPUT" | jq -r '.prompt')
SESSION_ID=$(echo "$INPUT" | jq -r '.session_id')
CWD=$(echo "$INPUT" | jq -r '.cwd')
DIR_NAME=$(basename "$CWD")
DATETIME=$(date '+%Y-%m-%d %I:%M%P %Z')

mkdir -p ~/.promptlog/${DIR_NAME}
printf '%s\n%s\n\n' "${DATETIME}" "${PROMPT}" >> ~/.promptlog/${DIR_NAME}/${SESSION_ID}.log
printf '%s\n' "${PROMPT}" >> ~/.promptlog/${DIR_NAME}/${SESSION_ID}-raw.log

exit 0
