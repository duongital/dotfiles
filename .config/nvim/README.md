# Neovim Configuration

## conform.nvim

- Provides code formatting and format-on-save functionality
- Supports async format actions
- Compatible with standalone formatters like Prettier
- Note: Ruff can include a formatter in its LSP, but not all tools have this feature

## nvim-lspconfig

- Required for linters like Ruff to provide real-time code checking
- Enables real-time linting via LSP
- Works with additional ESLint configurations

## Additional Notes

- Ensure that you have the necessary formatters and linters installed on your system
