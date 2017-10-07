"Highlight current line
set number
set cursorline
highlight CursorLine ctermbg=black cterm=NONE
highlight LineNr ctermfg=gray 
highlight CursorLineNr ctermfg=yellow ctermbg=black

"Underline spell errors
highlight clear SpellBad
highlight SpellBad cterm=underline ctermfg=red

"Always yank to system clipboard (Linux)
set clipboard=unnamedplus
