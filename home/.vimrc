"
" rootfs/home/.vimrc
"
" excuted by '~/.vimrc'
"
"  -----------------------------------------------------------------------------
"  $ cat ~/.vimrc
"
"  source ~/rootfs/home/.vimrc
"  
"  if filereadable("$PRJROOT/vimrc")
"  source $PRJROOT/vimrc
"  endif
"  
"  if filereadable("./vimrc")
"  source ./vimrc
"  endif
"   
"    ---------------------------------------------------------------------------
"    $ cat $PRJROOT/.vimrc
"    
"    set tags=./tags,tags,$GRPC_C/tags,$PROTO/tags
"    
"    cscope add $GRPC_C/cscope.out $GRPC_C
"    cscope add $PROTO/cscope.out $PROTO
"
"

" Basic Setting
"colorscheme CodeSchool3
"set termguicolors
"set relativenumber
autocmd FileType make setlocal noexpandtab

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if has ("syntax")
    syntax on
endif
set hlsearch

if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=utf-8,latin1
endif

set nocompatible        " Use Vim defaults (much better!)
set bs=2                " allow backspacing over everything in insert mode
set ai                  " always set autoindenting on
"set backup             " keep a backup file
set viminfo='20,\"50    " read/write a .viminfo file, don't store more
                        " than 50 lines of registers
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
set incsearch           " do incremental searching
set columns=80
set lines=120

" Only do this part when compiled with support for autocommands
if has("autocmd")
  " In text files, always limit the width of text to 78 characters
  autocmd BufRead *.txt set tw=78
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
endif

if has("cscope")
   set csprg=/usr/bin/cscope
   set csto=0
   set cst
   set nocsverb
   " add any database in current directory
   if filereadable("cscope.out")
      cs add cscope.out
   " else add database pointed to by environment
   elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
   endif
   set csverb
endif

if has("gui_running")
    set guifont=Monospace\ 10 
    set co=80
"    set lines=170
endif

