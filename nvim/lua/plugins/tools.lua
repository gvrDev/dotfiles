return {
  {
    "jiaoshijie/undotree",
    dependencies = "nvim-lua/plenary.nvim",
    opts = {},
    keys = {
      {
        "<leader>tu",
        function()
          require("undotree").toggle()
        end,
        desc = "Open undo tree",
        mode = "n",
      },
    },
  },

  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("harpoon"):setup({})
    end,
    keys = {
      {
        "<leader>ha",
        function()
          require("harpoon"):list():append()
        end,
        desc = "Add buffer to harpoon",
        mode = "n",
      },
      {
        "<leader>th",
        function()
          require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
        end,
        desc = "Toggle harpoon buffer list",
        mode = "n",
      },
      {
        "<leader>1",
        function()
          require("harpoon"):list():select(1)
        end,
        desc = "Go to first harpoon buffer",
        mode = "n",
      },
      {
        "<leader>2",
        function()
          require("harpoon"):list():select(2)
        end,
        desc = "Go to second harpoon buffer",
        mode = "n",
      },
      {
        "<leader>3",
        function()
          require("harpoon"):list():select(3)
        end,
        desc = "Go to third harpoon buffer",
        mode = "n",
      },
      {
        "<leader>4",
        function()
          require("harpooon"):list():select(4)
        end,
        desc = "Go to fourth harpoon buffer",
        mode = "n",
      },
    },
  },

  {
    "stevearc/oil.nvim",
    opts = {
      default_file_explorer = false,
      view_options = {
        show_hidden = true,
      },
    },
    keys = {
      {
        "<leader>.",
        "<CMD>Oil<CR>",
        desc = "Open Oil file manager",
        mode = "n",
      },
    },
  },

  {
    "David-Kunz/gen.nvim",
    dependencies = {
      { "akinsho/toggleterm.nvim", version = "*", config = true },
    },
    config = function()
      require("gen").setup({ model = "deepseek-coder:6.7b", display_mode = "split", no_auto_close = true })

      vim.keymap.set("n", "<leader>oc", "<CMD>Gen Chat<CR>", { desc = "Open Gen Chat" })
      vim.keymap.set("n", "<leader>og", "<CMD>Gen<CR>", { desc = "Open Gen" })
    end,
  },

  {
    "EthanJWright/vs-tasks.nvim",
    dependencies = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("vstask").setup({})

      vim.keymap.set(
        "n",
        "<leader>ot",
        "<CMD>lua require('telescope').extensions.vstask.tasks()<CR>",
        { desc = "Open vstask tasks" }
      )
    end,
  },
}
