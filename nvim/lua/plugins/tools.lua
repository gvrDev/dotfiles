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
}
