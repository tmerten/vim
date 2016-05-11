if has("gui_macvim")
  macmenu &File.New\ Tab key=<nop>
  macmenu &File.Close key=<nop>
  "map <D-t> :FufCoverageFile<CR>
  "map <D-T> :FufBuffer<CR>
  "let g:ctrlp_map = '<D-t>'
  map <D-w> :bdelete<CR>
  map <D-1> <Plug>AirlineSelectTab1
  map <D-2> <Plug>AirlineSelectTab2
  map <D-3> <Plug>AirlineSelectTab3
  map <D-4> <Plug>AirlineSelectTab4
  map <D-5> <Plug>AirlineSelectTab5
  map <D-6> <Plug>AirlineSelectTab6
  map <D-7> <Plug>AirlineSelectTab7
  map <D-8> <Plug>AirlineSelectTab8
  map <D-9> <Plug>AirlineSelectTab9
else
  "map <C-t> :FufCoverageFile<CR>
  "map <C-T> :FufBuffer<CR>
  "let g:ctrlp_map = '<C-t>'
  map <C-1> <Plug>AirlineSelectTab1
  map <C-2> <Plug>AirlineSelectTab2
  map <C-3> <Plug>AirlineSelectTab3
  map <C-4> <Plug>AirlineSelectTab4
  map <C-5> <Plug>AirlineSelectTab5
  map <C-6> <Plug>AirlineSelectTab6
  map <C-7> <Plug>AirlineSelectTab7
  map <C-8> <Plug>AirlineSelectTab8
  map <C-9> <Plug>AirlineSelectTab9
endif
