"Tabs
map <C-t><up> :tabr<cr>
map <C-t><down> :tabl<cr>
map <C-t><left> :tabp<cr>
map <C-t><right> :tabn<cr>

"Python https://www.fullstackpython.com/vim.html
set colorcolumn=80
set ts=4
set cursorline

" Pathogen load
filetype off

filetype plugin indent on
filetype plugin on
syntax on

set ignorecase
set hlsearch
set showmatch
syntax enable
set smarttab
set ai
set si
set nowrap

" Color scheme
colorscheme onedark

" Tabs - the bane of my editing
autocmd FileType python setlocal shiftwidth=4 tabstop=4
autocmd FileType sh setlocal shiftwidth=2 tabstop=2
autocmd FileType js setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2
set textwidth=0
set expandtab     " insert spaces when hitting TABs
set softtabstop=4 " insert/delete 4 spaces when hitting a TAB/BACKSPACE
set shiftround    " round indent to multiple of 'shiftwidth'
set autoindent    " align the new line indent with the previous line
set nu
set relativenumber

" Status bar stuff
"
" %F(Full file path)
" %m(Shows + if modified - if not modifiable)
" %r(Shows RO if readonly)
" %<(Truncate here if necessary)
" \ (Separator)
" %=(Right align)
" %l(Line number)
" %v(Column number)
" %L(Total number of lines)
" %p(How far in file we are percentage wise)
" %%(Percent sign)
set statusline=%F%m%r%<\ %=%l,%v\ [%L]\ %p%%

" Change the highlighting so it stands out
"hi statusline ctermbg=white ctermfg=black

" Make sure it always shows
set laststatus=2
set splitright
set wildmode=longest,list,full
set splitbelow
set autoread
au CursorHold * checktime

" From No Plugins video on vim
set nocompatible
" :find
set path+=**
set wildmenu
" Create the `tags` file (may need to install ctags first)
command! MakeTags !ctags -R .
" NOW WE CAN:
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack
