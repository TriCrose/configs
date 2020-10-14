" plugins
call plug#begin(stdpath('data').'\plugged')
Plug 'yuttie/comfortable-motion.vim'
Plug 'sheerun/vim-polyglot'
Plug 'tomasiser/vim-code-dark'
Plug 'mhinz/vim-startify'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
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
noremap <A-n> #*
noremap <C-v> P
noremap <C-a> <Home>
noremap <C-s> <End>
noremap <CR> :GitGutterFold<CR>
inoremap <C-a> <Home>
inoremap <C-s> <End>
inoremap <C-Space> <C-n>
inoremap <C-S-Space> <C-p>
inoremap <C-v> <C-r>*
cnoremap <C-v> <C-r>*
cnoremap <C-a> <Home>
cnoremap <C-s> <End>

" nerdtree keybindings
" TODO: mapping to open/select nerdtree
" TODO: use s/gs for horizontal splits and v/gv for vertical
" TODO: ensure that s/S works for searching

" terminal keybindings
tnoremap <C-c> <C-\><C-n>
tnoremap <C-d> <C-c>
tnoremap <C-v> <C-\><C-n>Pi
tnoremap <C-a> <Home>
tnoremap <C-s> <End>
tnoremap <C-u> <Esc>
tnoremap <C-w> <C-S-Left><Delete>
" TODO: focus terminal from any other window

" fullscreen toggle
noremap <F11> :call ToggleFullscreen()<CR>
function! ToggleFullscreen()
    if g:neovide_fullscreen
        :let g:neovide_fullscreen=v:false
    else
        :let g:neovide_fullscreen=v:true
    endif
endfunction

" window keybindings
noremap <A-left> <C-w>h
noremap <A-down> <C-w>j
noremap <A-up> <C-w>k
noremap <A-right> <C-w>l
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

set breakindent
set showbreak=>>
set guifont=Fira\ Code\ Retina:h12
set updatetime=100
set mouse=a
set number
set autoindent tabstop=4 shiftwidth=4 expandtab
set list lcs=trail:•,tab:>-
set clipboard^=unnamed
set ignorecase
set smartcase
set autoread
set signcolumn=no
set shell=pwsh

colorscheme codedark
highlight EndOfBuffer guifg=bg

let g:comfortable_motion_interval = 10
let g:comfortable_motion_friction = 400.0
let g:comfortable_motion_air_drag = 0.0
let g:lightline = {'colorscheme': 'seoul256'}
let g:gitgutter_signs = 0
let g:gitgutter_highlight_lines = 0
let g:gitgutter_highlight_linenrs = 1

highlight GitGutterAddLineNr guifg=#a0eaa0
highlight GitGutterChangeLineNr guifg=#5fa1d8
highlight GitGutterChangeDeleteLineNr guifg=#5fa1d8
highlight GitGutterDeleteLineNr guifg=#ea8080

" TODO: save sessions on exit
" TODO: use powershell as terminal
"           - insert mode by default
"           - esc to quit insert mode
"           - ctrl+c should be forwarded properly
" TODO: better keybinds for vim-surround (e.g. csx to surround word in x)
