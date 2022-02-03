" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__ 
"   \_/ |_|_| |_| |_|_|  \___|
"
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

let mapleader   = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" GVIM specific settings
if has("gui_running")
    " set guioptions-=m  "menu bar
    set guioptions-=T  "toolbar

    vmap <C-c> "+yi
    vmap <C-x> "+c
    vmap <C-V> c<ESC>"+p
    imap <C-V> <C-r><C-o>+
else
    " Terminal Vim only! By setting a window title i3wm can't kill vim terminals.
    set title
    " configure title to look like: Vim /path/to/file
    set titlestring=VIM:\ %-25.55F\ %a%r%m titlelen=70
endif

" set clipboard=unnamedplus " copy to clipboard. Rather use middle mouse button
set nocompatible            " required
filetype off                " required
filetype plugin indent on   " required
set modifiable

set number                 " show line number
set relativenumber
set autochdir               " switch to the directory when editing files
set path+=**                " provides tab completion for all file related tasks
:set textwidth=90
:se mouse+=a                " don't select line numbers with the mouse
set completeopt=longest,menuone

set timeoutlen=2000

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" never show signcolumns, removes ugly grey bar next to statusline
set signcolumn=no
set nomodeline

" autocmd commands
" autocmd BufLeave * if &buftype=="terminal" | setlocal nobuflisted | endif
" autocmd VimEnter * !~/.scripts/vimEnter.sh
" autocmd VimLeave * !~/.scripts/vimLeave.sh

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Suntax 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable
syntax on
autocmd BufEnter * :syntax sync fromstart


