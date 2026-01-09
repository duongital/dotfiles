-- Avante.nvim - AI coding assistant
-- Keybindings: <leader>aa (ask), <leader>ae (edit), <leader>at (toggle)
return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  build = "make",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    provider = "claude-code",
    behaviour = {
      auto_suggestions = false,
      auto_apply_diff_after_generation = false,  -- Requires manual accept
      minimize_diff = true,
    },
    acp_providers = {
      ["claude-code"] = {
        command = "npx",
        args = { "@zed-industries/claude-code-acp" },
        env = {
          NODE_NO_WARNINGS = "1",
          ANTHROPIC_API_KEY = os.getenv("ANTHROPIC_API_KEY"),
        },
      },
    },
    -- Keybindings
    mappings = {
      ask = "<leader>aa",
      edit = "<leader>ae",
      refresh = "<leader>ar",
      focus = "<leader>af",
      toggle = {
        default = "<leader>at",
      },
      diff = {
        ours = "co",      -- Accept your version (reject AI)
        theirs = "ct",    -- Accept AI version
        all_theirs = "ca", -- Accept all AI changes
        both = "cb",      -- Keep both versions
        cursor = "cc",    -- Apply at cursor
        next = "]x",      -- Next conflict
        prev = "[x",      -- Previous conflict
      },
      suggestion = {
        accept = "<M-l>",   -- Alt+l to accept
        next = "<M-]>",     -- Alt+] next suggestion
        prev = "<M-[>",     -- Alt+[ prev suggestion
        dismiss = "<C-]>",  -- Ctrl+] dismiss
      },
    },
    -- Clean UI settings
    windows = {
      position = "right",
      width = 40,
      sidebar_header = {
        enabled = false,
      },
      ask = {
        floating = false,
        start_insert = true,
        border = "rounded",
      },
    },
    -- Diff settings (git-conflict style)
    diff = {
      autojump = true,  -- Auto jump to first conflict
      override_timeoutlen = 500,
    },
    -- Disable visual clutter
    hints = { enabled = false },
    highlights = {
      diff = {
        current = "DiffText",
        incoming = "DiffAdd",
      },
    },
  },
}