if &term=="xterm"
     set t_Co=8
     set t_Sb=^[[4%dm
     set t_Sf=^[[3%dm
endif

"##############################
"" for jiny 
"
"
set nocompatible    " use Vim default function
set backspace=2     " allow backspace on insert mode
set nowrapscan      " re-search at bottom of file
"set nobackup       " don't create backup file
set nojoinspaces    " add one space after '.' with J command
""set keywordprg=edic    " run command with K key
set showcmd         " show command status
set showmatch       " 
"set ignorecase      " for search option
set incsearch       " 
set autowrite       " :next, :make 
"set number
set guioptions-=T	" remove toolbar


""" ========================================================
""" file encoding
""" ========================================================
if $LANG[0] == 'k' && $LANG[1] == 'o'
  set fileencodings=utf-8,euc-kr
endif
 
"------------------------------------------------------------------------------
" tab
"
set ts=8            " tabstop(\n)
"set softtabstop=4
set sw=4            " shiftwidth (indent)
"set et              " expandtab; replace tab with space
                    " real tab => <CTRL-V> <TAB> or <CTRL-V> <CTRL-I>
"
" tab <--> space
" :ret (retab)
" :[range]ret [new_ts]
"
" (=)
"

set cindent
 
set textwidth=80
 
"#####
set title
set ruler
 
"set visualbell
 

" Key Settings
"nnoremap <F2> :set invpaste paste?<CR>
"set pastetoggle=<F2>
let mapleader = ","

"------------------------------------------------------------------------------
" buffer(file) list
"
" :ls
" :buffers
" :files
"
" :e #{N}
" {N}<CTRL-^>
"
" :n            # next
" :N            # previous

nnoremap <leader>r :bp<CR>	" go to previous buffer
nnoremap <leader>f :bn<CR> 	" go to next buffer
nnoremap <leader>t :b#<CR>	" go to last-used buffer (toggle)
nnoremap <leader>w :bw<CR>	" close current file buffer


map <F1> K              " show helper
map <F2> :25vs ./<CR>:set nonu<CR>    " open file manager
map <F3> O^Ww<CR>       " open file in file manager
map <F4> ^6             " open previous file
map <F5> v%zf           " folding (press F5 at '{')
map <F6> zo             " unfolding
map <F7> :marks<CR>     " view recently open file
map <F8> [i             " show function prototype
map <F9> :set nonu<CR>  " hide line number
map <F10> :set nu<CR>   " display line number
 
 
"##############################
" cscope
"
" when importing cscope.out, you can supply the prefix, i.e.
" :cscope add /path/to/cscope.out /path/to
"
" cscope hotkey
" find this C symbol
nmap <C-[>s :cs find s <C-R>=expand("<cword>")<CR><CR>
" find this definition
nmap <C-[>g :cs find g <C-R>=expand("<cword>")<CR><CR>
" find functions calling this function
nmap <C-[>c :cs find c <C-R>=expand("<cword>")<CR><CR>
" find functions called by this function
nmap <C-[>d :cs find d <C-R>=expand("<cword>")<CR><CR>
" find assignments to
nmap <C-[>t :cs find t <C-R>=expand("<cword>")<CR><CR>
" find this egrep pattern
nmap <C-[>e :cs find e <C-R>=expand("<cword>")<CR><CR>
" find this file
nmap <C-[>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
" find files #including this file
nmap <C-[>i :cs find i <C-R>=expand("<cfile>")<CR><CR>

" ctrl-o	to jump back instead of Ctrl-t
" ctrl-i	to jump re-entrance (ctrl-])
 
"##############################
" ctag
" tag not found
" :set tags=./tags,tags;/
"set tagbsearch  " binary search to tag db
"set tags=./tags,${XBASE_ZEBOS}/tags,${XBASE_BCMSDK}/tags,${XBASE_RTKSDK}/tags,${XBASE_KERNEL}/tags,${LIBPCAP}/tags
"
"The semicolon in the first command is essential. This command let vim first in the current directory to look for tags files, if not find the tags file, or do not find the corresponding target, go to the parent directory to find, always upward recursion. Because the path that is recorded in the tags file is always relative to the path where the tags file is located, use the second setting to change the current directory of Vim.
"set tags=tags;SetAutochdir
"set tags=tags;
set tags=./tags


"------------------------------------------------------------------------------
" replace
"
" [range]s/oldpattern/newpattern/
"
" :%s/\<old\>/new/gc     # file(%) target, line, confirm
" :'<,'>s/old/new/gc     # block (visual)

"------------------------------------------------------------------------------
" keyword completion
"
" <CTRL-p>
" <CTRL-n>


"------------------------------------------------------------------------------
" window split
"
" :[#]sp [file]
" <CTRL-W> s
"
" :[#]vs [file]
" <CTRL-W> v
"
" :[#]new
" <CTRL-W> n
"
" :[#]vnew
" <CTRL-W> v


"------------------------------------------------------------------------------
" moving around
"
" 0, ^, $
" w, e, b       # word, end of word, words backward
" W, E, B
"
" gd            # goto local declaration
"
" gf            # goto file
" <CTRL-W> f    # window
" <CTRL-W> gf   # tab
" [<CTRL-I>     # jump prototype
" [<TAB>        # jump prototype
" <CTRL-O>      # jump back to the previous file position
"               # Go to [count] Older cursor position in jump list
" :ju[mps]      # Print the jump list (not a motion command)


"------------------------------------------------------------------------------
" mark
"
" ma        # set mark 'a' at current location
" 'a        # jump to line of mark 'a' (first non-blank character in line)
" `a        # jump to position (line and column) of mark 'a'
" :marks    # list all the current marks
" :marks aB # list marks 'a','B'


"------------------------------------------------------------------------------
" register
"
" :reg[isters]          # display the contents of all numbered and named registers
" :reg[isters] {arg}    # display the contents of all numbered and named registers that are mentioned in {arg}
" {Visual}["x]y     # Yank the highlighted text [into register x]
" ["x]p             # Put the text [from register x] after the cursor


"------------------------------------------------------------------------------
" highlight trailing spaces
"
"highlight ExtraWhitespace ctermbg=red guibg=red
"match ExtraWhitespace /\s\+$/

"
" remove trailing spaces when save
"
"autocmd FileType c,cpp,java,php,javascript autocmd BufWritePre <buffer> :%s/\s\+$//e

"------------------------------------------------------------------------------
" AUTO COMPLETION
"
" Start typing the name you want to look for, press <C-x> and <C-o>
" (Ctrl + x) and (Ctrl + o)
"
" Ctrl-P or Ctrl-N only autocomplete words from current files/buffers.
"
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" JavaScript
" set omnifunc=javascriptcomplete#CompleteJS

"------------------------------------------------------------------------------
"-- PLUGINS (Using junegunn/vim-plug) --
"

