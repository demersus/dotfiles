
" Plugins {

if !exists('loaded_matchit')
    source $VIMRUNTIME/macros/matchit.vim
endif

call plug#begin('~/.vim-plugged')
"Plug 'joukevandermaas/vim-ember-hbs'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-dispatch'
Plug 'radenling/vim-dispatch-neovim'
Plug 'skywind3000/asyncrun.vim'
Plug 'kassio/neoterm'
Plug 'janko-m/vim-test'
Plug 'godlygeek/tabular'
Plug 'mattn/emmet-vim'
Plug 'neomake/neomake'
Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'
Plug 'tpope/vim-endwise'
Plug 'sheerun/vim-polyglot'
Plug 'mileszs/ack.vim'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'easymotion/vim-easymotion'
"Plug 'vim-syntastic/syntastic'
Plug 'ap/vim-css-color'
Plug 'jacoborus/tender.vim'
Plug 'lifepillar/vim-solarized8'
" Plug 'rakr/vim-one'
 Plug 'morhetz/gruvbox'
 Plug 'altercation/vim-colors-solarized'
 Plug 'arcticicestudio/nord-vim'
Plug 'kshenoy/vim-signature'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'gurpreetatwal/vim-avro'
"Plug 'hashivim/vim-terraform'
call plug#end()
" }

"let g:polyglot_disabled = ['handlebars']
filetype indent plugin on
syntax enable
"au BufNewFile,BufRead *.hbs,*.handlebars setfiletype handlebars

set mouse=a
set nofixendofline
set nu
set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set number                      " Line numbers on
" set relativenumber              " hybrid numbers
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
set colorcolumn=160
set backspace=2 " make backspace work like most other apps
set laststatus=2
set timeoutlen=1000 ttimeoutlen=0
set exrc
"set nowritebackup
"set nobackup
"set noswapfile
"
set termguicolors
colorscheme gruvbox

set background=light


" Ack.vim config {
" if executable('ag')
   let g:ackprg = 'ag --vimgrep'
" elseif executable('ack-grep')
"   let g:ackprg="ack-grep -H --nocolor --nogroup --column"
" endif
" let g:ackhighlight = 1
" }
"
" ctlP config {
" if executable('ag')
" Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
" endif
" }

" Ag command:
"command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

" Press F4 to toggle highlighting on/off, and show current value.
noremap <F4> :set hlsearch! hlsearch?<CR>

let g:mapleader = '\'

let g:user_emmet_mode='a'

let g:airline_powerline_fonts = 1

map <C-n> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1

" vim-test mappings
map <Leader>t :TestFile<CR>
map <Leader>f :TestNearest<CR>
map <Leader>r :TestLast<CR>
map <Leader>a :TestSuite<CR>
map <Leader>v :TestVisit<CR>

" use ctrl+o to enter the nvim terminal in test results
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
endif

" SYNTASTIC
"let g:syntastic_ruby_checkers = ['rubocop']
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 0
"let g:syntastic_auto_loc_list = 0
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_html_tidy_ignore_errors = [
"    \  'plain text isn''t allowed in <head> elements',
"    \  '<base> escaping malformed URI reference',
"    \  'discarding unexpected <body>',
"    \  '<script> escaping malformed URI reference',
"    \  '</head> isn''t allowed in <body> elements'
"    \ ]

" NEOMAKE
" When writing a buffer (no delay).
call neomake#configure#automake('w')
" When writing a buffer (no delay), and on normal mode changes (after 750ms).
call neomake#configure#automake('nw', 750)
" When reading a buffer (after 1s), and when writing (no delay).
call neomake#configure#automake('rw', 1000)
" Full config: when writing or reading a buffer, and on changes in insert and
" normal mode (after 1s; no delay when writing).
call neomake#configure#automake('nrwi', 500)
" Open the list automatically:
"let g:neomake_open_list = 2
let g:neomake_ruby_enabled_makers = ['rubocop']


" remove end of line eol char for handlebars files
autocmd FileType html.handlbars setlocal noeol binary fileformats="mac,unix,dos"

" terraform.vim
let g:terraform_align=1
let g:terraform_fmt_on_save=1

" Make FZF respond to Ctrl-p
nnoremap <c-p> :Files<CR>

nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>s :Lines<CR>

" Setup neovim-remote as the nested editor when Git is ran inside vim.
" https://github.com/mhinz/neovim-remote
if has('nvim')
  let $GIT_EDITOR = 'nvr -cc split --remote-wait'
endif
autocmd FileType gitcommit,gitrebase,gitconfig set bufhidden=delete

