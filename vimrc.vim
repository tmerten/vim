" File: vimrc.vim
" Author: Thorsten Merten
" Description: With lots of love, see gvimrc.vim for more love

let basepath=$HOME.'/Seafile/sys/vim'
let &runtimepath=&runtimepath.','.basepath
call plug#begin(basepath.'/plugged')

" COLORS
Plug 'jonathanfilip/vim-lucius'
Plug 'chriskempson/base16-vim'

" PLUGINS
Plug 'tpope/vim-sensible' "some sensible defaults

Plug 'ervandew/supertab' "tab for the rescue

Plug 'ihacklog/HiCursorWords' "underlines the word under the cursor to see the word in your surrounding

"Plug 'vim-scripts/L9' | Plug 'vim-scripts/FuzzyFinder' "cmd-t but fits my needs, vimscipt only, less hassle
Plug 'kien/ctrlp.vim'

Plug 'MarcWeber/vim-addon-mw-utils' "needed for snipmate
Plug 'tomtom/tlib_vim' "needed for snipmate
Plug 'garbas/vim-snipmate' "text-mate style snippets

Plug 'lervag/vimtex' "latex

Plug 'vim-scripts/vcscommand.vim' "svn, git, ... client

Plug 'scrooloose/nerdcommenter' "cc, ci, cu

Plug 'davidhalter/jedi-vim' "python completion

Plug 'scrooloose/syntastic' "syntax checking

Plug 'mileszs/ack.vim' "ack for vim (actually using it not enough)

Plug 'vim-scripts/Tagbar' "get a taglist in vim

Plug 'bling/vim-airline' "nicer buffer and split infos
Plug 'vim-airline/vim-airline-themes' "actually for the bubblegum theme

Plug 'terryma/vim-multiple-cursors' "sublime like multiple cursors with c-n

"Plug 'LucHermitte/local_vimrc'
Plug 'MarcWeber/vim-addon-local-vimrc' "source local vimrcs (e.g. to define latex-specific abbrevs)

Plug 'godlygeek/tabular'

" minimaps, both don't work for me
"Plug 'severin-lemaignan/vim-minimap'
"Plug 'koron/minimap-vim'
call plug#end()

" ************************************************* 
"  Theme and Colors
" ************************************************* 
set background=light
colorscheme base16-google
"set background=dark
"colorscheme lucius

if has("gui_macvim")
  "set guifont=Menlo\ Regular:h13
  set guifont=Meslo\ LG\ M\ Regular\ for\ Powerline:h14
  set guioptions-=r
  set guioptions-=L
  set nobeval
else
  set mouse=a
endif "gui_MacVim

" ************************************************* 
" Basic VIM Settigns
" ************************************************* 

" map the 'leader' key to ,
let mapleader=","
let maplocalleader="-"

" no need for VI compability (and we want to run some plugins)
set nocompatible

" do not use the annoying swapfiles, only memory
set noswapfile
set undodir=~/.vim
set backupdir=~/.vim

" make default encoding UTF8
set encoding=utf-8

" let vim hide unsaved buffers
set hidden

" search without case unless uppercase is typed
set ignorecase
set smartcase

" highlight search results as I type
set incsearch
set showmatch
set hlsearch

" clear the search and the highlighting
" Press Space to turn off highlighting and clear any message already displayed.
if has('gui_running')
  nnoremap <silent> <Esc> :nohlsearch<CR><Esc>
else
  augroup no_highlight
    autocmd TermResponse * nnoremap <Esc> :noh<CR><Esc>
  augroup END
end

" toggle highlighting the word under the curser
let g:HiCursorWords_delay = 500
let g:HiCursorWords_hiGroupRegexp='' " does not work correctly with other plugins like ctags
let g:HiCursorWords_debugEchoHiName = 0

" set the minimum number of lines above and below the cursor
set scrolloff=9

" copy the intention of the previous line to the new line
set autoindent

" show partial command in last line of the screen
set showcmd

" leave insert mode by pressing jk
inoremap jk <esc>

" to not make any sounds but start blinking
set visualbell
set noerrorbells

" tell vim that we have a fast terminal connection (i was told this makes vim faster)
set ttyfast

" set indention to 2 and soft tabs
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
"autocmd FileType tex setlocal softtabstop=2 expandtab
autocmd FileType make setlocal tabstop=4 softtabstop=0 shiftwidth=4 noexpandtab

" make numbers display relative around the current cursor
set relativenumber " number
set number " still show number instead of 0

" use nicer listchars
set list
set listchars=tab:▸\ ,eol:¬,trail:~,extends:>,precedes:<

" use enhanced command-line completion with TAB
set wildmenu
" list all matches and complete till the longest string
set wildmode=list:longest

set spellfile=$HOME/Seafile/sys/vim/personal-wordlist.utf-8.add
" *************************************************
" Nagivation settings
" *************************************************

