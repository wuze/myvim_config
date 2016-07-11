"=============================================================
" 清风大侠　vim configuration
"
" @20151216
"=============================================================


"=============================================================
" common  start
"=============================================================
set nocompatible                  

syntax on                           
filetype plugin indent on          


set number                       
set numberwidth=3               
set textwidth=0                
set nowrap                    
set showcmd                  
set ruler                           " line and column number of the cursor position
set wildmenu                        " enhanced command completion
set wildmode=list:longest,full      " command completion mode
set laststatus=2                    " always show the status line
set foldenable                      " fold lines
set foldmethod=marker               " fold as marker 
set noerrorbells                    " do not use error bell
set novisualbell                    " do not use visual bell
set t_vb=                           " do not use terminal bell
set t_Co=256  " 设置颜色

set wildignore=.svn,.git,*.swp,*.bak,*~,*.o,*.a
set autowrite                       " auto save before commands like :next and :make
set hidden                          " enable multiple modified buffers
set history=100                     " record recent used command history
set autoread                        " auto read file that has been changed on disk
set backspace=indent,eol,start      " backspace can delete everything
set completeopt=menuone,longest,menu     " complete options (insert)
set pumheight=10                    " complete popup height
set scrolloff=5                     " minimal number of screen lines to keep beyond the cursor
set autoindent                      " automatically indent new line
set cinoptions=:0,l1,g0,t0,(0,(s    " C kind language indent options
set mouse=

set tabstop=4                       " number of spaces in a tab
set softtabstop=4                   " insert and delete space of <tab>
set shiftwidth=4                    " number of spaces for indent
set expandtab                       " expand tabs into spaces
set incsearch                       " incremental search
set hlsearch                        " highlight search match
set ignorecase                      " do case insensitive matching
set smartcase                       " do not ignore if search pattern has CAPS
set nobackup                        " do not create backup file
set noswapfile                      " do not create swap file
set linespace=0

set backupcopy=yes                  
set background=dark

colorscheme vividchalk

"make Y consistent with C and D
nnoremap Y y$


"　移动居中
nnoremap j jzz
nnoremap k kzz

" toggle highlight trailing whitespace
nmap <silent> <leader>l :set nolist!<CR>

" Ctrol-E to switch between 2 last buffers
nmap <C-E> :b#<CR>

" ,e to fast finding files. just type beginning of a name and hit TAB
nmap <leader>e :e **/

"  搜索结果显示在中间
nnoremap n   nzz
nnoremap N   Nzz
nnoremap *   *zz
nnoremap #   #zz
nnoremap g*  g*zz
nnoremap g#  g#z

"=========================
" 分屏切换
"=========================
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
"=========================
" 分屏切换
"=========================


"=========================
" vim 文件位置
"=========================
if has("win32") " win32 system
    let $HOME  = $VIM
    let $VIMFILES = $HOME . "/vimfiles"
else " unix
    let $HOME  = $HOME
    let $VIMFILES = $HOME . "/.vim"
endif

" gui settings
if has("gui_running")
    set guifont=Consolas:h9
    set guioptions-=T " no toolbar
    set guioptions-=r " no right-hand scrollbar
    set guioptions-=R " no right-hand vertically scrollbar
    set guioptions-=l " no left-hand scrollbar
    set guioptions-=L " no left-hand vertically scrollbar
    autocmd GUIEnter * simalt ~x " window width and height
    source $VIMRUNTIME/delmenu.vim " the original menubar has an error on win32, so
    source $VIMRUNTIME/menu.vim    " use this menubar
    language messages zh_CN.utf-8 " use chinese messages if has
endif

" Restore the last quit position when open file.
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \     exe "normal g'\"" |
    \ endif

"设置编码
set fileencodings=utf-8,ucs-bom,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileformat=unix


""" 如果没有airline 就显示自己的status line 也可以
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}

"=============================================================
" common end 
"=============================================================


"=============================================================
" Bundle end 
"=============================================================
filetype off                    " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'
Bundle 'mileszs/ack.vim'
Bundle 'Shougo/neocomplete.vim'
Bundle 'kien/ctrlp.vim'
"Bundle 'sukima/xmledit'
Bundle 'sjl/gundo.vim'
Bundle 'jiangmiao/auto-pairs'
"Bundle 'klen/python-mode'
Bundle 'SirVer/ultisnips'
Bundle 'Valloric/YouCompleteMe'
"Bundle 'scrooloose/syntastic'
Bundle 't9md/vim-quickhl'
Bundle 'bling/vim-airline'
Bundle 'scrooloose/nerdcommenter'
Bundle 'fatih/vim-go'                                                                                                                                   
Bundle 'godlygeek/tabular'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'nishigori/vim-php-dictionary'
"..................................
" vim-scripts repos
"Bundle 'YankRing.vim'
Bundle 'vcscommand.vim'
Bundle 'ShowPairs'
Bundle 'SudoEdit.vim'
Bundle 'EasyGrep'
Bundle 'MatchTag'
Bundle 'VOoM'
Bundle 'VimIM'
Bundle 'matchit.zip'
Bundle 'surround.vim'
Bundle 'indentLine.vim'

"..................................
" non github repos
 Bundle 'git://git.wincent.com/command-t.git'
"......................................
filetype plugin indent on

"==========
" Bundle end
"==========


"==========
" tags
"==========
"set tags=tags;/
"set tags+=~/.vim/systags
"set tags+=$Pwd/tags
set  tags+=.,./tags;/
set autochdir


let Tlist_Sort_Type            = "name"    " 按照名称排序
let Tlist_Use_Right_Window     = 1  " 在右侧显示窗口
let Tlist_Compart_Format       = 1    " 压缩方式
let Tlist_Exist_OnlyWindow     = 1  " 如果只有一个buffer，kill窗口也kill掉buffer
let Tlist_File_Fold_Auto_Close = 0  " 不要关闭其他文件的tags
let Tlist_Enable_Fold_Column   = 0    " 不要显示折叠树

autocmd FileType php  set tags+=/data/tags/php
"autocmd FileType java set tags+=/data/tags/java
"autocmd FileType h,cpp,cc,c set tags+=/data/tags/cpp
"==========
" tags
"==========



"默认打开Taglist 
let Tlist_Auto_Open=0 

"=============================
" Tag list (ctags) 
"=============================

let Tlist_Ctags_Cmd        = '/usr/bin/ctags'
let Tlist_Show_One_File    = 1 "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow  = 1 "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1 "在右侧窗口中显示taglist窗口

" minibufexpl插件的一般设置
let g:miniBufExplMapWindowNavVim    = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs  = 1
let g:miniBufExplModSelTarget       = 1

"=============================
" Tag list (ctags) 
"=============================



"=============================
" ctrlp
"=============================
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$\|.rvm$'
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1
"=============================
" ctrlp
"=============================






"=============================================================
" neocomplete start
"=============================================================
let g:neocomplete#enable_at_startup = 1
"autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
let g:pydiction_location='~/.vim/tools/pydiction/complete-dict'

" tab  键补全
let g:SuperTabRetainCompletionType = 2
"let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
let g:SuperTabDefaultCompletionType="context"
"=============================================================
" neocomplete end
"=============================================================


"=============================================================
" ycm start
"=============================================================
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'qf' : 1,
      \ 'notes' : 1,
      \ 'markdown' : 1,
      \ 'unite' : 1,
      \ 'text' : 1,
      \ 'vimwiki' : 1,
      \ 'gitcommit' : 1,
      \}


set completeopt=longest,menu    "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口
"回车即选中当前项
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>" 
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

"youcompleteme  默认tab  s-tab 和自动补全冲突
"let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion=['<c-p>']
"let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示

let g:ycm_collect_identifiers_from_tags_files=1 " 开启 YCM 基于标签引擎
let g:ycm_min_num_of_chars_for_completion=2 " 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0  " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1    " 语法关键字补全
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>    
"force recomile with syntastic
"nnoremap <leader>lo :lopen<CR> "open locationlist
"nnoremap <leader>lc :lclose<CR>    "close locationlist
inoremap <leader><leader> <C-x><C-o>
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0

" 跳转到定义处
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR> 
"=============================================================
" ycm end
"=============================================================





"=============================================================
" redcross
"=============================================================
set cursorline
set cursorcolumn
hi cursorline  cterm=NONE   ctermbg=darkred ctermfg=white
hi cursorcolumn cterm=NONE ctermbg=darkred ctermfg=white
"=============================================================
" redcross
"=============================================================



"=============================================================
" airline start
"=============================================================
"set laststatus=2  "已经在尾部设置了
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#quickfix#quickfix_text = 'Quickfix'
let g:airline#extensions#syntastic#enabled = 1

set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 11  

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_theme_patch_func = 'AirlineThemePatch'
function! AirlineThemePatch(palette)
  if g:airline_theme == 'luna'
    for colors in values(a:palette.inactive)
      let colors[3] = 245
    endfor
  endif
endfunction

" 显示全路径
function! CurDir()
    let curdir = substitute(getcwd(), '/home/lishiwu/', "~/", "g")
    return curdir
endfunction

"==================================
" 生成tags 快捷键
"==================================
function! UpdateTagsFile()
    silent !ctags -R --fields=+ianS --extra=+q
endfunction

nmap <F12>:call UpdateTagsFile()<CR>

""设置taglist窗口打开快捷键tl
nmap tl :TlistToggle<cr>"

"==================================
" 生成tags 快捷键
"==================================



"==================================
" NerdTree start
"==================================
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
 autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif
map <F2> :NERDTreeToggle<CR>

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
"==================================
"NerdTree end
"==================================




"==================================
" vim-go start 
"==================================

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1


"let g:go_fmt_command = goimports


"==================================
" vim-go start 
"==================================

"==================================
" indentLine 显示关闭切换 start 
"==================================
"nmap il :IndentLinesToggle<CR>"
"==================================
" indentLine 显示关闭切换 
"==================================
