let &shell="/bin/bash --login"
let mapleader = ","
map <silent> <esc> :noh<cr>
set nocompatible
"map escape key to jj 
imap jj <Esc>
"set runtimepath+=./
set t_Co=256
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

if empty(glob('~/.vim/colors/molokai.vim'))
    silent !curl -fLo ~/.vim/colors/molokai.vim --create-dirs
          \ https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim 
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


"stop myself from using arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>


set ttimeoutlen=50
set nowrap
" Colors {{{
syntax enable           " enable syntax processing
colorscheme molokai
" }}}
" Misc {{{
set ttyfast                     " faster redraw
set backspace=indent,eol,start
set hidden
set cursorline
set clipboard+=unnamed
" }}}
" Spaces & Tabs {{{
set tabstop=4           " 4 space tab
set expandtab           " use spaces for tabs
set softtabstop=4       " 4 space tab
set shiftwidth=4
set smartindent
set modelines=1
filetype indent on
filetype plugin on
set autoindent
set visualbell           " don't beep
set noerrorbells         " don't beep
" }}}
" UI Layout {{{
set number              " show line numbers
set showcmd             " show command in bottom bar
"set nocursorline          " highlight current line
set wildmenu
set lazyredraw
set showmatch           " higlight matching parenthesis
" }}}
" Searching {{{
set ignorecase          " ignore case when searching
set incsearch           " search as characters are entered
set hlsearch            " highlight all matches
" }}}
" Folding {{{
"=== folding ===
set foldmethod=indent   " fold based on indent level
set foldnestmax=10      " max 10 depth
set foldenable          " don't fold files by default on open
nnoremap <space> za
set foldlevelstart=10    " start with fold level of 1
" }}}
set splitbelow
set splitright
" Shortcuts {{{
" If the current buffer has never been saved, it will have no name,
" call the file browser to save it, otherwise just save it.
command! -nargs=0 -bar Update if &modified 
                           \|    if empty(bufname('%'))
                           \|        browse confirm write
                           \|    else
                           \|        confirm write
                           \|    endif
                           \|endif
nnoremap <C-s> :<C-u>Update<CR>
inoremap <C-s> <C-o>:Update<CR>
inoremap <C-s> <C-o>:Update<CR>
" }}}
"
"You complete me setting
" http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" open omni completion menu closing previous if open and opening new menu without changing the text
inoremap <expr> <C-Space> (pumvisible() ? (col('.') > 1 ? '<Esc>i<Right>' : '<Esc>i') : '') .
            \ '<C-x><C-o><C-r>=pumvisible() ? "\<lt>C-n>\<lt>C-p>\<lt>Down>" : ""<CR>'
" open user completion menu closing previous if open and opening new menu without changing the text
inoremap <expr> <S-Space> (pumvisible() ? (col('.') > 1 ? '<Esc>i<Right>' : '<Esc>i') : '') .
            \ '<C-x><C-u><C-r>=pumvisible() ? "\<lt>C-n>\<lt>C-p>\<lt>Down>" : ""<CR>'

"
" Vim-plug {{{
call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'maksimr/vim-jsbeautify'
Plug 'leafgarland/typescript-vim'
Plug 'mattn/emmet-vim'
Plug 'Valloric/YouCompleteMe'
Plug 'tpope/vim-fugitive'
Plug 'quramy/tsuquyomi'
Plug 'ervandew/supertab'
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/asyncrun.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'AndrewRadev/linediff.vim'
Plug 'tpope/vim-surround'
Plug 'TaDaa/vimade'
Plug 'pakutoma/toggle-terminal'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'OmniSharp/Omnisharp-vim'
Plug 'Mantisimo/ultisnip-mantisimo'
Plug 'jvanja/vim-bootstrap4-snippets'
Plug 'terryma/vim-smooth-scroll'
Plug 'dense-analysis/ale'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'scrooloose/nerdcommenter'
call plug#end()

" }}}

" Plugin settings 
"let g:OmniSharp_server_use_mono = 1
let g:OmniSharp_server_stdio = 1
"let g:OmniSharp_proc_debug = 1
"let g:OmniSharp_loglevel = 'debug'
let g:OmniSharp_server_loading_timeout = 5
let g:airline_extensions = ['branch','tabline']
let g:airline_powerline_fonts = 1
"let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
"let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#show_tabs = 1
"let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:asyncrun_open = 8

