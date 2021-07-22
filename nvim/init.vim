" TODO: use drop for coc instead of edit
" TODO: fade inactive windows so the active one is clearly visible
" TODO: status line:
"       - git branch information
" TODO: fix gitgutter preview colours
" TODO: command mode yank
" TODO: better keybinds for ';', ',' and '.'
"                  also for '*' and '#'
" TODO: show alternative buffer in status bar

"----------------------------------------
" SETTINGS
"----------------------------------------

" General settings
set linebreak
set breakindent showbreak=>>>
set guifont=Fira\ Code\ Retina:h12
set updatetime=100
set mouse=a
set noswapfile
set number
set signcolumn=no
set autoindent tabstop=4 shiftwidth=4 expandtab
set list lcs=trail:•,tab:>-
set fillchars+=fold:-
set clipboard=unnamedplus
set ignorecase smartcase
set autoread
set splitright splitbelow
set title
set cursorline
set colorcolumn=120
set noshowmode

" Exclusion paths for searching etc.
set wildignore=*\node_modules\*,*\__pycache__\*,*\.virtualenv*,*\.git\*,*\.svn\*,*\.hg\*,*\.CVS\*,*\.DS_Store\*

" Neovide GUI settings
let g:neovide_cursor_trail_size=0.3
let g:neovide_refresh_rate=60
let g:neovide_transparency=0.95

"----------------------------------------
" PLUGINS
"----------------------------------------

let g:plug_window="botright 15new"

