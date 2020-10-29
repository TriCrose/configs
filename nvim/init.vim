" TODO: status line:
"       - current local working directory
"       - put parent directory in file name
"       - git branch information
" TODO: install Ag and Rg
" TODO: get fzf preview working
" TODO: set exclusion paths for grep
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
set noswapfile
set number
set signcolumn=no
set autoindent tabstop=4 shiftwidth=4 expandtab
set list lcs=trail:•,tab:>-
set clipboard=unnamedplus
set ignorecase smartcase
set autoread
set splitright splitbelow
set title

" Exclusion paths for searching etc.
set wildignore=*\node_modules\*,*\__pycache__\*,*\.virtualenv*,*\.git\*,*\.svn\*,*\.hg\*,*\.CVS\*,*\.DS_Store\*

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

" Enter/Shift+Enter to search
noremap <CR> /
noremap <S-CR> ?

" Ctrl+S to toggle file browser
noremap <C-s> :NERDTreeToggleVCS<CR>

" <Leader>+p to update plugins
noremap <Leader>p :so $MYVIMRC<CR>:PlugInstall<CR>:PlugUpdate<CR>:CocUpdate<CR>

" Alt+Enter to show git changes
noremap <A-CR> :GitGutterFold<CR>gg

" <Leader>+n to clear search highlighting
noremap <Leader>n :noh<CR>

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
" KEY MAPPINGS FOR AUTOCOMPLETION
"-----------------------------------

" Ctrl+space to refresh CoC autocompletion
inoremap <silent><expr> <C-Space> coc#refresh()

" Tab/Shift+Tab to navigate autocomplete menu if it's visible
inoremap <silent><expr> <Tab> pumvisible() ? "<C-n>" : "<Tab>"
inoremap <silent><expr> <S-Tab> pumvisible() ? "<C-p>" : "<S-Tab>"

"-----------------------------------
" KEY MAPPINGS FOR WINDOWS/BUFFERS
"-----------------------------------

" Tab to move through windows/go to window number
noremap <Tab> <C-w>w
noremap <S-Tab> <C-w>W

" Alt+[h,j,k,l] (or arrows) to resize windows
noremap <A-h> :vert res -7<CR>
noremap <A-j> :res -7<CR>
noremap <A-k> :res +7<CR>
noremap <A-l> :vert res +7<CR>
noremap <A-left> :vert res -7<CR>
noremap <A-down> :res -7<CR>
noremap <A-up> :res +7<CR>
noremap <A-right> :vert res +7<CR>

" Ctrl+a to switch to the alternate buffer
noremap <C-a> <C-^>

" Ctrl+Tab/Ctrl+Shift+Tab to move between tab pages
noremap <C-Tab> :tabn<CR>
noremap <C-S-Tab> :tabp<CR>

" Ctrl+Shift+(PgUp/PgDn) to move tab pages right/left
noremap <C-S-PageDown> :tabm+<CR>
noremap <C-S-PageUp> :tabm-<CR>

"-----------------------------------
" KEY MAPPINGS FOR TERMINALS
"-----------------------------------

" Split terminal horizontally or vertically
noremap <Leader>j :new<CR>:te<CR>
noremap <Leader>l :vne<CR>:te<CR>
noremap <Leader>J :bo new<CR>:te<CR>
noremap <Leader>L :bo vne<CR>:te<CR>

" Ctrl+V to paste
tnoremap <C-v> <C-\><C-n>pa

" Escape to exit terminal mode (exception for fzf)
tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"

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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
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

" More intuitive NERDTree keybinds
let g:NERDTreeMapOpenVSplit='v'
let g:NERDTreeMapPreviewVSplit='gv'
let g:NERDTreeMapOpenSplit='s'
let g:NERDTreeMapPreviewSplit='gs'
let g:NERDTreeMapCustomOpen=''

" Closest lightline colour scheme to codedark
let g:lightline = {'colorscheme': 'seoul256'}

" FZF
noremap <C-Space> :Files<CR>
noremap <C-S-Space> :Buffers<CR>
noremap <C-p> :Lines<CR>

let g:fzf_layout = {'window': {'width': 0.5, 'height': 0.5, 'yoffset': 0 }}
let $FZF_DEFAULT_OPTS = '--layout=reverse'
