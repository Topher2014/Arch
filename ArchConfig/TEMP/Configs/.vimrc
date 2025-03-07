" Basic GVim Configuration
" Place this in ~/.gvimrc or ~/.vimrc

" === Interface Settings ===
set number                      " Show line numbers
set relativenumber              " Show relative line numbers
set laststatus=2                " Always show status line
set ruler                       " Show cursor position
set showmode                    " Show current mode
set showcmd                     " Show partial commands
set wildmenu                    " Enhanced command-line completion
set wildmode=longest,list,full  " Complete longest common string, list alternatives, complete next full match

" === Visual Settings ===
syntax on                       " Enable syntax highlighting
set background=dark             " Use dark background
if has('gui_running')
  try
    colorscheme evening         " Dark theme for GUI
  catch
    colorscheme desert          " Fallback if evening not available
  endtry
else
  try
    colorscheme slate           " Another good dark theme for terminal
  catch
    colorscheme desert          " Fallback
  endtry
endif
set guifont=Monospace\ 10       " Set GUI font (change to your preference)
set guioptions-=T               " Remove toolbar
set guioptions-=m               " Remove menu bar
set guioptions-=r               " Remove right-hand scroll bar
set guioptions-=L               " Remove left-hand scroll bar

" === Editing Features ===
"set autoindent                  " Auto-indent new lines
"set smartindent                 " Smart auto-indenting
set expandtab                   " Use spaces instead of tabs
set tabstop=4                   " Tab width is 4 spaces
set shiftwidth=4                " Indent also with 4 spaces
set wrap                        " Wrap lines
set textwidth=0                 " Don't auto-wrap text
set backspace=indent,eol,start  " Backspace through everything in insert mode

" === Search Settings ===
set hlsearch                    " Highlight search results
set incsearch                   " Incremental search
set ignorecase                  " Case-insensitive search...
set smartcase                   " ...unless uppercase letters are used

" === Clipboard Support ===
set clipboard=unnamed,unnamedplus  " Use system clipboard
vnoremap <C-c> "+y                " Map Ctrl+C to copy in visual mode
vnoremap <C-x> "+d                " Map Ctrl+X to cut in visual mode
nnoremap <C-v> "+p                
inoremap <C-v> <C-r>+             

" === Key Mappings ===
" Map F2 to toggle paste mode (to paste formatted text properly)
set pastetoggle=<F2>

" Press F3 to toggle line numbers
nnoremap <F3> :set number! relativenumber!<CR>

" Map Ctrl+S to save
nnoremap <C-s> :update<CR>
inoremap <C-s> <Esc>:update<CR>
vnoremap <C-s> <Esc>:update<CR>

" === Misc Settings ===
set autoread                    " Auto-reload files changed outside of Vim
set history=1000                " Store lots of command history
set nobackup                    " Don't use backup files
set noswapfile                  " Don't use swap files

" === Optional: Restore cursor to file position in previous session ===
augroup resCur
  autocmd!
  autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END