" move though split windows using alt,cmd,arrow
noremap <S-M-Left>  <C-w>h
"noremap <S-M-Left> :vsplit<CR>
noremap <S-M-Right> <C-w>l
"noremap <S-M-Right> :vsplit<CR><C-w>l
noremap <S-M-Up>    <C-w>k
"noremap <S-M-Up> :split<CR>
noremap <S-M-Down>  <C-w>j
"noremap <S-M-Down> :split<CR><C-w>j

nmap <M-D-Right> <Plug>AirlineSelectNextTab
nmap <M-D-Left> <Plug>AirlineSelectPrevTab

" who needs umlauts in normal mode? use for next/prev sentence and jump
nnoremap ö (
nnoremap ä )
nnoremap ü <C-]>

" jump inside help with enter and backspace
autocmd FileType help :nnoremap <buffer> <CR> <C-]>
autocmd FileType help :nnoremap <buffer> <BS>  <C-t>

" select and close quickfix window by pressing Space instead of CR
autocmd FileType qf nnoremap <buffer> <Space> <CR>:cclose<CR>:lclose<CR>

" *************************************************
" Modification mappings
" *************************************************

" source the vimrc automatically on write 
    " (does not prevent you from restarting vim)
    autocmd! BufWritePost $HOME/Seafile/sys/vim/vimrc.vim source %
    autocmd! BufWritePost $HOME/Seafile/sys/vim/vimrc.vim AirlineRefresh
    nnoremap <leader>ev :edit $HOME/Seafile/sys/vim/vimrc.vim"<CR>
    nnoremap <leader>eg :edit $HOME/Seafile/sys/vim/gvimrc.vim"<CR>

    " sort selection alphabetically
    vnoremap <leader>s :sort<CR>

" make visual mode permanent when using <> for indentation
vnoremap < <gv
vnoremap > >gv

" Uppercase the current word
inoremap <c-u> <esc>viwUea
nnoremap <c-u> viwU


" *************************************************
" VIM-Airline
" *************************************************
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_min_count = 0
"let g:airline#extensions#tabline#show_close_button = 1
"let g:airline#extensions#tabline#close_symbol = 'X'
let g:airline_theme="base16"

