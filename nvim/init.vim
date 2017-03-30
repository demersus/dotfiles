
" Plugins {
call plug#begin('~/.vim-plugged')
"Plug 'joukevandermaas/vim-ember-hbs'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-endwise'
Plug 'sheerun/vim-polyglot'
Plug 'mileszs/ack.vim'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/syntastic'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/syntastic'
Plug 'ap/vim-css-color'
Plug 'jacoborus/tender.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'rakr/vim-one'
Plug 'kshenoy/vim-signature'
call plug#end()
" }

"let g:polyglot_disabled = ['handlebars']

filetype indent plugin on
syntax enable
"au BufNewFile,BufRead *.hbs,*.handlebars setfiletype handlebars

set mouse=a
set nu
set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set number                      " Line numbers on
set showmatch                   " Show matching brackets/parenthesis
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set winminheight=0              " Windows can be 0 line high
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor
set foldenable                  " Auto fold code
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
set smartindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set colorcolumn=80
set backspace=2 " make backspace work like most other apps
set laststatus=2
set timeoutlen=1000 ttimeoutlen=0
"set nowritebackup
"set nobackup
"set noswapfile
"
set termguicolors

" let g:solarized_termcolors=256

" Colorscheme {
" if has("gui_running")
"  set background=dark
" else
   set background=dark
" endif
colorscheme one
" }


" Ack.vim config {
if executable('ag')
  let g:ackprg = 'ag --nogroup --nocolor --column --smart-case'
elseif executable('ack-grep')
  let g:ackprg="ack-grep -H --nocolor --nogroup --column"
endif
" }
"
" ctlP config {
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
endif
" }

" Press F4 to toggle highlighting on/off, and show current value.
noremap <F4> :set hlsearch! hlsearch?<CR>

let g:mapleader = '\'

let g:user_emmet_mode='a'

let g:airline_powerline_fonts = 1

map <C-n> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1

nnoremap <Leader>b :CtrlPBuffer<CR>


" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
let g:rspec_command = "Dispatch rspec {spec}"

function! RunRspecSuite()
  execute "Dispatch rspec"
endfunction
map <Leader>r :call RunRspecSuite()<CR>

" Dispatch settings
nnoremap <F9> :Dispatch<CR>
autocmd FileType ruby
      \ if expand('%') =~# '_test\.rb$' |
      \   compiler rubyunit | setl makeprg=testrb\ \"%:p\" |
      \ elseif expand('%') =~# '_spec\.rb$' |
      \   compiler rspec | setl makeprg=rspec\ \"%:p\" |
      \ else |
      \   compiler ruby | setl makeprg=ruby\ -wc\ \"%:p\" |
      \ endif