" read syntax-highlighted man pages inside Vim. Example: :Man ls
runtime! ftplugin/man.vim
" make these commands split the window vertically 
cabbrev Man vert Man 
cabbrev help vert help 
cabbrev term :botright term ++rows=20
" => PLUGINS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')
" Plug 'neoclide/coc.nvim', {'branch': 'release', 'for': ['python','javascript','html','css','latex','tex','java','cpp','c']}
Plug 'ap/vim-buftabline'
Plug 'honza/vim-snippets',            { 'for': ['latex','tex']}
Plug 'junegunn/fzf',                  { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'lervag/vimtex',                 { 'for': 'tex' }
Plug 'neoclide/coc.nvim',             {'branch': 'release'}
Plug 'ron89/thesaurus_query.vim',     { 'for': ['latex','tex']}
Plug 'tomtom/tcomment_vim'            " Replaces vim-commentary, since it indented the line...
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'OmniSharp/omnisharp-vim'        " For C# development
Plug 'Yggdroot/indentLine'

:nnoremap <leader>es :CocCommand snippets.editSnippets
:nnoremap <leader>os :CocCommand snippets.openSnippetFiles<CR>

let g:indentLine_char_list = ['┊']
let g:indentLine_fileTypeExclude = ['tex']

let g:tq_language = 'de'
nnoremap <leader>ss :ThesaurusQueryReplaceCurrentWord<CR>
vnoremap <leader>ss y:ThesaurusQueryReplace <C-r>"<CR>

" recognize empty latex file as 'tex', so that snippets work properly
let g:tex_flavor = "latex"

let g:vimtex_compiler_latexmk = {
            \ 'options' : [
                \   '-pdf',
                \   '-shell-escape',
                \   '-verbose',
                \   '-file-line-error',
                \   '-synctex=1',
                \   '-interaction=nonstopmode',
                \ ],
                \}


let g:termdebug_wide=1


" vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" All of your Plugins must be added before the following line
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set n lines to the cursor - when moving vertically using j/k
set so=15
" Turn on the WiLd menu //"set wildmenu" enables a menu at the bottom of the vim/gvim window. 
set wildmenu
"Always show current position
set ruler
" Height of the command bar
set cmdheight=2
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
" Colors and Fonts

set background=dark

if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

colorscheme iceberg

" underline spelling erros instead of hightlighting them
hi clear SpellBad
hi SpellBad cterm=underline
hi Terminal guifg=#818596

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
" set nobackup
" set nowb
" set noswapfile
let &directory = expand('~/.vimdata/swap//')

set backup
let &backupdir = expand('~/.vimdata/backup//')

if !isdirectory(&backupdir) | call mkdir(&backupdir, "p") | endif
if !isdirectory(&directory) | call mkdir(&directory, "p") | endif

if !isdirectory($HOME."/.vimdata/undo") | call mkdir($HOME."/.vimdata/undo", "p")  | endif
set undodir=$HOME."/.vimdata/undo"
set undofile
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
set ai "Auto indent
" set si "Smart indent
set wrap "Wrap lines

" Usefull shortcuts to enter insert mode
" nnoremap <Enter> i<Enter>
nnoremap <Enter> a
nnoremap <Backspace> i<Backspace>
nnoremap <Space> i<Space>
 
" Store relative line number jumps in the jumplist. Eg.: '30j'  
nnoremap <expr> k (v:count > 1 ? "m'" . v:count : '') . 'k'
nnoremap <expr> j (v:count > 1 ? "m'" . v:count : '') . 'j'

" move to end of previous word
nnoremap B ge
vnoremap B ge

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
" hi StatusLine ctermfg=black ctermbg=1 cterm=NONE
highlight LineNr term=bold cterm=NONE ctermfg=5 ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\%y\ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l/%L\ \%=\%p%%
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\%y\ Line:\ %l/%L\ \%=\%p%%

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

fun! TabTogTerm()
    let l:OpenTerm = {x -> x
                \  ? { -> execute('botright 12 split +term') }
                \  : { -> execute('botright term ++rows=12') }
                \ }(has('nvim'))
    let term = gettabvar(tabpagenr(), 'term',
                \ {'main': -1, 'winnr': -1, 'bufnr': -1})
    if ! bufexists(term.bufnr)
        call l:OpenTerm()
        call settabvar(tabpagenr(), 'term',
                    \ {'main': winnr('#'), 'winnr': winnr(), 'bufnr': bufnr()})
        exe 'tnoremap <buffer> <leader>t <cmd>' . t:term.main . ' wincmd w<cr>'
        exe 'tnoremap <buffer> <c-d>     <cmd>wincmd c<cr>'
        setl winheight=12
    else
        if ! len(filter(tabpagebuflist(), {_,x -> x == term.bufnr}))
            exe 'botright 12 split +b\ ' . term.bufnr
        else
            exe term.winnr . ' wincmd w'
        endif
    endif
endfun

" below is for jumplist
function GoTo(jumpline)
  let values = split(a:jumpline, ":")
  execute "e ".values[0]
  call cursor(str2nr(values[1]), str2nr(values[2]))
  execute "normal zvzz"
endfunction

function GetLine(bufnr, lnum)
  let lines = getbufline(a:bufnr, a:lnum)
  if len(lines)>0
    return trim(lines[0])
  else
    return ''
  endif
endfunction

function! Jumps()
  " Get jumps with filename added
  let jumps = map(reverse(copy(getjumplist()[0])), 
    \ { key, val -> extend(val, {'name': getbufinfo(val.bufnr)[0].name }) })
 
  let jumptext = map(copy(jumps), { index, val -> 
      \ (val.name).':'.(val.lnum).':'.(val.col+1).': '.GetLine(val.bufnr, val.lnum) })

  call fzf#run(fzf#vim#with_preview(fzf#wrap({
        \ 'source': jumptext,
        \ 'column': 1,
        \ 'options': ['--delimiter', ':', '--bind', 'alt-a:select-all,alt-d:deselect-all', '--preview-window', '+{2}-/2'],
        \ 'sink': function('GoTo')})))
