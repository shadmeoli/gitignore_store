#!/bin/bash

set -e  # Exit on error

# Display usage information
show_usage() {
    echo "Usage: $(basename "$0") <language>"
    echo "Downloads a .gitignore template for the specified programming language"
    echo ""
    echo "Example:"
    echo "  $(basename "$0") golang    # Downloads go .gitignore template"
    echo "  $(basename "$0") node     # Downloads Node.js .gitignore template"
}

# Validate input arguments
if [ $# -eq 0 ]; then
    echo "Error: No language specified"
    show_usage
    exit 1
fi

# Sanitize input: Remove special characters and convert to lowercase
language=$(echo "$1" | tr -cd '[:alnum:]' | tr '[:upper:]' '[:lower:]')

# Capitalize first letter for the URL
language_capitalized=$(echo "$language" | sed 's/./\u&/1')

# GitHub raw content URL for gitignore files
GITHUB_URL="https://raw.githubusercontent.com/github/gitignore/main"
output_file=".gitignore"

# Attempt to download the gitignore file
echo "Fetching .gitignore template for ${language_capitalized}..."

if curl -f -s "${GITHUB_URL}/${language_capitalized}.gitignore" -o "${output_file}"; then
    echo "✓ Successfully downloaded ${language_capitalized}.gitignore"
    echo "✓ File saved as ${output_file} in the current directory"
else
    echo "✗ Error: Could not find .gitignore template for '${language_capitalized}'"
    echo "  Please check if the language name is correct and try again"
    echo "  Visit: https://github.com/github/gitignore for available templates"
    exit 1
fi