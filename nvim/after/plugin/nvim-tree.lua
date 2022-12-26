local status, tree = pcall(require, 'nvim-tree')
if not status then return end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

tree.setup({
  actions = {
    open_file = {
      quit_on_open = true,
    }
  },
  view = {
    side = "right",
    mappings = {
      list = {
        { key = "h", action = "parent_node" },
        { key = "N", action = "create" }
      }
    }
  },
  filters = {
    custom = { "^\\.git", "^\\.vscode",  }
  }
})

vim.keymap.set('n', '<leader>b', function()
  vim.cmd('NvimTreeToggle')
  vim.cmd('NvimTreeRefresh')
end)
