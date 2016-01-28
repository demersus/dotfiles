if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
NeoBundle 'shougo/unite.vim'
NeoBundle 'godlygeek/tabular'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'bling/vim-airline'
NeoBundle 'townk/vim-autoclose'
NeoBundle 'tpope/vim-bundler'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'shougo/vimproc.vim', {
      \  'build' : {
      \    'unix' :  'make -f make_unix.mak'
      \  }
      \}
NeoBundle 'sheerun/vim-polyglot'

"
" All of your Bundles must be added before the following line
call neobundle#end()  
" Required
filetype indent plugin on
" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

syntax enable 

set t_Co=256
set nu
let g:solarized_termcolors=256
set hlsearch " highlight words with *
if has("gui_running")
  set background=light
else
  set background=dark
endif
colorscheme solarized

set smartindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set colorcolumn=80
set backspace=2 " make backspace work like most other apps
set laststatus=2
set guioptions=aem
set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 10


" Press F4 to toggle highlighting on/off, and show current value.
noremap <F4> :set hlsearch! hlsearch?<CR>

let g:mapleader = '\'

let g:user_emmet_leader_key='<C-Z>'

let g:airline_powerline_fonts = 1

set wildmode=longest:full,full

map <C-n> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1


"""""""" unite.vim
let g:unite_source_history_yank_enable = 1
if executable('ag')
  let g:unite_source_rec_async_command = [ 'ag', '-l', '-g', '', '--nocolor' ]
  "let g:unite_source_grep_default_opts = '--line-numbers --nocolor --nogroup --smart-case'
endif

noremap <silent> <leader>b :Unite buffer<CR> 
noremap <silent> <leader>f :Unite -start-insert file_rec/async<CR> 
noremap <silent> <leader>g :Unite grep:.<CR> 
noremap <silent> <leader>m :Unite -buffer-name=recent -winheight=10 file_mru<CR>
noremap <silent> <leader>y :Unite history/yank<CR>

autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  let b:SuperTabDisabled=1
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
  imap <silent><buffer><expr> <C-x> unite#do_action('split')
  imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  imap <silent><buffer><expr> <C-t> unite#do_action('tabopen')

  nmap <buffer> <ESC> <Plug>(unite_exit)
endfunction
"""""""

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
let g:rspec_command = "Dispatch rspec {spec}"

" Functions
function! RunCukeSuite()
  execute "Dispatch cucumber"
endfunction
map <Leader>c :call RunCukeSuite()<CR>
function! RunRspecSuite()
  execute "Dispatch rspec"
endfunction
map <Leader>r :call RunRspecSuite()<CR>

" Dispatch settings
nnoremap <F9> :Dispatch<CR>
autocmd FileType cucumber compiler cucumber | setl makeprg=cucumber\ \"%:p\"
autocmd FileType ruby
      \ if expand('%') =~# '_test\.rb$' |
      \   compiler rubyunit | setl makeprg=testrb\ \"%:p\" |
      \ elseif expand('%') =~# '_spec\.rb$' |
      \   compiler rspec | setl makeprg=rspec\ \"%:p\" |
      \ else |
      \   compiler ruby | setl makeprg=ruby\ -wc\ \"%:p\" |
      \ endif
autocmd User Bundler
      \ if &makeprg !~# 'bundle' | setl makeprg^=bundle\ exec\  | endif
