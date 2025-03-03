# GitIgnore Downloader

A simple bash script to download language-specific `.gitignore` templates from GitHub's official [github/gitignore](https://github.com/github/gitignore) repository.

## Features

- Downloads `.gitignore` templates for many popular programming languages
- Supports common language aliases and abbreviations (py → Python, js → Node, etc.)
- Handles special template names correctly (C++, C#, etc.)
- Can be run directly from GitHub with curl or as a local script

## Usage

### Option 1: Download and run the script

```bash
# Download the script
curl -O https://raw.githubusercontent.com/yourusername/gitignore-downloader/main/gitignore-downloader.sh

# Make it executable
chmod +x gitignore-downloader.sh

# Run it
./gitignore-downloader.sh python
```

### Option 2: Run directly from GitHub with curl

```bash
curl -s https://raw.githubusercontent.com/shadmeoli/gitignore_store/main/get-gitignore.sh | LANGUAGE=go bash
```

## Supported Languages

The script supports many languages including:

- Python
- JavaScript/Node.js
- Go
- Java
- Ruby
- Rust
- C/C++
- C#
- PHP
- Swift
- And many more!

If a language isn't explicitly mapped, the script will attempt to guess the correct template name.

## Credits

This script uses templates from the official [github/gitignore](https://github.com/github/gitignore) repository, which is the authoritative collection of `.gitignore` templates maintained by GitHub.

## License

MIT
