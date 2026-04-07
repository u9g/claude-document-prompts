<p align="center">
  <img src="logo.svg" alt="promptlog" width="160">
</p>

<h1 align="center">promptlog</h1>

A Claude Code hook that logs every user prompt to `~/.promptlog/`.

## How it works

A `UserPromptSubmit` hook fires each time you send a message in Claude Code. It reads the prompt, session ID, and working directory from the hook's stdin JSON, then appends the prompt to a log file.

## Log format

Two files are created per session in `~/.promptlog/{project_name}/`:

**`{session_id}.log`** — timestamped log:

```
2026-04-02 02:30pm EST
the user's prompt text

```

**`{session_id}-raw.log`** — just the prompts, one per line:

```
the user's prompt text
another prompt
```

`{project_name}` is the last segment of the working directory (e.g. `my-app` for `/home/user/code/my-app`).

## Installation

Install as a Claude Code plugin:

```
/plugin marketplace add u9g/promptlog
/plugin install promptlog@u9g
```

Or manually: clone this repo and load it with `claude --plugin-dir ./promptlog`.

## Requirements

- `jq` for JSON parsing
