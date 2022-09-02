local map = require('utils').map
---------------
-- clipboard --
---------------
-- swap ; :
map('n', ';', ':')
-- delete
map('n', 'x', '"_x')
map('v', 'x', '"_x')
map('n', 'X', '"_X')
map('v', 'X', '"_X')
map('n', 'd', '"_d')
map('v', 'd', '"_d')
map('n', 'D', '"_D')
map('v', 'D', '"_D')
-- replace
map('n', 'c', '"_c')
map('v', 'c', '"_c')
map('n', 'C', '"_C')
map('v', 'C', '"_C')
-- cut
map('n', '<leader>x', '"+x')
map('v', '<leader>x', '"+x')
map('n', '<leader>X', '"+X')
map('v', '<leader>X', '"+X')
map('n', '<leader>d', '"+d')
map('v', '<leader>d', '"+d')
map('n', '<leader>D', '"+D')
map('v', '<leader>D', '"+D')
map('n', '<leader>c', '"+c')
map('v', '<leader>c', '"+c')
map('n', '<leader>C', '"+C')
map('v', '<leader>C', '"+C')
-- visual mode retain selection after copying
map('v', 'y', 'ygv')
-- visual mode replace without copying the deleted text
map('v', 'p', '"_dP')
map('v', 'P', '"_dP')
-- cursor position after paste
map('n', 'P', 'gP')
map('n', 'gP', 'P')
map('n', 'p', 'p`]')
-- *aa as change all text operation
map('n', 'vaa', 'ggVG', {}, 'select all text')
map('n', 'yaa', 'ggVGy', {}, 'copy all text')
map('n', 'daa', 'ggVG"_d', {}, 'delete all text')
map('n', '<leader>daa', 'ggVGd', {}, 'cut all text')
map('n', 'caa', 'ggVG"_c', {}, 'change all text')
