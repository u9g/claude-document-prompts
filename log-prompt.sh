#!/bin/bash
INPUT=$(cat)
PROMPT=$(echo "$INPUT" | jq -r '.prompt')
SESSION_ID=$(echo "$INPUT" | jq -r '.session_id')
CWD=$(echo "$INPUT" | jq -r '.cwd')
DIR_NAME=$(basename "$CWD")
DATETIME=$(date '+%Y-%m-%d %I:%M%P %Z')

mkdir -p ~/.claudeprompts/${DIR_NAME}
echo -e "${DATETIME}\n${PROMPT}\n" >> ~/.claudeprompts/${DIR_NAME}/${SESSION_ID}.log

exit 0
