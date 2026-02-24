#!/bin/bash
# Development startup script that properly handles ImageMagick v7 deprecation

# Set PATH to prioritize our convert wrapper
export PATH="$(dirname "$0")/bin:$PATH"

# Verify our convert wrapper is being used
if ! command -v convert &> /dev/null; then
    echo "❌ Error: convert command not found"
    exit 1
fi

echo "✓ Using convert wrapper from: $(which convert)"
echo "✓ Bundle executing Jekyll..."

# Start Jekyll with the correct PATH
cd "$(dirname "$0")"
exec bundle exec jekyll serve --port 4000 "$@"
