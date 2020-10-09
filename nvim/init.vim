" gui
let g:neovide_cursor_trail_size=0.3
let g:neovide_refresh_rate=60

" keybindings
noremap <Space> :
noremap <C-Space> /
noremap <C-S-Space> ?
inoremap jj <Esc>
map s <Plug>(easymotion-f)
map S <Plug>(easymotion-F)

" plugins
call plug#begin(stdpath('data').'\plugged')
Plug 'yuttie/comfortable-motion.vim'
Plug 'easymotion/vim-easymotion'
Plug 'sheerun/vim-polyglot'
Plug 'joshdick/onedark.vim'
call plug#end()

" settings
colorscheme onedark
highlight EndOfBuffer guifg=bg

match Error /\%121v.\+/
set guifont=Fira\ Code\ Retina:h13
set mouse=a
set number
set autoindent tabstop=4 shiftwidth=4 expandtab
set list lcs=trail:•,tab:>-
set clipboard^=unnamed

" comfortable_motion.vim
let g:comfortable_motion_interval = 10
let g:comfortable_motion_friction = 400.0
let g:comfortable_motion_air_drag = 0.0
