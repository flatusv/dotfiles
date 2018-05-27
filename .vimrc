" start in insert mode
" start

" allow the cursor to move just past the end of the
set virtualedit=onemore 


" sets how many lines of history vim has to remember
set history=700

" enable filetype plugins
filetype plugin on
filetype indent on

" set to auto read when a file is changed from the outside
set autoread

" with a map leader it's possible to do extra key combinations
" like <leader>w saves the current file (see line 51)

let mapleader = ","
let g:mapleader = ","

" fast saving
nmap <leader>w :w!<cr>

" :w sudo saves the file
" (useful for handling the permission-denied error)
" command w w !sudo tee % > /dev/null


set clipboard=unnamedplus     " automatically copy to clipboard
set nocompatible              " required
filetype off                  " required
filetype plugin indent on     " required

set modifiable

" hybrid line numbers: relative + current line
:set number                   
set relativenumber           

set autochdir                 " switch to the directory when editing files

set path+=**                  " provides tab completion for all file related tasks

:set textwidth=90

:se mouse+=a                  " don't select line numbers with the mouse

set completeopt=longest,menuone



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => plugins
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/vundle.vim
call vundle#begin()

" let vundle manage vundle, required
plugin 'vundlevim/vundle.vim'
plugin 'valloric/youcompleteme'
plugin 'tpope/vim-commentary.git' " simple comment/uncomment plugin
plugin 'vim-scripts/indentpython.vim'
plugin 'majutsushi/tagbar'
plugin 'ctrlpvim/ctrlp.vim'
plugin 'tpope/vim-surround'
plugin 'tpope/vim-repeat' 
plugin 'bronson/vim-visual-star-search'
plugin 'sirver/ultisnips' " track the engine.
plugin 'honza/vim-snippets' " snippets are separated from the engine. add this if you want them:
plugin 'xuhdev/vim-latex-live-preview'

" latex configuration
let g:livepreview_previewer = 'zathura'
nnoremap <silent> <leader>v :llpstartpreview <cr>
let g:tex_flavor='latex'    " makes vim recognize the filetype, when creating a .tex file


" ultisnips configuration
let g:ultisnipsexpandtrigger="<tab>"
let g:ultisnipsjumpforwardtrigger="<c-b>"
let g:ultisnipsjumpbackwardtrigger="<c-z>"
let g:ultisnipseditsplit="vertical"
let g:ultisnipslistsnippets="<f2>"



" make ultisnips work alongside youcompleteme
function! g:ultisnips_complete()
  call ultisnips#expandsnippet()
  if g:ulti_expand_res == 0
    if pumvisible()
      return "\<c-n>"
    else
      call ultisnips#jumpforwards()
      if g:ulti_jump_forwards_res == 0
        return "\<tab>"
      endif
    endif
  endif
  return ""
endfunction

function! g:ultisnips_reverse()
  call ultisnips#jumpbackwards()
  if g:ulti_jump_backwards_res == 0
    return "\<c-p>"
  endif

  return ""
endfunction


if !exists("g:ultisnipsjumpforwardtrigger")
  let g:ultisnipsjumpforwardtrigger = "<tab>"
endif

if !exists("g:ultisnipsjumpbackwardtrigger")
  let g:ultisnipsjumpbackwardtrigger="<s-tab>"
endif

au insertenter * exec "inoremap <silent> " . g:ultisnipsexpandtrigger     . " <c-r>=g:ultisnips_complete()<cr>"
au insertenter * exec "inoremap <silent> " .     g:ultisnipsjumpbackwardtrigger . " <c-r>=g:ultisnips_reverse()<cr>"




" change the default mapping and the default command to invoke ctrlp:
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'ctrlp'


" tagbar toggle, very usefull for editing large files
nnoremap <silent> <leader>t :tagbartoggle<cr>


let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/youcompleteme/.ycm_extra_conf.py"  " currently setup to code in c
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_key_list_stop_completion = ['<enter>']
" let g:ycm_key_list_select_completion=[]
" let g:ycm_key_list_previous_completion=[]

" all of your plugins must be added before the following line
call vundle#end()            " required


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim user interface
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 
" set n lines to the cursor - when moving vertically using j/k
set so=20

" turn on the wild menu //"set wildmenu" enables a menu at the bottom of the vim/gvim window. 
set wildmenu

" always show current position
set ruler

" height of the command bar
set cmdheight=3

" a buffer becomes hidden when it is abandoned
set hid

" configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" ignore case when searching
set ignorecase

" when searching try to be smart about cases
set smartcase

" highlight search results
set hlsearch

" makes search act like search in modern browsers
set incsearch

" don't redraw while executing macros (good performance config)
set lazyredraw

" for regular expressions turn magic on
set magic

" show matching brackets when text indicator is over them
set showmatch
" how many tenths of a second to blink when matching brackets
set mat=2

" no annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" add a bit extra margin to the left
set foldcolumn=0



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => colors and fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" enable syntax highlighting
syntax enable
syntax on
autocmd bufenter * :syntax sync fromstart
"autocmd bufenter * :set number


" colorscheme gruvbox
" let g:gruvbox_contrast_dark='hard'
" set background=dark
" let g:gruvbox_contrast_dark = "soft"
" let g:gruvbox_termcolors=256
" set t_co=256
" set background=dark
" colorscheme gruvbox
" highlight normal ctermbg=none

set background=dark
let g:hybrid_custom_term_colors = 1
colorscheme hybrid

" set utf8 as standard encoding and en_us as the standard language
set encoding=utf8

" use unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" turn backup off, since most stuff is in svn, git et.c anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" use spaces instead of tabs
set expandtab 

