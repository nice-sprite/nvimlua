
require('nice_sprite')

--print('hi')

-- neovide config vars

if vim.g.neovide then
    vim.g.neovide_refresh_rate=144 
    vim.o.guifont = "cascadia code:h12"
    vim.g.neovide_cursor_animation_length=0.00
    vim.g.neovide_transparency=0.7
    vim.g.neovide_floating_transparency=0.6
    vim.g.neovide_floating_blur_amount_x=48.0
    vim.g.neovide_floating_blur_amount_y=42.0
    --vim.g.neovide_background_color = 1.0
    vim.g.neovide_hide_mouse_when_typing=true
end

















