call plug#begin(stdpath('data').'\plugged')
Plug 'sheerun/vim-polyglot'
Plug 'tomasiser/vim-code-dark'
Plug 'mhinz/vim-startify'
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'psliwka/vim-smoothie'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jremmen/vim-ripgrep'  " Requires rg in path
Plug 'airblade/vim-rooter'
Plug 'SpaceVim/vim-swig'
Plug 'junegunn/fzf', {'do':{->fzf#install()}}
call plug#end()

" vim-rooter settings
let g:rooter_silent_chdir = 1
let g:rooter_manual_only = 1

" Colour the line numbers based on the git diff
let g:gitgutter_signs = 0
let g:gitgutter_highlight_lines = 0
let g:gitgutter_highlight_linenrs = 1

" Set *.i/*.swg to SWIG filetype
au BufNewFile,BufRead *.i set filetype=swig
au BufNewFile,BufRead *.swg set filetype=swig

" FZF
let g:fzf_layout = {"window": "botright 25new"}
let $FZF_DEFAULT_COMMAND = "rg --files"
let $FZF_DEFAULT_OPTS = "--preview 'bat -p --color=always --line-range :25 {}'"

function! IsFZFTerminal()
    return getbufvar("%", "&filetype") == "fzf"
endfunction

" Status bar config
let g:lightline =
\ {
\   'colorscheme':  'seoul256',
\   'enable':       {
\                       'tabline': 0,
\                       'statusline': 1
\                   },
\   'component':    {
\                    'filename': '%f : %l',
\                    'lineinfo': '%{line("$")} lines',
\                    'colinfo': 'col %c'
\                   },
\   'active':       {
\                    'left': [
\                       ['mode', 'paste'],
\                       ['filename', 'modified'],
\                       ['lineinfo']
\                   ],
\                    'right': [
\                       ['winnr'],
\                       ['fileformat', 'fileencoding', 'filetype'],
\                       ['colinfo']
\                   ]},
\   'inactive':     {
\                    'left': [
\                       ['filename', 'modified'],
\                       ['lineinfo']
\                   ],
\                    'right': [
\                       ['winnr']
\                   ]},
\ }

"----------------------------------------
" COLOURS
"----------------------------------------

colorscheme codedark

" Slightly darker background
highlight Normal guibg=#181818
highlight LineNr guibg=#181818
highlight EndOfBuffer guibg=#181818
highlight NonText guibg=#181818
highlight ModeMsg guibg=#181818
highlight VertSplit guibg=#222222

" Current line highlight
highlight CursorLine guibg=#222222
highlight CursorLineNr guibg=#222222

" Make the end of buffer line marks disappear
highlight EndOfBuffer guifg=bg

" Make underlined text look nicer
highlight Underlined guisp=#cacaca

" Turn off internal error highlighting
highlight clear Error

" Folds
highlight Folded gui=underline guisp=#3f3f46

" Tab line
highlight TabLine guifg=#707070 guibg=#222222
highlight TabLineFill guibg=#222222
highlight TabLineSel guibg=#222222 guisp=#cacaca

" Coc errors/warnings
highlight CocErrorSign guifg=#df4040
highlight CocErrorHighlight gui=underline guisp=#df4040
highlight CocWarningSign guifg=#e0d000
highlight CocWarningHighlight gui=underline guisp=#e0d000

" GitGutter colours
highlight GitGutterAddLineNr guifg=#a0eaa0
highlight GitGutterChangeLineNr guifg=#5fa1d8
highlight GitGutterChangeDeleteLineNr guifg=#c083ba
highlight GitGutterDeleteLineNr guifg=#ea8080

"----------------------------------------
" GENERAL KEY MAPPINGS
"----------------------------------------

" Space to enter command mode
noremap <Space> :

" Enter/Shift+Enter to search
noremap <CR> /
noremap <S-CR> ?

" Ctrl+o/p to move back/forward through the jump list
noremap <C-p> <C-i>

" Shift+k to yank
noremap K y

" Use f/s to find forwards/backwards
noremap s F
noremap F t
noremap S T

" Use t to delete and enter insert mode
noremap t s
noremap T S

" Shift+3/4 for home/end
noremap £ ^

" <Leader>+h,m,l instead of zt/zz/zb
noremap <Leader>h zt
noremap <Leader>m zz
noremap <Leader>l zb

" Ctrl+a to switch to the alternate buffer
noremap <C-a> <C-^>

" Ctrl+s to search for the word under the cursor
noremap <C-s> :Rg<CR>
noremap <C-A-s> :Rg <cword> %<CR>

" Ctrl+z to show working directory
noremap <C-z> :pwd<CR>

" Ctrl+Alt+z to go to the project root
noremap <C-A-z> :Rooter<CR>:echom "vim-rooter: " . getcwd()<CR>

" Ctrl+Space to trigger file finder
noremap <silent> <C-Space> :FZF<CR>

" <Leader>+p to update plugins/coc
noremap <Leader>p :so $MYVIMRC<CR>:PlugUpdate<CR>:CocUpdate<CR>

" Ctrl+n to clear search highlighting
noremap <C-n> :noh<CR>

" Ctrl+v to paste from clipboard (insert/command mode)
inoremap <C-v> <C-r>+
cnoremap <C-v> <C-r>+

" Ctrl+Backspace to delete the previous word (insert/command mode)
inoremap <C-Backspace> <C-w>
cnoremap <C-Backspace> <C-w>

" Alt+Enter to show git changes
let g:is_code_folded = v:false
noremap <silent> <A-CR> :call ToggleGitGutterFold()<CR>
function! ToggleGitGutterFold()
    if g:is_code_folded
        GitGutterFold
        let g:is_code_folded = v:false
    else
        GitGutterFold|normal gg
        let g:is_code_folded = v:true
    endif

    " For some reason unfolding causes lightline to select the wrong window,
    " so we need to call update here to fix it
    call lightline#update()
endfunction

" F2 to rename current file
nnoremap <silent> <F2> :CocCommand workspace.renameCurrentFile<CR>

" F11 to toggle fullscreen
noremap <F11> :call ToggleFullscreen()<CR>
function! ToggleFullscreen()
    if g:neovide_fullscreen
        let g:neovide_fullscreen=v:false
    else
        let g:neovide_fullscreen=v:true
    endif
endfunction

" GitGutter commands for pending hunks
map ghp <Plug>(GitGutterPreviewHunk)
map ghs <Plug>(GitGutterStageHunk)
map ghu <Plug>(GitGutterUndoHunk)

" GitGutter text object selectors for pending hunks
omap ih <Plug>(GitGutterTextObjectInnerPending)
omap ah <Plug>(GitGutterTextObjectOuterPending)
xmap ih <Plug>(GitGutterTextObjectInnerVisual)
xmap ah <Plug>(GitGutterTextObjectOuterVisual)

"----------------------------------------
" KEY MAPPINGS FOR INTELLISENSE
"----------------------------------------

" Ctrl+Space to refresh Coc autocompletion
inoremap <silent><expr> <C-Space> coc#refresh()

" Tab/Shift+Tab to navigate autocomplete menu if it's visible
inoremap <silent><expr> <Tab> pumvisible() ? "<C-n>" : "<Tab>"
inoremap <silent><expr> <S-Tab> pumvisible() ? "<C-p>" : "<S-Tab>"

" Ctrl+x/Ctrl+Alt+x to go to definition/declaration
map <C-x> <Plug>(coc-definition)
map <C-A-x> <Plug>(coc-declaration)

" Ctrl+Shift+Space to show documentation
noremap <silent> <C-S-Space> :call CocAction("doHover")<CR>

" Alt+o to switch header/source
noremap <silent> <A-o> :CocCommand clangd.switchSourceHeader<CR>

" Text object selectors for functions
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)

" Text object selectors for classes/structs
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" ]+e/[+e to navigate Coc diagnostics
map <silent> ]e <Plug>(coc-diagnostic-next)
map <silent> [e <Plug>(coc-diagnostic-prev)

"----------------------------------------
" KEY MAPPINGS FOR BUFFERS/WINDOWS/TABS
"----------------------------------------

" Tab/Shift+Tab to cycle through windows or go to window number
noremap <Tab> <C-w>w
noremap <S-Tab> <C-w>W

" Alt+[h,j,k,l] (or arrows) to resize windows
noremap <A-h> :vert res -5<CR>
noremap <A-j> :res -5<CR>
noremap <A-k> :res +5<CR>
noremap <A-l> :vert res +5<CR>
noremap <A-left> :vert res -5<CR>
noremap <A-down> :res -5<CR>
noremap <A-up> :res +5<CR>
noremap <A-right> :vert res +5<CR>

" Shift+Alt+[h,j,k,l] (or arrows) to resize windows in greater amounts
noremap <S-A-h> :vert res -25<CR>
noremap <S-A-j> :res -25<CR>
noremap <S-A-k> :res +25<CR>
noremap <S-A-l> :vert res +25<CR>
noremap <S-A-left> :vert res -25<CR>
noremap <S-A-down> :res -25<CR>
noremap <S-A-up> :res +25<CR>
noremap <S-A-right> :vert res +25<CR>

" Open/close tabs
noremap <A-n> :tabe<CR>
noremap <A-s> :tab sp<CR>
noremap <A-q> :tabc<CR>

" Ctrl+Tab/Ctrl+Shift+Tab to navigate tabs
noremap <C-Tab> <C-PageDown>
noremap <C-S-Tab> <C-PageUp>

" Ctrl+Shift+[PgUp,PgDn] to move tab pages right/left
noremap <C-S-PageDown> :tabm+<CR>
noremap <C-S-PageUp> :tabm-<CR>

" Go to tab number
noremap <A-1> 1gt
noremap <A-2> 2gt
noremap <A-3> 3gt
noremap <A-4> 4gt
noremap <A-5> 5gt
noremap <A-6> 6gt
noremap <A-7> 7gt
noremap <A-8> 8gt
noremap <A-9> 9gt
noremap <A-0> 10gt

" Split buffer in any direction
noremap <C-j> :sp<CR>
noremap <C-l> :vs<CR>
noremap <C-k> :abo sp<CR>
noremap <C-h> :abo vs<CR>
noremap <C-down> :sp<CR>
noremap <C-right> :vs<CR>
noremap <C-up> :abo sp<CR>
noremap <C-left> :abo vs<CR>

"----------------------------------------
" KEY MAPPINGS FOR TERMINALS
"----------------------------------------

" Ctrl+V to paste
tnoremap <C-v> <C-\><C-n>pa

" Esc to exit terminal-mode (or, if in FZF terminal, just do normal Esc)
tnoremap <silent><expr> <Esc> IsFZFTerminal() ? "<Esc>" : "<C-\><C-n>"

" Ctrl+Bksp would normally insert a keycode (except in FZF, then just delete word)
tnoremap <silent><expr> <C-Backspace> IsFZFTerminal() ? "<C-w>" : "<Backspace>"

" Ctrl+u to clear the line
tnoremap <silent><expr> <C-u> IsFZFTerminal() ? "<C-u>" : "<Esc>"

"----------------------------------------
" SYSTEM-SPECIFIC
"----------------------------------------

if filereadable(stdpath('config') . '\system-specific.vim')
    exec 'source ' . stdpath('config') . '\system-specific.vim'
endif
