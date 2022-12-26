local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

ts.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false
  },
  sync_install = false,
  ensure_installed = {
    "help",
    "javascript",
    "typescript",
    "toml",
    "json",
    "yaml",
    "css",
    "html",
    "lua",
    "rust",
    "bash",
    "svelte"
  }
}
