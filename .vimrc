" Start in Insert mode
" start

" Allow the cursor to move just past the end of the
set virtualedit=onemore 


" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file (see line 51)

let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

set clipboard=unnamedplus     " automatically copy to clipboard
set nocompatible              " required
filetype off                  " required


filetype plugin indent on    " required
set modifiable

" show line number
:set number                  
set relativenumber           

set autochdir               " switch to the directory when editing files

set path+=**                " provides tab completion for all file related tasks

:set textwidth=90

:se mouse+=a                " don't select line numbers with the mouse

set completeopt=longest,menuone



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-commentary.git' " simple comment/uncomment plugin
Plugin 'vim-scripts/indentpython.vim'
Plugin 'majutsushi/tagbar'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat' 
Plugin 'bronson/vim-visual-star-search'
Plugin 'SirVer/ultisnips' " Track the engine.
Plugin 'honza/vim-snippets' " Snippets are separated from the engine. Add this if you want them:
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'ron89/thesaurus_query.vim' " display synonyms for the word under the cursor

" vim-thesaurus_query installed via AUR
let g:tq_thesaurus_com_do_not_prompt_for_install=1
let g:tq_language=['en', 'de',]
let g:tq_online_backends_timeout = 0.4
let g:tq_enabled_backends=["woxikon_de","openthesaurus_de","woxikon_de","thesaurus_com","openoffice_en"]

" LaTeX configuration
let g:livepreview_previewer = 'zathura'
nnoremap <silent> <leader>v :LLPStartPreview <CR>
let g:tex_flavor='latex'    " makes vim recognize the filetype, when creating a .tex file


" Ultisnips configuration
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsListSnippets="<f2>"
let g:UltiSnipsSnippetDirectories = ['~/.vim/bundle/vim-snippets/UltiSnips', 'UltiSnips']



" Make Ultisnips work alongside YouCompleteMe
function! g:UltiSnips_Complete()
  call UltiSnips#ExpandSnippet()
  if g:ulti_expand_res == 0
    if pumvisible()
      return "\<C-n>"
    else
      call UltiSnips#JumpForwards()
      if g:ulti_jump_forwards_res == 0
        return "\<TAB>"
      endif
    endif
  endif
  return ""
endfunction

function! g:UltiSnips_Reverse()
  call UltiSnips#JumpBackwards()
  if g:ulti_jump_backwards_res == 0
    return "\<C-P>"
  endif

  return ""
endfunction


if !exists("g:UltiSnipsJumpForwardTrigger")
  let g:UltiSnipsJumpForwardTrigger = "<tab>"
endif

if !exists("g:UltiSnipsJumpBackwardTrigger")
  let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
endif

au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger     . " <C-R>=g:UltiSnips_Complete()<cr>"
au InsertEnter * exec "inoremap <silent> " .     g:UltiSnipsJumpBackwardTrigger . " <C-R>=g:UltiSnips_Reverse()<cr>"




" Change the default mapping and the default command to invoke CtrlP:
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'


" tagbar toggle, very usefull for editing large files
nnoremap <silent> <leader>t :TagbarToggle<CR>


let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py"  " currently setup to code in C
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_key_list_stop_completion = ['<Enter>']

" All of your Plugins must be added before the following line
call vundle#end()            " required


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 
" Set n lines to the cursor - when moving vertically using j/k
set so=20

" Turn on the WiLd menu //"set wildmenu" enables a menu at the bottom of the vim/gvim window. 
set wildmenu

"Always show current position
set ruler

" Height of the command bar
set cmdheight=3

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
set foldcolumn=0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable
syntax on
autocmd BufEnter * :syntax sync fromstart

set background=dark
let g:hybrid_custom_term_colors = 1
colorscheme hybrid
set cursorline        " highlight current line
set cursorcolumn      " highlight current column

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab 

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 90 characters, i3wm related
set lbr
set tw=90

       
"set ai "Auto indent
"set si "Smart indent
set wrap "Wrap lines


" Usefull shortcuts to enter insert mode
nnoremap <Enter> i<Enter>
nnoremap <Backspace> i<Backspace>
nnoremap <Space> i<Space>

map <C-a> <ESC>^
imap <C-a> <ESC>I
map <C-e> <ESC><END>
imap <C-e> <ESC><END>

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \ exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%


