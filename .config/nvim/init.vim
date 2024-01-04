call plug#begin('~/.local/share/nvim/plugged')

Plug 'myusuf3/numbers.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'Mofiqul/dracula.nvim'
Plug 'bryanmylee/vim-colorscheme-icons'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

" Select a Thmeme
colorscheme catppuccin-mocha " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
" colorscheme dracula

" noremap <C-p> :GFiles<CR>
