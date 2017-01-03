if has("gui_macvim")
  macmenu &File.New\ Tab key=<nop>
  macmenu &File.Close key=<nop>
  "map <D-t> :FufCoverageFile<CR>
  "map <D-T> :FufBuffer<CR>
  "let g:ctrlp_map = '<D-t>'
  map <D-w> :bdelete<CR>
  noremap <D-1> <Plug>AirlineSelectTab1
  noremap <D-2> <Plug>AirlineSelectTab2
  noremap <D-3> <Plug>AirlineSelectTab3
  noremap <D-4> <Plug>AirlineSelectTab4
  noremap <D-5> <Plug>AirlineSelectTab5
  noremap <D-6> <Plug>AirlineSelectTab6
  noremap <D-7> <Plug>AirlineSelectTab7
  noremap <D-8> <Plug>AirlineSelectTab8
  noremap <D-9> <Plug>AirlineSelectTab9
else
  "map <C-t> :FufCoverageFile<CR>
  "map <C-T> :FufBuffer<CR>
  "let g:ctrlp_map = '<C-t>'
  noremap <C-1> <Plug>AirlineSelectTab1
  noremap <C-2> <Plug>AirlineSelectTab2
  noremap <C-3> <Plug>AirlineSelectTab3
  noremap <C-4> <Plug>AirlineSelectTab4
  noremap <C-5> <Plug>AirlineSelectTab5
  noremap <C-6> <Plug>AirlineSelectTab6
  noremap <C-7> <Plug>AirlineSelectTab7
  noremap <C-8> <Plug>AirlineSelectTab8
  noremap <C-9> <Plug>AirlineSelectTab9
endif
