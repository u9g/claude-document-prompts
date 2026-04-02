# claude-document-prompts

A Claude Code hook that logs every user prompt to `~/.claudeprompts/`.

## How it works

A `UserPromptSubmit` hook fires each time you send a message in Claude Code. It reads the prompt, session ID, and working directory from the hook's stdin JSON, then appends the prompt to a log file.

## Log format

Prompts are written to `~/.claudeprompts/{project_name}/{session_id}.log`:

```
2026-04-02 14:30:00
the user's prompt text

```

`{project_name}` is the last segment of the working directory (e.g. `my-app` for `/home/user/code/my-app`).

## Installation

1. Clone this repo
2. Make the script executable:
   ```bash
   chmod +x log-prompt.sh
   ```
3. Add the hook to `~/.claude/settings.json`:
   ```json
   {
     "hooks": {
       "UserPromptSubmit": [
         {
           "hooks": [
             {
               "type": "command",
               "command": "/path/to/log-prompt.sh"
             }
           ]
         }
       ]
     }
   }
   ```
4. Restart Claude Code

## Requirements

- `jq` for JSON parsing
