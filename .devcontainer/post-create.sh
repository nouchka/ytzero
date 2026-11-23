#!/bin/bash
set -e

echo "🚀 Setting up ytzero development environment..."

# Install git hooks
echo "📌 Installing git hooks..."
bun run hooks:install

# Install dependencies
echo "📦 Installing dependencies..."
bun install

# Create necessary directories
echo "📁 Creating data directories..."
mkdir -p ./data/db ./data/imgcache ./data/downloads ./data/deno-cache ./data/download-cookies ./data/logs ./data/bin ./data/avatars ./data/restore-sessions

# Run setup script if available
if [ -f "./scripts/setup.sh" ]; then
    echo "🔧 Running setup script..."
    bash ./scripts/setup.sh
fi

echo "✅ Development environment ready!"
echo ""
echo "Available commands:"
echo "  bun run dev          - Start development servers (app + ui)"
echo "  bun run dev:app      - Start only the app server"
echo "  bun run dev:ui       - Start only the UI dev server"
echo "  bun run build        - Build the project"
echo "  bun run test         - Run all tests"
echo "  bun run typecheck    - Run TypeScript type checking"
echo ""
