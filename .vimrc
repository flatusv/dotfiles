"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sections: last uptdated (16-Aug-2017)
" -> General [23 - 74]
" -> Plugins: Vundle, etc.                  [ 74 - 85]
" -> VIM user interface                     [ 99 - 148]
" -> Colors and Fonts                       [155 - 175]
" -> Files and backups                      [175 - 180]
" -> Text, tab and indent related           [185 - 228]
" -> Visual mode related
" -> Moving around, tabs and buffers
" -> Status line                            [230 - 236]
" -> Editing mappings                       [240 - 295]
" -> vimgrep searching and cope displaying  [295 - 328]
" -> Spell checking                         [330 - 340]
" -> Misc                                   [343 - 355]
" -> Helper functions                       [360 - 467]
" -> Custom Keybinds                        [470 - end] 
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"execute pathogen#infect()

" Start in Insert mode
start


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

" :W sudo saves the file
" (useful for handling the permission-denied error)
" command W w !sudo tee % > /dev/null


set clipboard=unnamedplus     " automatically copy to clipboard
set nocompatible              " required
filetype off                  " required


filetype plugin indent on    " required

set modifiable

:set number                  " show line number


set autochdir               " switch to the directory when editing files

set path+=**                " provides tab completion for all file related tasks

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-commentary.git' " simple comment/uncomment plugin
Plugin 'vim-scripts/indentpython.vim'
Plugin 'SirVer/ultisnips'
" Plugin 'honza/vim-snippets'
Plugin 'gerw/vim-latex-suite',
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'majutsushi/tagbar'

" to comment the filetype of choice, replace commentstring by the extension
" autocmd FileType apache setlocal commentstring=#\ %s


"let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']

" make vim suitable for LaTeX
let g:tex_flavor='latex' "required for latex suite 
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats='pdf, aux'
let g:Tex_FoldedSections=""
let g:Tex_FoldedEnvironments=""
let g:Tex_FoldedMisc=""



" A Vim Plugin for Lively Previewing LaTeX PDF Output
let g:livepreview_previewer = 'zathura'
nmap <leader>l :LLPStartPreview<CR>

let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py"  " currently setup to code in C
" let g:ycm_autoclose_preview_window_after_completion = 1
" let g:ycm_key_list_select_completion=[]
" let g:ycm_key_list_previous_completion=[]

" All of your Plugins must be added before the following line
call vundle#end()            " required


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 
" Set n lines to the cursor - when moving vertically using j/k
set so=15

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
"autocmd BufEnter * :set number

colorscheme gruvbox
let g:gruvbox_contrast_dark='hard'
set background=dark



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

" Linebreak on 500 characters
set lbr
set tw=500

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

" switch to visual mode and extend selection upwards
:imap <S-Up> <esc>v<Up>
" make sure the same key combination works in visual mode
:vmap <S-Up> <Up>

" do the same for other arrow keys
:imap <S-Down> <esc>v<Down>
:vmap <S-Down> <Down>
:imap <S-Left> <esc>v<Left>
:vmap <S-Left> <Left>
:imap <S-Right> <esc>v<Right>
:vmap <S-Right> <Right>


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
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l


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


" function SmoothScroll(up)
"     if a:up
"         let scrollaction=""
"     else
"         let scrollaction=""
"     endif
"     exec "normal " . scrollaction
"     redraw
"     let counter=1
"     while counter<&scroll
"         let counter+=1
"         sleep 10m
"         redraw
"         exec "normal " . scrollaction
"     endwhile
" endfunction
" 
" nnoremap <C-U> :call SmoothScroll(1)<Enter>
" nnoremap <C-D> :call SmoothScroll(0)<Enter>
" inoremap <C-U> <Esc>:call SmoothScroll(1)<Enter>i
" inoremap <C-D> <Esc>:call SmoothScroll(0)<Enter>i


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.' . a:extra_filter)
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


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



"function! g:UltiSnips_Complete()
"    call UltiSnips#ExpandSnippet()
"    if g:ulti_expand_res == 0
"        if pumvisible()
"            return "\<C-n>"
"        else
"            call UltiSnips#JumpForwards()
"            if g:ulti_jump_forwards_res == 0
"               return "\<TAB>"
"            endif
"        endif
"    endif
"    return ""
"endfunction
"
"au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsListSnippets="<c-e>"
" this mapping Enter key to <C-y> to chose the current highlight item
" and close the selection list, same as other IDEs.
" CONFLICT with some plugins like tpope/Endwise


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


" inoremap <expr> <CR> pumvisible() ? "\<C-y><tab>" : "\<CR>"

""""""""""""""""""""
" " Custom Keybinds
"""""""""""""""""""""


" " Ctrl A - Begin Line
 call CreateShortcut("C-a", "0", "inv")
"

" " Ctrl E - End Line
 call CreateShortcut("C-e", "$<right>", "inv")
"
" " Ctrl S - Save
" call CreateShortcut("C-s", ":w<enter>", "nv", "cmdInVisual", "restoreSelectionAfter")
" call CreateShortcut("C-s", ":w<enter>i<right>", "i", "noTrailingIInInsert")
"

" " Ctrl H - Search and Replace
call CreateShortcut("C-h", ":%s/", "in", "noTrailingIInInsert")

" " Ctrl K - Delete Line

call CreateShortcut("C-k", "dd", "in")
call CreateShortcut("C-k", "d", "v")


"" " Ctrl Z - Undo
" call CreateShortcut("C-z", "u", "in")
"
"
"" " Ctrl Y - Redo
" call CreateShortcut("C-y", "<C-r>", "in")

" toggle highlighting
 nnoremap <C-n> :set hlsearch!<CR>


 " compile and run C code from Vim with 'c99' flag
 nnoremap <silent> <leader>c :w <CR> :!clear;gcc -std=c99 % -o %< && ./%< <CR>


 " run a python code
 nnoremap <silent> <leader>p :w <CR> :!clear;python %<CR>

 " pretty much the reverse of <c-w> in insert mode
 inoremap <C-d> <C-o>de

 " dont trigger suspend with <c-z> in visual mode
 vnoremap <c-z> <nop>


 " vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
 "
ino " ""<left>
ino ' ''<left>
ino ( ()<left>
ino [ []<left>
ino { {}<left>
ino {<CR> {<CR>}<ESC>O
ino {;<CR> {<CR>};<ESC>O



