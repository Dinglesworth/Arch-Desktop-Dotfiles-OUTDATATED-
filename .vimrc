" Dinglesworth's magnificent minimal VIM config!

"Adding full colours to vim 
if (empty($TMUX))
  if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" BASIC SETTING CHANGES
set termguicolors
set number
set autoindent
set tabstop=4
set softtabstop=4
syntax enable
set showcmd
set showmatch
set mouse=a
filetype plugin on
set autochdir
set hlsearch

" COLOUR SCHEME
colorscheme nord
"set background=dark 
"UNCOMMENT TO GIVE SOLID BLACK BACKGROUND

" NERDTREE Settings
"autocmd vimenter * NERDTree 
" UNCOMMENT ABOVE LINE TO HAVE NERDTREE OPEN ON START
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" KEY REMAPS
map <C-N> :NERDTreeToggle<CR>
map gn :bn<cr>
map gp :bp<cr>
map gd :bd<cr>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

noremap , :

let g:user_emmet_leader_key='<C-X>'

" Change the vertical split seperator
set fillchars+=vert:█

" AIRLINE Settings
let g:airline_theme='nord'
let g:one_allow_italics=1 
let g:airline#extensions#tabline#enabled = 1 
"" let g:airline_powerline_fonts=1

" NEOCOMPLETE Settings
let g:neocomplete#enable_at_startup = 1

" Pathogen loading plugins
execute pathogen#infect()
call pathogen#helptags()