endfunction
command! Jumps call Jumps()
""""""""""""""""""""
" " Helper Keybinds
"""""""""""""""""""""
" " Ctrl A - Begin Line
" call CreateShortcut("C-a", "0", "inv")
"
" " Ctrl E - End Line
" call CreateShortcut("C-e", "$<right>", "inv")

" " Ctrl H - Search and Replace
call CreateShortcut("C-h", ":%s/", "in", "noTrailingIInInsert")
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""
" " Custom Keybinds
"""""""""""""""""""""
" toggle highlighting
nnoremap <C-n> :set hlsearch!<CR>
" dont trigger suspend with <c-z> in visual mode
vnoremap <c-z> <nop>

" move up/down the buffer list
nnoremap <C-k> :bnext<CR>
nnoremap <C-j> :bprev<CR>

" Map Ctrl-Backspace to delete the previous word in insert mode.
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>

" pretty much the reverse of <c-w> in insert mode
inoremap <C-d> <C-o>de

" jj triggers NORMAL MODE
imap jj <Esc>
cnoremap jj <C-C><Esc>
onoremap jj <Esc>

" copy visual selection to system clipboard
vnoremap <C-c> "+y

" replace word under cursor with last selected word. (Repeatable)
nnoremap s diw"0P

" replace visual selection with last yanked
vnoremap s "_d"0P

" Tab to move out of brackets. Works like in Android Studio
inoremap <expr> <Tab> search('\%#[]>)}''"`]', 'n') ? '<Right>' : '<Tab>'

""""""""""""""""""""
" " FZF custom commands
"""""""""""""""""""""
command! -bang -nargs=? -complete=dir BFiles
            \ call fzf#vim#files(expand('%:h'), {'source': 'ag --hidden --ignore .git -g ""'}, <bang>0)
""""""""""""""""""""
" " FZF mappings
"""""""""""""""""""""
" fzf.vim fuzzy open new file -- find file
noremap <silent> <leader>ff :call fzf#vim#files('~', fzf#vim#with_preview('right')) <CR>
" fzf.vim fuzzy open file -- find file within directory
noremap <silent> <leader>fd :Files %:p:h<CR>
" fzf.vim fuzzy open file -- find git file
noremap <silent> <leader>fg :GFiles<CR>
" fzf.vim complete and insert a path
imap <leader>cp <plug>(fzf-complete-path)
" fzf.vim lists current buffers
nnoremap <silent> <leader><leader> :call fzf#vim#buffers('', fzf#vim#with_preview('right')) <CR>
" fzf.vim search line within buffer -- find line
nnoremap <silent> <leader>fl :BLines <CR>
" fzf.vim search line within all loaded buffers -- find line
nnoremap <silent> <leader>fL :Lines <CR>
" fzf.vim search string in files
nnoremap <silent> <leader>? :Rg <CR>

""""""""""""""""""""
" " leader 
"""""""""""""""""""""
" Creates a single terminal instance. If a terminal window is already open, it will switch
" focus to that. Another successive keupress, will switch the focus back to the editor.
nnoremap <silent> <leader>t <cmd>call TabTogTerm()<cr>
tnoremap <silent> <leader>d <c-c><c-c><c-l><c-d><c-d>
" list the contents of all of your registers
" hint: This makes it easy to paste the right content via <RegisterValue>+p or "<RegisterValue>p
nnoremap <silent> <leader>r :registers <CR>
" close all but current bufffer and save 
" :w - save current buffers %bd - close all the buffers  e# - open last edited file bd# - close the unnamed 
nnoremap <leader>ca :w <bar> %bd <bar> e# <bar> bd# <bar> echo "closed all but current buffer (saved)" <CR>
nnoremap <leader>dd :w <bar> :bd <CR>  
" jumplist
nnoremap <leader>j :Jumps<cr>

" switch to the other split 
tnoremap <leader>sw <C-w>w
nnoremap <leader>sw <C-w>w

" nnoremap <silent> <leader>gu :OmniSharpFindUsages<CR>
" nnoremap <silent> <leader>gd :OmniSharpGotoDefinition<CR>
