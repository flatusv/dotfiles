" make <tab> used for trigger completion, completion confirm, snippet expand and jump like vscode.
inoremap <silent><expr> <TAB>
\ pumvisible() ? coc#_select_confirm() :
\ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
\ <SID>check_back_space() ? "\<TAB>" :
\ search('\%#[]>)}''"`]', 'n') ? '<Right>' :
\ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction                     


let g:coc_snippet_next = '<tab>'
" LaTeX configuration
let g:livepreview_previewer = 'zathura'
let g:tex_flavor='latex'    " makes vim recognize the filetype, when creating a .tex file
" add snippet
nnoremap <silent> <leader>es :CocCommand snippets.editSnippets <CR>
" preview latex file -- latex compile
" nnoremap <silent> <leader>cl :LLPStartPreview <CR>
" Wann geladen wird.. Maske... zu verwendende Sprache..
autocmd FileType latex,tex setlocal spell    spelllang=de_de,en_us

let g:tq_language=['en', 'de']
let g:tq_enabled_backends=["openthesaurus_de","woxikon_de"]
