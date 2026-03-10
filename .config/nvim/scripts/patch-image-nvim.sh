#!/usr/bin/env bash
# Patches image.nvim for VS Code terminal compatibility.
# Applied automatically via lazy.nvim's build hook after install/update.
#
# Fixes:
# 1. Force "direct" transmission medium (inline base64) instead of "file" (path).
#    VS Code only supports direct transmission; it cannot read files from disk.
# 2. Remove display_zindex=-1 for VS Code: Neovim background cells are opaque in
#    VS Code, so z=-1 renders the image invisibly beneath them.

set -e

INIT="$HOME/.local/share/nvim/lazy/image.nvim/lua/image/backends/kitty/init.lua"

if [ ! -f "$INIT" ]; then
  echo "patch-image-nvim: $INIT not found, skipping"
  exit 0
fi

# Fix 1: force direct transmission when TERM_PROGRAM == "vscode"
if grep -q 'VSCODE_PATCHED' "$INIT"; then
  echo "patch-image-nvim: already patched"
  exit 0
fi

# Insert vscode marker and patch transmit_medium selection
sed -i 's/if is_SSH then transmit_medium = codes.control.transmit_medium.direct end/-- VSCODE_PATCHED\n  if is_SSH or vim.env.TERM_PROGRAM == "vscode" then transmit_medium = codes.control.transmit_medium.direct end/' "$INIT"

# Fix 2: remove display_zindex=-1 for VS Code (opaque cells hide z=-1 images)
sed -i 's/display_zindex = -1,/display_zindex = vim.env.TERM_PROGRAM ~= "vscode" and -1 or nil,/' "$INIT"

echo "patch-image-nvim: patched successfully"
