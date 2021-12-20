syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap
set smartcase
set noswapfile
set undodir=~/.vim/undodir
set undofile
set incsearch
set hidden
set mouse=a

autocmd FileType typescript setlocal ts=2 sts=2 sw=2
autocmd FileType javascript setlocal ts=2 sts=2 sw=2
autocmd FileType html setlocal ts=2 sts=2 sw=2
autocmd FileType vue setlocal ts=2 sts=2 sw=2

" Relative numbers on focused window
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" Line for the 100 character limit
set colorcolumn=100
hi ColorColumn ctermbg=darkgrey guibg=darkgrey

" Install plugins if updated run :PlugInstall
call plug#begin('~/.config/nvim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
"Plug 'lervag/vimtex'
Plug 'tpope/vim-fugitive'
Plug 'mg979/vim-visual-multi'
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
call plug#end()
" Ctrl+P should search buffers + current dir + recently opened 
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_use_caching = 0

" Start autocomplete
let g:deoplete#enable_at_startup = 1

" Move lines using alt+shift+{j,k}
nnoremap <A-S-j> :m .+1<CR>==
nnoremap <A-S-k> :m .-2<CR>==
inoremap <A-S-j> <Esc>:m .+1<CR>==gi
inoremap <A-S-k> <Esc>:m .-2<CR>==gi
vnoremap <A-S-j> :m '>+1<CR>gv=gv
vnoremap <A-S-k> :m '<-2<CR>gv=gv
" For gnome-terminal that missends alt key
nnoremap J :m .+1<CR>==
nnoremap K :m .-2<CR>==
inoremap J <Esc>:m .+1<CR>==gi
inoremap K <Esc>:m .-2<CR>==gi
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Navigate splits windows using ctrl+[hjkl]
inoremap <C-h> <Esc>:wincmd h<CR>
inoremap <C-j> <Esc>:wincmd j<CR>
inoremap <C-k> <Esc>:wincmd k<CR>
inoremap <C-l> <Esc>:wincmd l<CR>
nnoremap <C-h> :wincmd h<CR>
nnoremap <C-j> :wincmd j<CR>
nnoremap <C-k> :wincmd k<CR>
nnoremap <C-l> :wincmd l<CR>
" Sublime like color scheme
colorscheme monokai

" Multiple cursor plugin
let g:VM_mouse_mappings = 1
let g:VM_theme          = 'iceblue'
let g:VM_maps           = {}
let g:VM_maps["Undo"]   = 'u'
let g:VM_maps["Redo"]   = '<C-r>'

" Autocompletion using vim-go and deoplete.nvim
call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })
