" make <tab> used for trigger completion, completion confirm, snippet expand and jump like vscode.
inoremap <silent><expr> <TAB>
\ pumvisible() ? coc#_select_confirm() :
\ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
\ <SID>check_back_space() ? "\<TAB>" :
\ search('\%#[]>)}''"`;]', 'n') ? '<Right>' :
\ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction                     


let g:coc_snippet_next = '<tab>'
" add snippet
nnoremap <silent> <leader>es :CocCommand snippets.editSnippets <CR>
