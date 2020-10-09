colorscheme codedark

set guifont=Fira\ Code\ Retina:h12.5
set mouse=a
set number relativenumber
set cursorline
set colorcolumn=120
set autoindent tabstop=4 shiftwidth=4 expandtab
set list lcs=tab:>-,trail:•

" keybindings
noremap <Space> :
noremap <C-Space> /
noremap <C-S-Space> ?
inoremap jj <Esc>
map s <Plug>(easymotion-f)
map S <Plug>(easymotion-F)

call plug#begin(stdpath('data').'\plugged')
Plug 'yuttie/comfortable-motion.vim'
Plug 'easymotion/vim-easymotion'
call plug#end()

" comfortable_motion.vim
let g:comfortable_motion_friction = 350.0
let g:comfortable_motion_air_drag = 0.0
