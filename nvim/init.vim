" TODO: change background color based on how far down the file
" TODO: use drop for coc instead of edit
" TODO: fade inactive windows so the active one is clearly visible
" TODO: status line:
"       - git branch information
" TODO: fix gitgutter preview colours
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
set cursorline

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
" PLUGINS
"-----------------------------------

let g:plug_window="botright 15new"

call plug#begin(stdpath('data').'\plugged')
Plug 'sheerun/vim-polyglot'
Plug 'tomasiser/vim-code-dark'
Plug 'mhinz/vim-startify'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'psliwka/vim-smoothie'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jremmen/vim-ripgrep'  " Requires rg in path
call plug#end()

" Colour the line numbers based on the git diff
let g:gitgutter_signs = 0
let g:gitgutter_highlight_lines = 0
let g:gitgutter_highlight_linenrs = 1

" Status bar config
let g:lightline = {
\   'colorscheme':  'seoul256',
\   'component':    {'filename': '%f',
\                    'lineinfo': 'line %l/%{line("$")}',
\                    'colinfo': 'col %c/%{col("$")-1}'},
\   'active':       {'left': [
\                       ['mode', 'paste'],
\                       ['filename', 'modified'],
\                       ['lineinfo'],
\                       ['colinfo']
\                   ],
\                    'right': [
\                       ['winnr'],
\                       ['fileformat', 'fileencoding', 'filetype']
\                   ]},
\   'inactive':     {'left': [
\                       ['filename', 'modified'],
\                       ['lineinfo'],
\                       ['colinfo']
\                   ],
\                    'right': [
\                       ['winnr']
\                   ]}
\ }

"-----------------------------------
" COLOURS
"-----------------------------------

colorscheme codedark

" Slightly darker background
highlight Normal guibg=#181818
highlight LineNr guibg=#181818
highlight EndOfBuffer guibg=#181818
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

" Like colorcolumn but error highlight
autocmd WinNew,VimEnter * :match ErrorMsg /\%121v./

" Folds
highlight Folded gui=underline guisp=#3f3f46

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

"-----------------------------------
" GENERAL KEY MAPPINGS
"-----------------------------------

" Space to enter command mode
noremap <Space> :

" Enter/Shift+Enter to search
noremap <CR> /
noremap <S-CR> ?

" Ctrl+o/p to move back/forward through the jump list
noremap <C-p> <C-i>

" Shift+k to yank
noremap K y

" Ctrl+a to switch to alternate buffer
noremap <C-a> <C-^>

" Ctrl+s to search for the word under the cursor
noremap <C-s> :Rg<CR>

" <Leader>+p to update plugins
noremap <Leader>p :so $MYVIMRC<CR>:PlugInstall<CR>:PlugUpdate<CR>:CocUpdate<CR>

" Ctrl+n to clear search highlighting
noremap <C-n> :noh<CR>

" Ctrl+V to paste from clipboard (insert/command mode)
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

    " For some reason unfolding causing lightline to select the wrong window,
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

" GitGutter
map ghp <Plug>(GitGutterPreviewHunk)
map ghs <Plug>(GitGutterStageHunk)
map ghu <Plug>(GitGutterUndoHunk)

"-----------------------------------
" KEY MAPPINGS FOR INTELLISENSE
"-----------------------------------

" Ctrl+Space to refresh Coc autocompletion
inoremap <silent><expr> <C-Space> coc#refresh()

" Tab/Shift+Tab to navigate autocomplete menu if it's visible
inoremap <silent><expr> <Tab> pumvisible() ? "<C-n>" : "<Tab>"
inoremap <silent><expr> <S-Tab> pumvisible() ? "<C-p>" : "<S-Tab>"

" Ctrl+z/x to go to declaration/definition
map <C-z> <Plug>(coc-declaration)
map <C-x> <Plug>(coc-definition)

" Ctrl+Space/Ctrl+Shift+Space to show documentation/parameter hints
noremap <silent> <C-Space> :call CocAction("doHover")<CR>
noremap <silent> <C-S-Space> :call CocAction("showSignatureHelp")<CR>

" Alt+o to switch header/source
noremap <silent> <A-o> :CocCommand clangd.switchSourceHeader<CR>

" ]+p/[+p to navigate Coc diagnostics
map <silent> ]e <Plug>(coc-diagnostic-next)
map <silent> [e <Plug>(coc-diagnostic-prev)

"-----------------------------------
" KEY MAPPINGS FOR WINDOWS/BUFFERS
"-----------------------------------

" Tab/Shift+Tab to cycle through windows
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

" Ctrl+Tab/Ctrl+Shift+Tab to move between tab pages
noremap <C-Tab> :tabn<CR>
noremap <C-S-Tab> :tabp<CR>

" Ctrl+Shift+(PgUp/PgDn) to move tab pages right/left
noremap <C-S-PageDown> :tabm+<CR>
noremap <C-S-PageUp> :tabm-<CR>

" Split buffer in any direction
noremap <C-j> :sp<CR>
noremap <C-l> :vs<CR>
noremap <C-k> :abo sp<CR>
noremap <C-h> :abo vs<CR>
noremap <C-down> :sp<CR>
noremap <C-right> :vs<CR>
noremap <C-up> :abo sp<CR>
noremap <C-left> :abo vs<CR>

"-----------------------------------
" KEY MAPPINGS FOR TERMINALS
"-----------------------------------

" Ctrl+V to paste
tnoremap <C-v> <C-\><C-n>pa

" Escape to exit terminal mode
tnoremap <Esc> <C-\><C-n>

" Ctrl+u to clear the line
tnoremap <C-u> <Esc>

" Ctrl+Bksp would otherwise insert a keycode
tnoremap <C-Backspace> <Backspace>