" ************************************************* 
" CTRL P Vim
" *************************************************
set wildignore+=*/tmp/*,*.*.so,*.*.swp,*.zip,*.exe,*.dll,*.bak,*.orig
set wildignore+=*.swp,*.skim,*.aux,*.gz,*.zip,*.pdf,*.dvi,*.DS_Store,*.pyc
set wildignore+=*.acn,*.acr,*.alg,*.bbl,*.blg,*-blx.bib,*.fdb_latexmk
set wildignore+=*.gls,*.ist,*.lof,*.lol,*.lot,*.out,*.run.xml
set wildignore+=*.fls,*.fls,*.glg,*.glo,*.synctex.gz,*.toc,*.xdy

let g:ctrlp_map = '<D-t>'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:15'

" ************************************************* 
" Fuzzy Finder
" *************************************************
"nnoremap <leader>m :FufBuffer<cr>
"nnoremap <leader>l :FufLine<cr>
"nnoremap <leader>c :FufChanceList<cr>
"nnoremap <D-BS> :FufJumpList<CR>
"let g:fuf_buffer_keyDelete = "<BS>"

" Exclude files that end on...
let g:fuf_coveragefile_exclude = '\v\~$|\.(o|exe|dll|bak|orig|swp|skim|aux|gz|zip|pdf|dvi|DS_Store|pyc)$'
" Exclude files starting with dot
let g:fuf_coveragefile_exclude .= '|(^|[/\\])\.(hg|git|bzr|svn)($|[/\\])'
" Exclude __pycache__, __whatever__
let g:fuf_coveragefile_exclude .= '|(^|[/\\])(__.*__)($|[/\\])'
" limit number of displayed matches
" (makes response instant even on huge source trees)
" let g:fuf_enumeratingLimit = 60
let g:fuf_reuseWindow = 0
let g:fuf_modesDisable = [ 'mrufile', 'mrucmd', 'bookmarkfile', 'tag', 'buffertag', 'taggedfile', 'help', 'givenfile', 'givendir', 'givencmd', 'callbackfile', 'callbackitem' ]

" actually not fuzzy finder...
let g:netrw_list_hide= '.*\.swp$,\.svn$'

" ************************************************* 
" Syntastic
" *************************************************
let g:syntastic_python_python_exec = '/usr/local/var/pyenv/shims/python'
let g:syntastic_check_on_wq = 0
let g:syntastic_python_pylint_args = '--max-line-length=110 --disable=C0330 --method-rgx "[a-z_][a-z0-9_]{2,60}$"'
" allow longer lines, disable bad-continuation warnings (not my style), allow longer method names
let g:syntastic_error_symbol = "☢"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_style_error_symbol = "↯"
let g:syntastic_style_warning_symbol = "↯"
let g:syntastic_enable_balloons = 0
"let g:syntastic_check_on_open = 1
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1


" ************************************************* 
" Jedi Vim (python)
" ************************************************* 
let g:jedi#show_call_signatures = 1
nnoremap <leader>b iimport pdb; pdb.set_trace()<ESC>
"autocmd FileType python let g:SuperTabDefaultCompletionType = "context"
autocmd FileType python let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
"autocmd FileType python let g:HiCursorWords_hiGroupRegexp='Function\|Statement\|Identifier\|Constant\|CursorLine.*'


" ************************************************* 
" Python Mode (python, pymode)
" ************************************************* 
"let g:pymode_python = 'python3'
"let g:pymode_folding = 0
"let g:pymode_virtualenv = 1
"let g:pymode_lint_on_fly = 1
"let g:pymode_rope_goto_definition_bind = '<leader>g'
"let g:pymode_rope_goto_definition_cmd = 'e'
"let g:pymode_rope_rename_bind = '<leader>r'
"let g:pymode_rope_rename_module_bind = '<leader>R'


" ************************************************* 
" Tagbar
" *************************************************
let g:tagbar_width = 40
let g:tagbar_foldlevel = 3
set tags=./tags;
let &tags=&tags.basepath.'/tags'
nnoremap <leader>t :TagbarToggle<cr>
"let g:tagbar_type_tex = {
  "\ 'ctagstype' : 'latex',
  "\ 'kinds' : [
  "\ 's:sections',
  "\ 'g:graphics:0:0',
  "\ 'l:labels',
  "\ 'r:refs:1:0',
  "\ 'p:pagerefs:1:0'
  "\ ],
  "\ 'sort' : 0,
  "\ 'deffile' : expand('<sfile>:p:h') . '/ctags/latex.cnf'
  "\ }


" *************************************************
" vimtex (latex)
" *************************************************
let g:tex_flavor = "latex" "open files as fileformat=tex instead of plaintex
let g:vimtex_enable = 1
let g:vimtex_fold_enabled = 0
let g:vimtex_mappings_enabled = 0
let g:vimtex_quickfix_mode = 2
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_latexmk_options = '-pdf -pdflatex="pdflatex -synctex=1 \%O \%S"'

" Use skim
let g:vimtex_view_method = 'general'
let g:vimtex_view_general_viewer = 'skim_reaload_show.sh'
"'/Applications/Skim.app/Contents/SharedSupport/displayline'
let g:vimtex_view_general_options = '@line @pdf @tex'
let g:vimtex_labels_enabled = 1
let g:vimtex_index_split_pos = 'vert rightbelow'
let g:vimtex_index_split_width = 40

nnoremap <leader>ll <Plug>(vimtex-compile-toggle)
autocmd FileType tex nmap <leader>ll <Plug>(vimtex-compile-toggle)
autocmd FileType tex nmap <leader>lo <Plug>(vimtex-compile-output)
autocmd FileType tex nmap <leader>lk <Plug>(vimtex-stop)
autocmd FileType tex nmap <leader>lK <Plug>(vimtex-stop-all)
autocmd FileType tex nmap <leader>le <Plug>(vimtex-errors)
autocmd FileType tex nmap <leader>lc <Plug>(vimtex-clean)
autocmd FileType tex nmap <leader>lC <Plug>(vimtex-clean-full)
autocmd FileType tex nmap <leader>lg <Plug>(vimtex-status)
autocmd FileType tex nmap <leader>lG <Plug>(vimtex-status-all)
autocmd FileType tex nmap <leader>lt <Plug>(vimtex-toc-toggle)
autocmd FileType tex nmap <leader>lv <Plug>(vimtex-view)
autocmd FileType tex nmap <leader>t <Plug>(vimtex-toc-toggle)
autocmd FileType tex set spell spelllang=en_us,de_de
autocmd FileType tex let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
autocmd FileType tex let g:HiCursorWords_hiGroupRegexp='Special\|Statement\|texCmdName\|Special'

" *************************************************
" Source local (project specific) vimrcs
" *************************************************
let g:local_vimrc = {'names':['vimrc.local'],'hash_fun':'LVRHashOfFile'}

" *************************************************
" Functions
" *************************************************
function! StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

function! CreateLatexLabel()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    " Do the business:
    :normal yypVu
    :s/ /-/ge
    :normal ct{\label
    :normal la:
    " Clean up: move cursor before label
    let @/=_s
    call cursor(l+1,8)
endfunction

autocmd BufWritePre *.py,*.rb,*.js,*.rhtml,*.html,*.java,*.tex :call StripTrailingWhitespaces()
