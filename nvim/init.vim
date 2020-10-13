" plugins
call plug#begin(stdpath('data').'\plugged')
Plug 'yuttie/comfortable-motion.vim'
Plug 'sheerun/vim-polyglot'
Plug 'tomasiser/vim-code-dark'
Plug 'mhinz/vim-startify'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'
call plug#end()

" neovide settings
let g:neovide_cursor_trail_size=0.3
let g:neovide_refresh_rate=60
let g:neovide_transparency=0.95

" misc keybindings
noremap <Space> :
noremap q<Space> q:
noremap s /
noremap S ?
noremap <A-n> *#
inoremap <C-Space> <C-n>
inoremap <C-S-Space> <C-p>

noremap <F11> :call ToggleFullscreen()<CR>
function! ToggleFullscreen()
    if g:neovide_fullscreen
        :let g:neovide_fullscreen=v:false
    else
        :let g:neovide_fullscreen=v:true
    endif
endfunction

" window keybindings
noremap <A-h> <C-w>h
noremap <A-j> <C-w>j
noremap <A-k> <C-w>k
noremap <A-l> <C-w>l
noremap <A-u> <C-w>t
noremap <A-i> <C-w>b
noremap <C-Tab> <C-PageDown>
noremap <C-S-Tab> <C-PageUp>
noremap <S-A-h> :vert res -7<CR>
noremap <S-A-j> :res -7<CR>
noremap <S-A-k> :res +7<CR>
noremap <S-A-l> :vert res +7<CR>

" terminal keybindings
tnoremap <Esc> <C-\><C-n>
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
tnoremap <C-Tab> <C-\><C-n><C-PageDown>
tnoremap <C-S-Tab> <C-\><C-n><C-PageUp>

" other settings
colorscheme codedark
highlight EndOfBuffer guifg=bg
match Error /\%121v.\+/
let g:comfortable_motion_interval = 10
let g:comfortable_motion_friction = 400.0
let g:comfortable_motion_air_drag = 0.0
let g:lightline = {'colorscheme': 'seoul256'}
set guifont=Fira\ Code\ Retina:h12
set mouse=a
set number
set autoindent tabstop=4 shiftwidth=4 expandtab
set list lcs=trail:•,tab:>-
set clipboard^=unnamed
set ignorecase
set smartcase
set autoread
" TODO: save sessions on exit
" TODO: file browser
"           - searching with 's'
" TODO: use powershell as terminal
"           - insert mode by default
"           - esc to quit insert mode
"           - ctrl+c should be forwarded properly
