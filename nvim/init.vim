" neovide settings
let g:neovide_cursor_trail_size=0.3
let g:neovide_refresh_rate=60

" keybindings
noremap <Space> :
noremap q<Space> q:
noremap s /
noremap S ?
noremap <C-Tab> <C-PageDown>
noremap <C-S-Tab> <C-PageUp>
noremap <A-h> <C-w>h
noremap <A-j> <C-w>j
noremap <A-k> <C-w>k
noremap <A-l> <C-w>l

" terminal mode keybindings
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
tnoremap <C-Tab> <C-\><C-n><C-PageDown>
tnoremap <C-S-Tab> <C-\><C-n><C-PageUp>

" plugins
call plug#begin(stdpath('data').'\plugged')
Plug 'yuttie/comfortable-motion.vim'
Plug 'sheerun/vim-polyglot'
Plug 'joshdick/onedark.vim'
Plug 'mhinz/vim-startify'
Plug 'itchyny/lightline.vim'
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
set ignorecase
set smartcase
" TODO: save sessions on exit
" TODO: file browser
" TODO: use powershell as terminal

" comfortable_motion.vim
let g:comfortable_motion_interval = 10
let g:comfortable_motion_friction = 400.0
let g:comfortable_motion_air_drag = 0.0

" lightline
let g:lightline = {'colorscheme': 'one'}
