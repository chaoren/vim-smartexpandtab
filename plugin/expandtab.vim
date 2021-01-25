if exists('g:loaded_expandtab')
	finish
endif
let g:loaded_expandtab = 1

inoremap <silent><expr><Plug>ExpandTab expandtab#expand()

if !get(g:, 'expandtab_nomap', v:false)
	imap <Tab> <Plug>ExpandTab
endif