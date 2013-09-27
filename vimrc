filetype plugin indent on

autocmd FileType plaintex call SetPlaintexOptions()

"plaintex options
function SetPlaintexOptions()
	"surround with paragraph
	nnoremap <leader>p :s/\v.*/\\paragraph{\0}<cr>:nohlsearch<cr>

	"quick compile latex to 'out' folder
	nnoremap <leader>c :!compile-latex.sh %<cr>
endfunction


autocmd BufRead,BufNewFile   *.tex set ft=plaintex

" shifts local vim directory to directory of newly buffer
autocmd BufEnter * :cd %:p:h

" load pathogen package manager
call pathogen#infect()

set tabstop=4
set shiftwidth=4
set softtabstop=4
set number

set nocompatible
set modelines=0

set encoding=utf-8
set scrolloff=4
set autoindent
set showmode
set showcmd
set hidden
"set visualbell
"set cursorline
set ttyfast
set backspace=indent,eol,start
set laststatus=2
set history=1000
syntax on

"set wildmenu
"set wildmode=list:longest,full

"perl/python regex
nnoremap // \v
vnoremap // \v

let mapleader = ","
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

inoremap <F1> <ESC>
vnoremap <F1> <ESC>
nnoremap <F1> <ESC>

"control-d to escape insert mode
imap <C-d> <ESC>


"------ general key mappings -----------------------------------------------

"open new window and switch to it
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>l :set invnumber<cr>
nnoremap <leader>s :setlocal invspell<cr>
nnoremap ; :
nnoremap <space> G
vnoremap <space> G
nnoremap <leader>r :redraw!<cr>
nnoremap <enter> o
" wasd style movement, h for insert mode
"nnoremap h i
"nnoremap i k
"nnoremap j h
"nnoremap k j

"code completions
inoremap {<CR>  {<CR>}<Esc>O
"inoremap ( ()<Esc>i
"inoremap [ []<Esc>i
"inoremap (  ()<Left>
"inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
"inoremap <expr> ]  strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"

" -----------------------------------------------------------------------------
" Enum Surround
"
" Used for note taking. Surrounds properly formatted lines into an
" enum environment block
"
" line format:
"
"	<title>
"	<empty-line>
"	<note>
"	<note>
"	...
"	<empty-line>
"
" note, an empty line is not the same as an EOF line. Hence, at the end of the
" file there must be at least 2 blank lines
nnoremap <leader>e 0:s/\v.+/\\begin{enum}{\0}<cr>:/^$/;\/s/\v.+/\t\\item<space>\0<cr>'':.;/^$/g/^$/normal dd<cr>O\end{enum}<esc>:nohlsearch<cr>o<esc>

"removes the two blank surrounding lines
"/^$/;\/g/^$/normal dd
"prepend item tags
"/^$/;\/s/\v.+/\t\\item \0

" eclim bindings
nnoremap <c-O> :JavaImportMissing<cr>:JavaImportClean<cr>:JavaImportSort<cr>
nnoremap <leader>d :JavaDocComment<cr>
"nnoremap <a-R> :JavaRename<space>
