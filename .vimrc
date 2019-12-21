"       (_)                   
" __   ___ _ __ ___  _ __ ___ 
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

let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" set clipboard=unnamedplus " copy to clipboard. Rather use middle mouse button
set nocompatible            " required
filetype off                " required
filetype plugin indent on   " required
set modifiable

:set number                 " show line number
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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Suntax 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable
syntax on
autocmd BufEnter * :syntax sync fromstart

" Wann geladen wird.. Maske... zu verwendende Sprache..
autocmd FileType latex,tex setlocal spell    spelllang=de_de,en_us

" read syntax-highlighted man pages inside Vim. Example: :Man ls
runtime! ftplugin/man.vim
" make these commands split the window vertically 
cabbrev Man vert Man       
cabbrev help vert help     


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'neoclide/coc.nvim', {'branch': 'release', 'for': ['python','javascript','html','css','latex','tex']}
Plug 'vim-scripts/indentpython.vim', { 'for': 'python' }
Plug 'chrisbra/vim-commentary' " simple comment/uncomment plugin
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat' 
Plug 'SirVer/ultisnips', {'for': ['python','javascript','html','css','tex']}
Plug 'honza/vim-snippets' "Snippets are separated from the engine. Add this if you want them:
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot', {'for': ['python','javascript','html','css'] }

" no conflict with vimtex
let g:polyglot_disabled = ['latex']

" coc.vim 
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" LaTeX configuration
let g:livepreview_previewer = 'zathura'
let g:tex_flavor='latex'    " makes vim recognize the filetype, when creating a .tex file


" Ultisnips configuration
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories = [$HOME.'/.vim/UltiSnips']

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
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
" let g:hybrid_custom_term_colors = 1
function! MyHighlights() abort
    highlight Normal      ctermbg=NONE
    highlight NonText     ctermbg=NONE
    highlight EndOfBuffer ctermbg=NONE
endfunction

augroup MyColors
    autocmd!
    autocmd ColorScheme * call MyHighlights()
augroup END
colorscheme blaquemagick
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


set ai "Auto indent
" set si "Smart indent
set wrap "Wrap lines


" Usefull shortcuts to enter insert mode
nnoremap <Enter> i<Enter>
nnoremap <Backspace> i<Backspace>
nnoremap <Space> i<Space>

map      <C-e> <ESC><END>
imap     <C-e> <ESC><END>

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
" call CreateShortcut("C-a", "0", "inv")
"

" " Ctrl E - End Line
" call CreateShortcut("C-e", "$<right>", "inv")
"

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

" lists all loaded buffers and populates the prompt for you,
" waiting for you to type the number of a buffer and press <enter>
" ::::::obsolote, use <leader>g instead
" nnoremap gb :ls<CR>:b<Space>
nnoremap <C-j> :bnext<CR>
nnoremap <C-k> :bprev<CR>


" Map Ctrl-Backspace to delete the previous word in insert mode.
noremap! <C-BS> <C-w>
noremap! <C-h>  <C-w>

" pretty much the reverse of <c-w> in insert mode
inoremap <C-d> <C-o>de

" jj triggers NORMAL MODE
imap jj <Esc>
cnoremap jj <C-C><Esc>
onoremap jj <Esc>

" copy visual selection to system clipboard
vnoremap <C-c> "+y

""""""""""""""""""""
" " Leader mappings
"""""""""""""""""""""
" compile and run C++ code from within Vim 
" nnoremap <silent> <leader>c :w <CR> :!clear;g++ % -o %< && ./%< <CR>

" preview latex file -- latex compile
nnoremap <silent> <leader>lc :LLPStartPreview <CR>

" run a python code -- python compile
nnoremap <silent> <leader>pc :w <CR> :!clear;python %<CR>

" list the contents of all of your registers
" hint: This makes it easy to paste the right content via 'registerValue'+p
nnoremap <silent> <leader>r :registers <CR>

" close all but current bufffer and save -- delete buffer
" :w - save current buffers %bd - close all the buffers  e# - open last edited file bd# - close the unnamed buffer
nnoremap <leader>db :w <bar> %bd <bar> e# <bar> bd# <bar> echo "closed all but current buffer (saved)" <CR>

" close all but current bufffer  -- delete Buffer
nnoremap <leader>dB :%bd <bar> e# <bar> bd# <bar> echo "closed all but current buffer" <CR>

" fzf.vim fuzzy open new file -- find file
noremap <silent> <leader>ff :call fzf#vim#files('~', fzf#vim#with_preview('right')) <CR>

" fzf.vim complete and insert a path
imap <leader>fp <plug>(fzf-complete-path)

" fzf.vim lists current buffers
nnoremap <silent> <leader><leader> :Buffers <CR>

" fzf.vim search line within buffer -- find line
nnoremap <silent> <leader>fl :BLines <CR>

" fzf.vim search line within loaded buffers -- find line
nnoremap <silent> <leader>fL :Lines <CR>

" fzf.vim search string in files
nnoremap <silent> <leader>? :Rg <CR>

" fzf.vim search search for tags
nnoremap <silent> <leader>t :Tags <CR>
" draw figues in inkscape and include them in latex
" https://github.com/gillescastel/inkscape-figures
" inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
" nnoremap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>
