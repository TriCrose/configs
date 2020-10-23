" TODO: set exclusion paths for grep and CtrlP
" TODO: put git info (e.g. branch) in statusline
" TODO: fix gitgutter preview colours
" TODO: load most recent session on startup
" TODO: command mode yank

"-----------------------------------
" SETTINGS
"-----------------------------------

" General settings
set breakindent showbreak=>>
set guifont=Fira\ Code\ Retina:h12
set updatetime=100
set mouse=a
set relativenumber
set signcolumn=no
set autoindent tabstop=4 shiftwidth=4 expandtab
set list lcs=trail:•,tab:>-
set clipboard=unnamedplus
set ignorecase smartcase
set autoread
set splitright splitbelow
set title

" Neovide GUI settings
let g:neovide_cursor_trail_size=0.3
let g:neovide_refresh_rate=60
let g:neovide_transparency=0.95

" System-specific (not source-controlled)
if filereadable(stdpath('config') . '\system-specific.vim')
    exec 'source ' . stdpath('config') . '\system-specific.vim'
endif

"-----------------------------------
" GENERAL KEY MAPPINGS
"-----------------------------------

" Space to enter command mode
noremap <Space> :


" Enter/Shift+Enter to start a new line
noremap <CR> o
noremap <S-CR> O

" o/O to search
noremap o /
noremap O ?

" Alt+Enter to show git changes
noremap <A-CR> :GitGutterFold<CR>

" Ctrl+S to toggle file browser
noremap <C-s> :NERDTreeToggleVCS<CR>

" <Leader>+p to update plugins
noremap <Leader>p :source $MYVIMRC<CR>:PlugClean<CR>:PlugInstall<CR>

" <Leader>+n to clear search highlighting
noremap <Leader>n :noh<CR>

" Ctrl+Space/Ctrl+Shift+Space for insert-mode autocomplete
inoremap <C-Space> <C-n>
inoremap <C-S-Space> <C-p>

" Ctrl+V to paste from clipboard (insert/command mode)
inoremap <C-v> <C-r>+
cnoremap <C-v> <C-r>+

" Ctrl+Backspace to delete the previous word (insert/command mode)
inoremap <C-Backspace> <C-w>
cnoremap <C-Backspace> <C-w>

" F11 to toggle fullscreen
noremap <F11> :call ToggleFullscreen()<CR>
function! ToggleFullscreen()
    if g:neovide_fullscreen
        :let g:neovide_fullscreen=v:false
    else
        :let g:neovide_fullscreen=v:true
    endif
endfunction

"-----------------------------------
" KEY MAPPINGS FOR WINDOWS/BUFFERS
"-----------------------------------

" Ctrl+[h,j,k,l] (or arrows) to move between windows
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-left> <C-w>h
noremap <C-down> <C-w>j
noremap <C-up> <C-w>k
noremap <C-right> <C-w>l

" Alt+[h,j,k,l] (or arrows) to resize windows
noremap <A-h> :vert res -7<CR>
noremap <A-j> :res -7<CR>
noremap <A-k> :res +7<CR>
noremap <A-l> :vert res +7<CR>
noremap <A-left> :vert res -7<CR>
noremap <A-down> :res -7<CR>
noremap <A-up> :res +7<CR>
noremap <A-right> :vert res +7<CR>

" Tab/Shift+Tab to move between tab pages
noremap <Tab> :tabn<CR>
noremap <S-Tab> :tabp<CR>

" Ctrl+Tab/Ctrl+Shift+Tab to move tab pages right/left
noremap <C-Tab> :tabmove +<CR>
noremap <C-S-Tab> :tabmove -<CR>

"-----------------------------------
" KEY MAPPINGS FOR TERMINALS
"-----------------------------------

" <Leader>+j to open a split and enter a terminal
noremap <Leader>j :new<CR>:te<CR>a

" <Leader>+l to open a vsplit and enter a terminal
noremap <Leader>l :vert new<CR>:te<CR>a

" Escape to exit terminal mode
tnoremap <Esc> <C-\><C-n>

" Ctrl+u to clear the line
tnoremap <C-u> <Esc>

" Ctrl+Bksp would otherwise insert a keycode
tnoremap <C-Backspace> <Backspace>

"-----------------------------------
" PLUGINS
"-----------------------------------

let g:plug_window="botright 15new"

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

" Colours
colorscheme codedark

" Make the end of buffer line marks disappear
highlight EndOfBuffer guifg=bg

" Make underlined text look nicer
highlight Underlined guisp=#cacaca

" Colour the line numbers based on the git diff
let g:gitgutter_signs = 0
let g:gitgutter_highlight_lines = 0
let g:gitgutter_highlight_linenrs = 1
highlight GitGutterAddLineNr guifg=#a0eaa0
highlight GitGutterChangeLineNr guifg=#5fa1d8
highlight GitGutterChangeDeleteLineNr guifg=#c083ba
highlight GitGutterDeleteLineNr guifg=#ea8080

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

" NERDTree keybinds that are consistent with CtrlP
let g:NERDTreeMapOpenVSplit='v'
let g:NERDTreeMapPreviewVSplit='gv'
let g:NERDTreeMapOpenSplit='s'
let g:NERDTreeMapPreviewSplit='gs'
let g:NERDTreeMapCustomOpen=''

" Save session on exit
let g:startify_session_persistence = 1

" Closest lightline colour scheme to codedark
let g:lightline = {'colorscheme': 'seoul256'}
