return {
  {
    "rktjmp/lush.nvim",
    lazy = false,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    keys = {
      { "<leader>nt", "<cmd>Neotree toggle<cr>", desc = "NeoTree Toggle" },
      { "<leader>nf", "<cmd>Neotree focus<cr>", desc = "NeoTree Focus" },
    },
    config = function()
      require("neo-tree").setup({
        close_if_last_window = true,
        enable_git_status = false,
        enable_diagnostics = false,

        default_component_configs = {
          icon = {
            folder_closed = "⏵",
            folder_open = "⏷",
            folder_empty = " ",
            default = " ",
            highlight = ""
          },
          name = {
            trailing_slash = true,
          },
        },

        window = {
          width = 30,
          mappings = {
            ["i"] = "open_split",
            ["s"] = "open_vsplit",
            ["I"] = "toggle_hidden",
          },
        },
      })
    end,
  },

  {
    "nmac427/guess-indent.nvim",
    config = function()
      require("guess-indent").setup({})
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("lspconfig").terraformls.setup({})
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
      parser_config.gotmpl = {
        install_info = {
          url = "https://github.com/ngalaiko/tree-sitter-go-template",
          files = {"src/parser.c"},
        },
        filetype = "gotmpl",
        used_by = {"gohtmltmpl", "gotexttmpl", "gotmpl"},
      }

      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "vim", "vimdoc", "lua",

          "html", "css", "scss", "xml",
          "javascript", "typescript", "vue",

          "dockerfile",
          "bash",

          "git_config", "git_rebase", "gitcommit", "gitignore",

          "go", "gomod", "gosum", "gowork", "gotmpl",

          "hcl", "ini", "json", "yaml",
          "markdown", "diff",
          "sql",

          "c", "cpp",

          "ruby",
          "python", "requirements",

          "hcl", "terraform",
        },
        highlight = {
          enable = true,
        },
      })
    end,
  },

  {
    "bronson/vim-trailing-whitespace",
    lazy = false,
  },

  {
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()',
    config = function()
      require("lspconfig").gopls.setup({})
      require("go").setup({
        lsp_codelens = false,
        lsp_keymaps = false,
        lsp_inlay_hints = {
          enable = false,
        },
      })
    end,
  },

  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Telescope fuzzy find" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Telescope live grep" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Telescope show buffers" },
      { "<leader>be", "<cmd>Telescope buffers<cr>", desc = "Telescope show buffers" },
    },
  },

  "hashivim/vim-terraform",
}
