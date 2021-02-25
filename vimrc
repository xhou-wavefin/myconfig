set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'preservim/nerdtree'
" Plugin 'kien/ctrlp.vim'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
" Plugin 'davidhalter/jedi-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()            " required
filetype plugin indent on    " required

" enable syntax highlighting
syntax enable

" show line numbers
set number

" set tabs to have 4 spaces
set ts=4

" indent when moving to the next line while writing code
set autoindent

" expand tabs into spaces
set expandtab

" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4

" show a visual line under the cursor's current line
" set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch

" enable all Python syntax highlighting features
let python_highlight_all = 1

:set number relativenumber

set noswapfile "No swapfile

set clipboard=unnamed "Copy paste across vim sessions"

set backspace=2  "This makes the backspace key function like it does in other programs.

set smarttab  "Improves tabbing

set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:· "list bad spaces
set hlsearch "Highlight while searching
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
set hidden "Maintain buffer data to allow undo after switching buffers

" NERDTree
nnoremap <C-t> :NERDTree<CR>
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
" autocmd VimEnter * NERDTree | wincmd p

" Colour Theme
if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif

" FZF Ag search
nmap <C-f> :Ag<CR>
nmap <C-b> :Buffers<CR>
nmap <C-h> :History<CR>

" tabs 
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tt  :tabedit<Space>
nnoremap th  :tabfirst<CR>
nnoremap tl  :tablast<CR>
nnoremap td  :tabclose<CR> 

" start relative numbering
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>
:au FocusLost * :set number
:au FocusGained * :set relativenumber
" end relative numbering

"airline smart tab line
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t' "only show filename in buffer
set laststatus=2
let g:tmuxline_powerline_separators = 0
"let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#formatter = 'default'

" Tab and shift tab cycle through buffers
nmap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nmap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

" close buffer with \q
nmap <leader>q :bp<cr>:bd #<cr>
