-- LSP Configuration Plugin
-- Manages Language Server Protocol (LSP) servers for IDE-like features
-- Features:
--   - Code intelligence (go to definition, find references, hover docs)
--   - Real-time diagnostics (errors/warnings)
--   - Code actions and refactoring
--   - Symbol renaming across files
-- Configured servers:
--   - pyright (Python: type checking, go-to-definition, hover)
--   - ruff (Python: linting + formatting)
--   - ts_ls (TypeScript/JavaScript)
--   - eslint (TypeScript/JavaScript: linting)
--   - lua_ls (Lua: Neovim config support)
--   - gopls (Go: intellisense, diagnostics, formatting)
-- Keybindings:
--   gd - Go to definition
--   gr - Find references
--   K - Hover documentation
--   <leader>ca - Code actions
--   <leader>rn - Rename symbol
--   [d / ]d - Navigate diagnostics
return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    -- Diagnostic display settings
    vim.diagnostic.config({
      virtual_text = {
        source = true, -- Show source in virtual text (e.g., "eslint", "pyright")
      },
      float = {
        source = true, -- Show source in floating window
        border = "rounded",
      },
      signs = true,
      underline = true,
    })

    -- Keybindings for LSP functions
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }

        -- Keybindings
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "gr", function()
          require("telescope.builtin").lsp_references({
            jump_type = "never",
            path_display = { "tail" },
          })
        end, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "[d", function()
          vim.diagnostic.jump({ count = -1 })
        end, opts)
        vim.keymap.set("n", "]d", function()
          vim.diagnostic.jump({ count = 1 })
        end, opts)
      end,
    })

    -- Python: Pyright (type checking, intellisense, go-to-definition)
    vim.lsp.config.pyright = {
      cmd = { "pyright-langserver", "--stdio" },
      filetypes = { "python" },
      root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "pyrightconfig.json", ".git" },
      settings = {
        python = {
          analysis = {
            autoSearchPaths = true,
            useLibraryCodeForTypes = true,
            diagnosticMode = "openFilesOnly",
          },
        },
      },
    }

    -- Python: Ruff LSP (linting + formatting)
    vim.lsp.config.ruff = {
      cmd = { "ruff", "server" },
      filetypes = { "python" },
      root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", ".git" },
    }

    -- TypeScript: tsserver
    vim.lsp.config.ts_ls = {
      cmd = { "typescript-language-server", "--stdio" },
      filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
      root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
    }

    -- ESLint: linting for JavaScript/TypeScript
    vim.lsp.config.eslint = {
      cmd = { "vscode-eslint-language-server", "--stdio" },
      filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
      root_markers = {
        ".eslintrc",
        ".eslintrc.js",
        ".eslintrc.json",
        ".eslintrc.cjs",
        "eslint.config.js",
        "eslint.config.mjs",
        "package.json",
      },
    }

    -- Lua: lua_ls (for Neovim config)
    vim.lsp.config.lua_ls = {
      cmd = { "lua-language-server" },
      filetypes = { "lua" },
      root_markers = { ".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml", ".git" },
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          },
        },
      },
    }

    -- Go: gopls
    vim.lsp.config.gopls = {
      cmd = { "gopls" },
      filetypes = { "go", "gomod", "gowork", "gotmpl" },
      root_markers = { "go.work", "go.mod", ".git" },
      settings = {
        gopls = {
          analyses = {
            unusedparams = true,
          },
          staticcheck = true,
        },
      },
    }

    -- Enable LSP servers
    vim.lsp.enable({ "pyright", "ruff", "ts_ls", "eslint", "lua_ls", "gopls" })
  end,
}
