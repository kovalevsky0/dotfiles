local status_ok, treesitter_configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

treesitter_configs.setup {
  ensure_installed = "all", -- options: "all", "maintained" (parsers with maintainers), list of languages
  sync_install = false,
  ignore_install = { "phpdoc" }, -- list of parsers to ignore installing
  autopairs = {
    enable = true,
  },
  highlight = {
    enable = true,
    disable = { "" },
    additional_vim_regex_highlighting = true,
  },
  indent = {
    enable = true,
    disable = {
      "yaml"
    }
  }
}
