" plugins
call plug#begin(stdpath('data').'\plugged')
Plug 'sheerun/vim-polyglot'
Plug 'tomasiser/vim-code-dark'
Plug 'mhinz/vim-startify'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'psliwka/vim-smoothie'
Plug 'kien/ctrlp.vim'
call plug#end()

" neovide settings
let g:neovide_cursor_trail_size=0.3
let g:neovide_refresh_rate=60
let g:neovide_transparency=0.95

" misc keybindings
noremap <Space> :
noremap q<Space> q:
noremap <CR> /
noremap <S-CR> ?
noremap <Tab> }
noremap <S-Tab> {
noremap <A-n> #*
noremap <C-a> GVgg
noremap <A-CR> :GitGutterFold<CR>
noremap <C-s> :NERDTreeToggleVCS<CR>
noremap <Leader>p :source $MYVIMRC<CR>:PlugClean<CR>:PlugInstall<CR>
inoremap <C-Space> <C-n>
inoremap <C-S-Space> <C-p>
inoremap <C-v> <C-r>*
inoremap <C-Backspace> <C-w>
cnoremap <C-v> <C-r>*
cnoremap <C-Backspace> <C-w>
" TODO: command mode yank

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
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <A-h> :vert res -7<CR>
noremap <A-j> :res -7<CR>
noremap <A-k> :res +7<CR>
noremap <A-l> :vert res +7<CR>

noremap <C-left> <C-w>h
noremap <C-down> <C-w>j
noremap <C-up> <C-w>k
noremap <C-right> <C-w>l
noremap <A-left> :vert res -7<CR>
noremap <A-down> :res -7<CR>
noremap <A-up> :res +7<CR>
noremap <A-right> :vert res +7<CR>

noremap <C-Tab> :bn<CR>
noremap <C-S-Tab> :bp<CR>

" terminal keybindings
" TODO: fix multiline paste
tnoremap <C-v> <C-\><C-n>Pi
tnoremap <C-u> <Esc>
tnoremap <Esc> <C-\><C-n>
tnoremap <C-Backspace> <C-S-Left><Delete>

set breakindent showbreak=>>
set guifont=Fira\ Code\ Retina:h12
set updatetime=100
set mouse=a
set relativenumber
set autoindent tabstop=4 shiftwidth=4 expandtab
set list lcs=trail:•,tab:>-
set clipboard^=unnamed
set ignorecase smartcase
set autoread
set signcolumn=no
set shell=cmd
set splitright splitbelow

colorscheme codedark
highlight EndOfBuffer guifg=bg
highlight Underlined guisp=#cacaca

let g:comfortable_motion_interval = 10
let g:comfortable_motion_friction = 400.0
let g:comfortable_motion_air_drag = 0.0
let g:lightline = {'colorscheme': 'seoul256'}
let g:gitgutter_signs = 0
let g:gitgutter_highlight_lines = 0
let g:gitgutter_highlight_linenrs = 1
" turn off gitgutter bindings so <Leader>h is free
" TODO: fix gitgutter hunk preview not working
let g:gitgutter_map_keys = 0
let g:startify_session_persistence = 1

let g:ctrlp_map = '<C-Space>'
let g:ctrlp_cmd = 'CtrlPCurWD'
let g:ctrlp_by_filename = 1
let g:ctrlp_match_window = 'min:15,max:15'
let g:ctrlp_prompt_mappings = {
    \ 'OpenMulti()': ['<CR>', '<C-CR>'],
    \ 'AcceptSelection("e")': ['<C-o>', '<2-LeftMouse>'],
    \ 'AcceptSelection("h")': ['<C-s>'],
    \ 'AcceptSelection("v")': ['<c-v>', '<RightMouse>'],
    \ 'PrtDeleteWord()': ['<C-Backspace>'],
\}

let g:NERDTreeMapOpenVSplit='v'
let g:NERDTreeMapPreviewVSplit='gv'
let g:NERDTreeMapOpenSplit='s'
let g:NERDTreeMapPreviewSplit='gs'
let g:NERDTreeMapCustomOpen=''

highlight GitGutterAddLineNr guifg=#a0eaa0
highlight GitGutterChangeLineNr guifg=#5fa1d8
highlight GitGutterChangeDeleteLineNr guifg=#c083ba
highlight GitGutterDeleteLineNr guifg=#ea8080

" TODO: fix terminal buffers becoming unlisted when inactive
" TODO: use powershell as terminal
" TODO: load most recent session on startup
