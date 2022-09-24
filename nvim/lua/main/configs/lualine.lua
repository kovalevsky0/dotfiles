local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

lualine.setup {
  icons_enabled = true,
  theme = 'duskfox',
  options = {
    section_separators = '',
    component_separators = ''
  },
}

