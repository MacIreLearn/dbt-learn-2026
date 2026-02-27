#!/usr/bin/env bash
# Fix workspace YAML settings for this repo
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
VSCODE_DIR="$ROOT_DIR/.vscode"
mkdir -p "$VSCODE_DIR"
cat > "$VSCODE_DIR/settings.json" <<'JSON'
{
  "files.associations": {
    "*.yml": "yaml",
    "*.yaml": "yaml"
  },
  "[yaml]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode",
    "editor.formatOnSave": true,
    "editor.tabSize": 2,
    "editor.wordWrap": "on",
    "editor.quickSuggestions": {
      "other": true,
      "comments": false,
      "strings": true
    }
  },
  "yaml.useLanguageServer": true,
  "yaml.schemaStoreEnabled": true,
  "editor.suggestOnTriggerCharacters": true,
  "editor.inlineSuggest.enabled": true
}
JSON

echo "Wrote $VSCODE_DIR/settings.json"
echo "Open VS Code and run 'Developer: Reload Window' (Cmd+Shift+P)."
echo "You can also run the VS Code task 'Fix YAML file associations' from the Command Palette."
