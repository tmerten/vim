
" map the 'leader' key to ,
let mapleader=","

"set history=1000

" search without case unless uppercase is typed
set ignorecase
set smartcase

" highlight search results as I type
set incsearch
set showmatch
set hlsearch

inoremap jk <Esc>

" clear the search buffer when hitting ESC
nnoremap <Esc> :nohlsearch<CR><Esc>

" set the minimum number of lines above and below the cursor
set scrolloff=9

" options
nnoremap cow :action EditorToggleUseSoftWraps<cr>
nnoremap col :action EditorToggleShowWhitespaces<cr>

nnoremap <leader>t :action ActivateStructureToolWindow<cr>

" to not make any sounds but start blinking
set visualbell
set noerrorbells

" make numbers display relative around the current cursor
set relativenumber " number
set number " still show number instead of 0

" actions
"nnoremap <space>T :action GotoSymbol<cr>
"nnoremap <space>a :action GotoAction<cr>
"nnoremap <space>q :action CloseContent<cr>
"nnoremap <space>Q :action ReopenClosedTab<cr>
"nnoremap <space>\ :action VimFilePrevious<cr>
"nnoremap <space>e :action SearchEverywhere<cr>
"nnoremap <space>E :action Switcher<cr>
"nnoremap <space>t :action FileStructurePopup<cr>
"nnoremap <space>b :action ToggleLineBreakpoint<cr>

" code navigation
nnoremap <leader>g :action GotoDeclaration<cr>
nnoremap <leader>s :action GotoSymbol<cr>
nnoremap <leader>n :action FindUsages<cr>
"nnoremap <leader>G :action GotoSuperMethod<cr>
"nnoremap <space>gt :action GotoTest<cr>
"nnoremap <space>k :action HighlightUsagesInFile<cr>
"nnoremap \r :action RunClass<cr>
"nnoremap <leader>r :action Run<cr>
"nnoremap \d :action DebugClass<cr>
nnoremap <leader>d :action Debug<cr>
nnoremap <leader>c :action CommentByLineComment<cr>
"nnoremap \c :action CheckStyleCurrentFileAction<cr>

" code refactoring
nnoremap <leader>r :action RenameElement<cr>

" unimpaired mappings
"nnoremap [<space> O<esc>j
"nnoremap ]<space> o<esc>k
"nnoremap [q :action PreviousOccurence<cr>
"nnoremap ]q :action NextOccurence<cr>
"nnoremap [m :action MethodUp<cr>
"nnoremap ]m :action MethodDown<cr>
"nnoremap [c :action VcsShowPrevChangeMarker<cr>
"nnoremap ]c :action VcsShowNextChangeMarker<cr>


" built-in navigation to navigated items works better
"nnoremap <c-o> :action Back<cr>
"nnoremap <c-i> :action Forward<cr>
" but preserve ideavim defaults
"nnoremap g<c-o> <c-o>
"nnoremap g<c-i> <c-i>

" built in search looks better
"nnoremap / :action Find<cr>
" but preserve ideavim search
" nnoremap g/ /
