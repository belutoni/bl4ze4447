syntax on " Colored syntax highlighting
set history=1000 " Remember more commands
set wildmenu " Visual menu for command completion
set number
set relativenumber

set tabstop=4
set shiftwidth=4
set expandtab
set autoindent

if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'ziglang/zig.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'dracula/vim'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'

call plug#end()

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> <C-p>
tnoremap <Esc> <C-\><C-n>
tnoremap <C-w>h <C-\><C-n>h
tnoremap <C-w>l <C-\><C-n>l
tnoremap <C-w>j <C-\><C-n>j
tnoremap <C-w>k <C-\><C-n>k
nnoremap <C-b> :NERDTreeToggle<CR>

set splitbelow

let g:zig_fmt_autosave = 1

autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabFree() | quit | endif

augroup NumberToggle
    autocmd!
    autocmd InsertEnter * set norelativenumber
    autocmd InsertLeave * set relativenumber 
    autocmd BufEnter * set relativenumber
augroup END

if (has("termguicolors"))
    set termguicolors
endif

colorscheme dracula

highlight LspErrorHighlight   cterm=underline gui=underline guibg=NONE
highlight LspWarningHighlight cterm=underline gui=underline guibg=NONE
highlight LspInfoHighlight    cterm=underline gui=underline guibg=NONE
highlight LspHintHighlight    cterm=underline gui=underline guibg=NONE

