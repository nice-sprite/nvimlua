require('onenord').setup({
	theme = nil, -- "dark" or "light". Alternatively, remove the option and set vim.o.background instead
	borders = true, -- Split window borders
	fade_nc = false, -- Fade non-current windows, making them more distinguishable
	-- Style that is applied to various groups: see `highlight-args` for options
	styles = {
		comments = "NONE",
		strings = "NONE",
		keywords = "NONE",
		functions = "NONE",
		variables = "NONE",
		diagnostics = "underline",
	},
	disable = {
		background = false, -- Disable setting the background color
		cursorline = false, -- Disable the cursorline
		eob_lines = true, -- Hide the end-of-buffer lines
	},
	-- Inverse highlight for different groups
	inverse = {
		match_paren = false,
	},
	custom_highlights = {}, -- Overwrite default highlight groups
	custom_colors = {}, -- Overwrite default colors
})

local c = require('vscode.colors').get_colors();
require('vscode').setup({
    transparent = true,
    color_overrides = {
        vscLineNumber = '#00beff'
    },
    group_overrides = {
        Cursor = {fg = c.vscDarkBlue,}
    },
})
require('vscode').load();

vim.api.nvim_set_hl(0, 'Normal', {bg='none'})
vim.api.nvim_set_hl(0, 'NormalFloat', {bg='none'})

-- vim.api.nvim_create_autocmd("colorscheme", {
--     pattern = '*',
--     callback = function(ev)
--         vim.api.nvim_set_hl(0, 'Normal', {bg='none'})
--         vim.api.nvim_set_hl(0, 'NormalFloat', {bg='none'})
--     end
-- 
-- })