" Set IBeam shape in insert mode, underline shape in replace mode and block shape in normal mode
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
hi StatusLine ctermfg=black ctermbg=1 cterm=NONE
highlight LineNr term=bold cterm=NONE ctermfg=5 ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\%y\ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l/%L\ \%=\%p%%
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\%y\ Line:\ %l/%L\ \%=\%p%%

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
" map 0 ^


" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor
autocmd VimEnter * WipeReg

"" Auto save buffer every time something has changed
" autocmd TextChanged,TextChangedI <buffer> silent write

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE '
    en
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

" Creates shortcuts for certain commands
function! CreateShortcut(keys, cmd, where, ...)
  let keys = "<" . a:keys . ">"
  if a:where =~ "i"
    let i = (index(a:000,"noTrailingIInInsert") > -1) ? "" : "i"
    let e = (index(a:000,"noLeadingEscInInsert") > -1) ? "" : "<esc>"
    execute "imap " . keys . " " . e .  a:cmd . i
  endif
  if a:where =~ "n"
    execute "nmap " . keys . " " . a:cmd
  endif    
  if a:where =~ "v"
    let k = (index(a:000,"restoreSelectionAfter") > -1) ? "gv" : ""
    let c = a:cmd
    if index(a:000,"cmdInVisual") > -1
      let c = ":<C-u>" . strpart(a:cmd,1)
    endif
    execute "vmap " . keys . " " . c . k
  endif
endfunction
function! TabIsEmpty()
    return winnr('$') == 1 && len(expand('%')) == 0 && line2byte(line('$') + 1) <= 2
endfunction
function! MyQuit()
  if TabIsEmpty() == 1
    q!
  else
    if &modified
      if (confirm("YOU HAVE UNSAVED CHANGES! Wanna quit anyway?", "&Yes\n&No", 2)==1)
        q!
      endif
    else
      q
    endif
  endif
endfunction
function! OpenLastBufferInNewTab()
    redir => ls_output
    silent exec 'ls'
    redir END
    let ListBuffers = reverse(split(ls_output, "\n"))
    for line in ListBuffers
      let title = split(line, "\"")[1]
      if title !~  "\[No Name"
        execute "tabnew +" . split(line, " ")[0] . "buf" 
        break
      endif       
    endfor  
endfunction


""""""""""""""""""""
" " Helper Keybinds
"""""""""""""""""""""
" " Ctrl A - Begin Line
 call CreateShortcut("C-a", "0", "inv")
"

" " Ctrl E - End Line
 call CreateShortcut("C-e", "$<right>", "inv")
"
" " Ctrl S - Save
call CreateShortcut("C-s", ":w<enter>", "nv", "cmdInVisual", "restoreSelectionAfter")
call CreateShortcut("C-s", ":w<enter>i<right>", "i", "noTrailingIInInsert")
"

" " Ctrl H - Search and Replace
call CreateShortcut("C-h", ":%s/", "in", "noTrailingIInInsert")
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



""""""""""""""""""""
" " Custom Keybinds
"""""""""""""""""""""
" toggle highlighting
 nnoremap <C-n> :set hlsearch!<CR>

 " compile and run C code from Vim with 'c99' flag
 " nnoremap <silent> <leader>c :w <CR> :!clear;gcc -std=c99 % -o %< && ./%< <CR>

 " run a python code
 nnoremap <silent> <leader>p :w <CR> :!clear;python %<CR>
 
 " pretty much the reverse of <c-w> in insert mode
 inoremap <C-d> <C-o>de

 " dont trigger suspend with <c-z> in visual mode
 vnoremap <c-z> <nop>

 " lists all loaded buffers and populates the prompt for you,
 " waiting for you to type the number of a buffer and press <enter>
 nnoremap gb :ls<CR>:b<Space>
 
 " list the contents of all of your registers
 " hint: This makes it easy to paste the right content via '[register value]+p'
 nnoremap <silent> <leader>r :registers <CR>
 
" Map Ctrl-Backspace to delete the previous word in insert mode.
noremap! <C-BS> <C-w>
noremap! <C-h>  <C-w>

" jj triggers NORMAL MODE
imap jj <Esc>


 
