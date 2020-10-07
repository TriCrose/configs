colorscheme codedark

set guifont=Fira\ Code\ Retina:h12.5
set mouse=a
set number relativenumber
set cursorline
set autoindent tabstop=4 shiftwidth=4 expandtab
set list lcs=tab:>-,space:·

call plug#begin(stdpath('data').'\plugged')
Plug 'yuttie/comfortable-motion.vim'
call plug#end()

" comfortable_motion.vim
let g:comfortable_motion_friction = 350.0
let g:comfortable_motion_air_drag = 0.0