" be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" linebreak on 65 characters, i3wm related
set lbr
set tw=90

       
"set ai "auto indent
"set si "smart indent
set wrap "wrap lines


" usefull shortcuts to enter insert mode
nnoremap <enter> i<enter>
nnoremap <backspace> i<backspace>
nnoremap <space> i<space>

map <c-a> <esc>^
imap <c-a> <esc>i
map <c-e> <esc><end>
imap <c-e> <esc><end>



" switch to visual mode and extend selection upwards
" make sure the same key combination works in visual mode
:imap <s-k> <esc>v<up>
:vmap <s-k> <up>
:imap <s-j> <esc>v<down>
:vmap <s-j> <down>
:imap <s-h> <esc>v<left>
:vmap <s-h> <left>
:imap <s-l> <esc>v<right>
:vmap <s-l> <right>






" return to last edit position when opening files (you want this!)
autocmd bufreadpost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \ exe "normal! g`\"" |
     \ endif
" remember info about open buffers on close
set viminfo^=%


" set ibeam shape in insert mode, underline shape in replace mode and block shape in normal mode
let &t_si = "\<esc>[6 q"
let &t_sr = "\<esc>[4 q"
let &t_ei = "\<esc>[2 q"


""""""""""""""""""""""""""""""
" => status line
""""""""""""""""""""""""""""""
" always show the status line
set laststatus=2

" format the status line
hi statusline ctermfg=black ctermbg=1 cterm=none
highlight linenr term=bold cterm=none ctermfg=5 ctermbg=none gui=none guifg=darkgrey guibg=none

" set statusline=\ %{haspaste()}%f%m%r%h\ %w\%y\ cwd:\ %r%{getcwd()}%h\ \ \ line:\ %l/%l\ \%=\%p%%
set statusline=\ %{haspaste()}%f%m%r%h\ %w\%y\ line:\ %l/%l\ \%=\%p%%

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" remap vim 0 to first non-blank character
" map 0 ^


" delete trailing white space on save, useful for python and coffeescript ;)
func! deletetrailingws()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd bufwrite *.py :call deletetrailingws()
autocmd bufwrite *.coffee :call deletetrailingws()



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! wipereg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor
autocmd vimenter * wipereg


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" returns true if paste mode is enabled
function! haspaste()
    if &paste
        return 'paste mode '
    en
    return ''
endfunction

" don't close window, when deleting a buffer
command! bclose call <sid>bufclosecloseit()
function! <sid>bufclosecloseit()
   let l:currentbufnum = bufnr("%")
   let l:alternatebufnum = bufnr("#")

   if buflisted(l:alternatebufnum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentbufnum
     new
   endif

   if buflisted(l:currentbufnum)
     execute("bdelete! ".l:currentbufnum)
   endif
endfunction

" creates shortcuts for certain commands
function! createshortcut(keys, cmd, where, ...)
  let keys = "<" . a:keys . ">"
  if a:where =~ "i"
    let i = (index(a:000,"notrailingiininsert") > -1) ? "" : "i"
    let e = (index(a:000,"noleadingescininsert") > -1) ? "" : "<esc>"
    execute "imap " . keys . " " . e .  a:cmd . i
  endif
  if a:where =~ "n"
    execute "nmap " . keys . " " . a:cmd
  endif    
  if a:where =~ "v"
    let k = (index(a:000,"restoreselectionafter") > -1) ? "gv" : ""
    let c = a:cmd
    if index(a:000,"cmdinvisual") > -1
      let c = ":<c-u>" . strpart(a:cmd,1)
    endif
    execute "vmap " . keys . " " . c . k
  endif
endfunction
function! tabisempty()
    return winnr('$') == 1 && len(expand('%')) == 0 && line2byte(line('$') + 1) <= 2
endfunction
function! myquit()
  if tabisempty() == 1
    q!
  else
    if &modified
      if (confirm("you have unsaved changes! wanna quit anyway?", "&yes\n&no", 2)==1)
        q!
      endif
    else
      q
    endif
  endif
endfunction
function! openlastbufferinnewtab()
    redir => ls_output
    silent exec 'ls'
    redir end
    let listbuffers = reverse(split(ls_output, "\n"))
    for line in listbuffers
      let title = split(line, "\"")[1]
      if title !~  "\[no name"
        execute "tabnew +" . split(line, " ")[0] . "buf" 
        break
      endif       
    endfor  
endfunction


""""""""""""""""""""
" " custom keybinds
"""""""""""""""""""""


" " ctrl a - begin line
 call createshortcut("c-a", "0", "inv")
"

" " ctrl e - end line
 call createshortcut("c-e", "$<right>", "inv")
"

" " ctrl h - search and replace
call createshortcut("c-h", ":%s/", "in", "notrailingiininsert")

" toggle highlighting
 nnoremap <c-n> :set hlsearch!<cr>

" " compile and run c code from vim with 'c99' flag
" nnoremap <silent> <leader>c :w <cr> :!clear;gcc -std=c99 % -o %< && ./%< <cr>


 " run a python code
 nnoremap <silent> <leader>p :w <cr> :!clear;python %<cr>
 

 " pretty much the reverse of <c-w> in insert mode
 inoremap <c-d> <c-o>de

 " dont trigger suspend with <c-z> in visual mode
 vnoremap <c-z> <nop>

 " lists all loaded buffers and populates the prompt for you,
 " waiting for you to type the number of a buffer and press <enter>
 nnoremap gb :ls<cr>:b<space>
 
 " list the contents of all of your registers
 " hint: this makes it easy to paste the right content via '[register value]+p'
 nnoremap <silent> <leader>r :registers <cr>
 
" map ctrl-backspace to delete the previous word in insert mode.
noremap! <c-bs> <c-w>
noremap! <c-h>  <c-w>
