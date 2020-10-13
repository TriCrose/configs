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
noremap <C-A-s> <C-v>
noremap <C-v> P
noremap £ ^
noremap <CR> :GitGutterFold<CR>
" TODO mapping to open/select nerdtree
inoremap <C-v> <C-r>*
inoremap <C-Space> <C-n>
inoremap <C-S-Space> <C-p>

" terminal keybindings
" TODO: ctrl+c exits teminal mode
" TODO: ctrl+shift+c does ctrl+c in the terminl
" TODO: alt+[h,j,k,l] and alt+[left,up,down,right] should work in terminal mode
" TODO: focusing the terminl should immediately put you in terminal mode
" TODO: ctrl+v for paste

" fullcreen toggle
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
" TODO: file browser
"           - searching with 's'
" TODO: use powershell as terminal
"           - insert mode by default
"           - esc to quit insert mode
"           - ctrl+c should be forwarded properly
" TODO: better keybinds for vim-surround (e.g. csx to surround word in x)
