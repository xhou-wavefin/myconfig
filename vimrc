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
Plugin 'rhysd/git-messenger.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'

call vundle#end()            " required
filetype plugin indent on    " required

" auto reload the changed file
set autoread

" enable syntax highlighting
syntax enable

" show line numbers
set number

" indent when moving to the next line while writing code
set autoindent

" expand tabs into spaces
set expandtab

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
" set tabstop=2  "How much space Vim gives to a tab
set shiftwidth=2  "Assists code formatting
set smarttab  "Improves tabbing

set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:· "list bad spaces
set hlsearch "Highlight while searching
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
set hidden "Maintain buffer data to allow undo after switching buffers

set mouse=a  "Allows you to click around the text editor with your mouse to move the cursor

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
nmap <C-f> :Ag <CR>
noremap <C-_> :Ag <C-R><C-W><CR>
nmap <C-b> :Buffers<CR>
nmap <C-h> :History<CR>

" tabs
"nnoremap tj  :tabnext<CR>
"nnoremap tk  :tabprev<CR>
"nnoremap tt  :tabedit<Space>
"nnoremap th  :tabfirst<CR>
"nnoremap tl  :tablast<CR>
"nnoremap td  :tabclose<CR>

" start relative numbering
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>
":au FocusLost * :set number
":au FocusGained * :set relativenumber
" end relative numbering

"airline smart tab line
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t' "only show filename in buffer
set laststatus=2
let g:tmuxline_powerline_separators = 0
"let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#formatter = 'default'
"let g:airline#extensions#tagbar#flags = 'f'  " show full tag hierarchy

" tagbar
nmap <leader>tb :TagbarToggle<CR>

" Tab and shift tab cycle through buffers
nnoremap <C-l> :bn<cr>
nnoremap <C-h> :bp<cr>

" close buffer with \q close all others with \oq
nmap <leader>q :bp<cr>:bd #<cr>
nmap <leader>qo :%bd<bar>e#<bar>bd#<cr>

" json formatting
nmap <leader>fj :%!python -m json.tool<cr>

" git open url
nnoremap <leader>gu :!echo `git url`/blob/`git rev-parse --abbrev-ref HEAD`/%\#L<C-R>=line('.')<CR> \| xargs open<CR><CR>

" quote manipulation
:nnoremap <Leader>q" ciw""<Esc>P
:nnoremap <Leader>q' ciw''<Esc>P
:nnoremap <Leader>qd daW"=substitute(@@,"'\\\|\"","","g")<CR>P

" different tab space settings depends on file types
autocmd Filetype python setlocal ts=4 sts=4 sw=4
autocmd Filetype js setlocal ts=2 sts=2 sw=2

" insert new lines without insert mode, several lines 3\o
nnoremap <silent> <leader>o :<C-u>call append(line("."),   repeat([""], v:count1))<CR>
nnoremap <silent> <leader>O :<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>

nnoremap <expr> k (v:count > 1 ? "m'" . v:count : '') . 'gk'
nnoremap <expr> j (v:count > 1 ? "m'" . v:count : '') . 'gj'

nnoremap <C-p> "0p