let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1



map <leader>n :NERDTreeToggle<CR>
map <silent> <C-n> :NERDTreeFocus<CR>
map <c-f> :call JsBeautify()<cr>
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

" Emmet, auto complete with tab
"autocmd FileType html imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
" <Ctrl-l> redraws the screen and removes any search highlighting.
" Ignores fuzzy searching of node_modules and git folders
let g:ctrlp_custom_ignore = 'build\|dist\|node_modules\|DS_Store\|git'
let g:ctrlp_show_hidden = 1
let g:ctrlp_open_multiple_files = 'r'
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_arg_map = 'r'
let g:ctrlp_use_caching = 0

let g:ale_set_highlights = 0

set completeopt-=preview

" tab shortcuts {{{
nnoremap tn :tabnew<CR>
nnoremap tq :tabclose><CR>
" }}}

" Store temporary files in a central spot {{{
  let vimtmp = $HOME . '/.tmp/' . getpid()
  silent! call mkdir(vimtmp, "p", 0700)
  let &backupdir=vimtmp
  let &directory=vimtmp
  let g:gutentags_cache_dir=vimtmp
" }}}


let g:vimade = {}
let g:vimade.fadelevel = 0.9

set mouse=a

command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   ('git grep -i --line-number '.(isdirectory(expand(".git"))?'--untracked ':'--no-index ')).shellescape(<q-args>), 0,
  \   { 'dir': getcwd() }, <bang>0)

map <leader>f :GGrep<CR>
map <leader>rl :source $MYVIMRC<CR>
map <leader>ev :e $MYVIMRC<CR>$gf
map <leader>s :w<CR>
tnoremap <esc>  <C-w><C-p>
tnoremap <esc>: <C-w><C-p>
"shift alt + greater less than keys
tnoremap ¯ : tabprevious<cr>
tnoremap ˘ : tabnext<cr>
nnoremap ¯ : tabprevious<cr>
nnoremap ˘ : tabnext<cr>
"alt + greater less than keys
tnoremap ≤ : <C-\><C-n>bp<cr>
tnoremap ≥ : <C-\><C-n>bn<cr>
nnoremap ≤ : bp<cr>
nnoremap ≥ : bn<cr>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>
nnoremap <Leader>b :b<Space>
nnoremap <Leader>q :bp\|bd#<CR>

tnoremap <silent> <leader>t <C-w><C-p>:ToggleTerminal<CR>
nnoremap <silent> <leader>t : ToggleTerminal<CR>
nnoremap <esc><esc>: <c-w><c-p>
nnoremap rt : rightb vert term<cr>
" set your favorite shell
let g:toggle_terminal#command = ''
let g:toggle_terminal#position = 'belowright'

let g:vimade = {
  \ "normalid": '',
  \ "normalncid": '',
  \ "basefg": '',
  \ "basebg": '',
  \ "fadelevel": 0.4,
  \ "colbufsize": 15,
  \ "rowbufsize": 15,
  \ "checkinterval": 100, 
  \ "usecursorhold": 0,
  \ "detecttermcolors": 1,
  \ 'enablesigns': 0,
  \ 'signsretentionperiod': 4000
  \}

autocmd TerminalOpen * if bufwinnr('') > 0 | setlocal nobuflisted | endif

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

autocmd FileType typescript nmap <buffer> <Leader>T : <C-u>echo tsuquyomi#hint()<CR>

" close all buffers except this one
nnoremap <silent> <leader>o :%bd\|e#<cr>
" Toggles line wrap
nnoremap <silent> <leader>w :set wrap!<cr>
nnoremap <silent> <leader>l :set invnumber<cr>
" Focus nerd tree
nnoremap <silent> <leader>L :NERDTreeFind<cr>
" Quit all
nnoremap <silent> ZA :qa<CR>
" Quit all diff, exits with non zero, causes git difftool or mergetool to stop
" looking at other files
nnoremap <silent> ZD :cq<CR>
" Show gstatus for stages and unstages files
nnoremap <silent> <leader>G :Gstatus<CR>
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 1)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 1)<CR>
autocmd FileType javascript UltiSnipsAddFiletypes javascript-jasmine-arrow
autocmd FileType typescript UltiSnipsAddFiletypes javascript-jasmine-arrow
