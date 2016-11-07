"git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


Bundle 'altercation/vim-colors-solarized'
Bundle 'vim-scripts/TagHighlight'
Bundle 'davidhalter/jedi-vim'
Bundle 'bling/vim-airline'
Bundle 'majutsushi/tagbar'
"Bundle 'Yggdroot/indentLine'
Bundle 'Valloric/YouCompleteMe'
Bundle 'rdnetto/YCM-Generator'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'scrooloose/nerdtree'
"Bundle 'powerline/powerline'
"Bundle 'thinca/vim-ref'
"Bundle 'gmarik/vundle'
"Bundle 'Lokaltog/vim-powerline'
Plugin 'vim-scripts/DoxygenToolkit.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'xolox/vim-misc'  " required by lua.vim
Plugin 'xolox/vim-lua-ftplugin'  " Lua file type plug-in for the Vim text editor
Plugin 'fatih/vim-go'
Plugin 'cespare/vim-golang'


call vundle#end()
"filetype on
filetype indent on
filetype plugin on 
set showcmd         " 输入的命令显示出来，看的清楚些  
set wildmode=longest,list,full 
set wildmenu "按tab列出匹配的vim命令
syntax on           " 语法高亮  
syntax enable
set background=dark
colorscheme solarized
let g:solarized_termcolors=256

if has('gui_running')
    colorscheme solarized
    map  <silent>  <S-Insert>  "+p
    imap <silent>  <S-Insert>  <Esc>"+pa

    set guifont=Microsoft\ YaHei\ Mono\ 11.5
endif

set nocompatible
set laststatus=2



if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"autocmd FileType lua set omnifunc=ccomplete#Complete
"autocmd FileType lua set omnifunc=lua_complete_omni

" 定义快捷键的前缀，即<Leader>
 let mapleader=";"
" 定义快捷键到行首和行尾
nmap <Leader>lb 0
nmap <Leader>le $
" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至 vim
nmap <Leader>p "+p
" 定义快捷键关闭当前分割窗口
nmap <Leader>q :q<CR>
" 定义快捷键保存当前窗口内容
nmap <Leader>w :w<CR>
" 定义快捷键保存所有窗口内容并退出 vim
nmap <Leader>WQ :wa<CR>:q<CR>
" 不做任何保存，直接退出 vim
nmap <Leader>Q :qa!<CR>
" 依次遍历子窗口
nnoremap <Leader>nw <C-W><C-W>
" 跳转至右方的窗口
nnoremap <Leader>lw <C-W>l
" 跳转至方的窗口
nnoremap <Leader>hw <C-W>h
" 跳转至上方的子窗口
nnoremap <Leader>kw <C-W>k
" 跳转至下方的子窗口
nnoremap <Leader>jw <C-W>j
" 定义快捷键在结对符之间跳转，助记pair
nmap <Leader>pa %

" 显示中文帮助
if version >= 603
    set helplang=cn
    set encoding=utf-8
endif
"系统剪贴板映射 
vmap <C-c> "+y<ESC>
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+p

set hlsearch
set incsearch
set ignorecase
"hi Search term=standout ctermfg=3 ctermbg=6
set cindent shiftwidth=8
set backspace=indent,eol,start
set tags=./tags,tags

" 基于缩进或语法进行代码折叠
" "set foldmethod=indent
set foldmethod=syntax
" " 启动 vim 时关闭折叠代码
set nofoldenable
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>



"C，C++ 按F5编译运行
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!gcc % -o %< -g"
        exec "! ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %< -g  -std=c++11"
        exec "! ./%<"
    elseif &filetype == 'java' 
        exec "!javac %" 
        exec "!java %<"
    elseif &filetype == 'sh'
        :!./%
    elseif &filetype == 'python'
        exec "!python %"
    elseif &filetype == 'lua'
        exec "!lua %"

    endif
endfunc
    
map <F7> :call Compile()<CR>
func! Compile()
    exec "w"
    exec "!make"    
    exec "! ./%<"
endfunc
""""""""""""""""""""""""""""""
"""Ｔａｇｂａｒ
""""""""""""""""""""""""""""""
nmap <F8> :TagbarToggle<CR>
" 设置 tagbar 子窗口的位置出现在主编辑区的左边 
let tagbar_left=1 
" 设置显示／隐藏标签列表子窗口的快捷键。速记：tag list 
nnoremap <Leader>tl :TagbarToggle<CR> 
" 设置标签子窗口的宽度 
let tagbar_width=32 
" tagbar 子窗口中不显示冗余帮助信息 
let g:tagbar_compact=1
" 设置 ctags 对哪些代码元素生成标签
let g:tagbar_type_cpp = {
    \ 'kinds' : [
        \ 'd:macros:1',
        \ 'g:enums',
        \ 't:typedefs:0:0',
        \ 'e:enumerators:0:0',
        \ 'n:namespaces',
        \ 'c:classes',
        \ 's:structs',
        \ 'u:unions',
        \ 'f:functions',
        \ 'm:members:0:0',
        \ 'v:global:0:0',
        \ 'x:external:0:0',
        \ 'l:local:0:0'
     \ ],
     \ 'sro'        : '::',
     \ 'kind2scope' : {
         \ 'g' : 'enum',
         \ 'n' : 'namespace',
         \ 'c' : 'class',
         \ 's' : 'struct',
         \ 'u' : 'union'
     \ },
     \ 'scope2kind' : {
         \ 'enum'      : 'g',
         \ 'namespace' : 'n',
         \ 'class'     : 'c',
         \ 'struct'    : 's',
         \ 'union'     : 'u'
     \ }
\ }
""""""""""""""""""""""""""""""
"""粘贴模式粘貼粘贴
""""""""""""""""""""""""""""""
:map <F10> :set paste<CR>
:map <F11> :set nopaste<CR>
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set completeopt=preview,menu 
"set laststatus=2
set showmatch
set matchtime=1
set smartindent

"共享剪贴板  
set clipboard=unnamed 

set ruler                   " 打开状态栏标尺
set cursorline              " 突出显示当前行
set magic                   " 设置魔术
" 禁止光标闪烁
set gcr=a:block-blinkon0
" " 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

set guioptions-=T           " 隐藏工具栏
set guioptions-=m           " 隐藏菜单栏

" 去掉输入错误的提示声音
set noeb
" 在处理未保存或只读文件的时候，弹出确认
set confirm
" 自动缩进
set autoindent
set cindent
" Tab键的宽度
set tabstop=4
" 统一缩进为4
set softtabstop=4
set shiftwidth=4
" 空格代替制表符
set expandtab
" 在行和段开始处使用制表符
"set smarttab
" 显示行号
set number
" 历史记录数
set history=1000

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CTags的设定  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let Tlist_Sort_Type = "name"    " 按照名称排序    
let Tlist_Use_Right_Window = 1  " 在右侧显示窗口  
let Tlist_Compart_Format = 1    " 压缩方式  
let Tlist_Exist_OnlyWindow = 1  " 如果只有一个buffer，kill窗口也kill掉buffer  
let Tlist_File_Fold_Auto_Close = 0  " 不要关闭其他文件的tags  
let Tlist_Enable_Fold_Column = 0    " 不要显示折叠树  

let Tlist_Show_menu = 1
let Tlist_Show_one_File = 1
let Tlist_Exit_OnlyWindow = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""powerline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256
set encoding=utf-8

"let g:Powerline_symbols = 'unicode'

""""""""""""""""""""""""""""""""""""""""""""""""
"""" vim-airline
""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
"let g:airline_symbols = 'unicode'

function! AirlineInit()
    let g:airline#extensions#tabline#enabled = 1 
    let g:airline#extensions#hunks#hunk_symbols = ['+', '~', '-']
    let g:airline_powerline_fonts=1
    let g:airline#extensions#tabline#enabled = 1
    let g:Powerline_symbols = 'fancy'
    let g:airline_powerline_fonts=1
    "let g:airline_section_a = airline#section#create(['mode', ' ', 'branch'])
    "let g:airline_section_b = airline#section#create_left(['ffenc', 'hunks', '%f'])
    "let g:airline_section_c = airline#section#create(['filetype'])   
    "let g:airline_section_x = airline#section#create(['%P'])   
    "let g:airline_section_y = airline#section#create(['%B'])   
    "let g:airline_section_z = airline#section#create_right(['%l', '%c'])                                                        
endfunction
"autocmd VimEnter * call AirlineInit()
call AirlineInit()

"let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'c'  : 'C',
      \ 'v'  : 'V',
      \ 'V'  : 'V',
      \ '' : 'V',
      \ 's'  : 'S',
      \ 'S'  : 'S',
      \ '' : 'S',
      \ }

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
    " unicode symbols
    let g:airline_left_sep = '»'
    let g:airline_right_sep = '«'
    let g:airline_symbols.linenr = '¶'
    "let g:airline_symbols.branch = '⎇'
    let g:airline_symbols.paste = 'ρ'
    let g:airline_symbols.whitespace = 'Ξ'

    " powerline symbols
    "let g:airline_left_sep = ''
    "let g:airline_left_alt_sep = ''
    "let g:airline_right_sep = ''
    "let g:airline_right_alt_sep = ''
    let g:airline_symbols.branch = ''
    let g:airline_symbols.readonly = ''
    "let g:airline_symbols.linenr = ''

    " old vim-powerline symbols
    "let g:airline_left_sep = '⮀'
    "let g:airline_left_alt_sep = '⮁'
    "let g:airline_right_sep = '⮂'
    "let g:airline_right_alt_sep = '⮃'
    "let g:airline_symbols.branch = '⭠'
    "let g:airline_symbols.readonly = '⭤'
    "let g:airline_symbols.linenr = '⭡'
endif

""""""""""""""""""""""""""""""""""""""""""
"""cscope
""""""""""""""""""""""""""""""""""""""""""

if filereadable("cscope.out")
    cs add cscope.out
elseif $CSCOPE_DB != ""
    cs add $CSCOPE_DB
endif
nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>f :cs find f <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>i :cs find i ^<C-R>=expand("<cword>")<CR>$<CR>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>
""""""""""""""""""""""""""""""""""""""""""
"""indentLine
""""""""""""""""""""""""""""""""""""""""""
"autocmd BufRead * :IndentLinesEnable
"function! InitIndentLine()
"    let g:indent_guides_auto_colors = 0
"    let g:indent_guides_guide_size = 1 
"    autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
"    autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
"    hi IndentGuidesOdd guibg=red ctermbg=3
"    hi IndentGuidesEven guibg=green ctermbg=4
"endfunction
"call InitIndentLine()
""let g:indentLine_color_term = 100
""let g:indentLine_char = '︙'
"map <leader>il :IndentLinesToggle<CR>
"function! SetColorColumn()
"
"	let col_num = virtcol(".")
"	let cc_list = split(&cc, ',')
"	if count(cc_list, string(col_num)) <= 0
"		execute "set cc+=".col_num
"	else
"		execute "set cc-=".col_num
"	endif
"endfunction^
"map ,ch :call SetColorColumn()<CR>
"call SetColorColumn()
""""""""""""""""""""""""""""""""""""""""""
"""YouComlementMe
""""""""""""""""""""""""""""""""""""""""""
let g:ycm_global_ycm_extra_conf= '~/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion=1
let g:syntastic_error_symbol = '✗'
let g:ycm_confirm_extra_conf = 0
highlight YcmErrorLine guibg=#ffefef
highlight YcmErrorLine guibg=#efffef
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>

""""""""""""""""""""""""""""""""""""""""""
"""YCM-Generator
""":CCGenerateConfig 
""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""
"""""vim-cmake
""""""""""""""""""""""""""""""""""""""""""
let g:vim_cmake_executable = 'cmake'
let g:vim_ccmake_executable = 'ccmake'

let g:vim_ctest_executable = 'cpack'
let g:vim_ctest_executable = 'ctest'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""" vim-indent-guides
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=0
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
nmap <silent> <Leader>i <Plug>IndentGuidesToggle

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""" nerdtree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nmap <Leader>fl :NERDTreeToggle<CR>
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=32
" 设置NERDTree子窗口位置
let NERDTreeWinPos="right"
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""" nerd commenter
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <Leader>cc         注释当前行
nmap <Leader>cn         nested注释
nmap <Leader>c<space>   切换选定
nmap <Leader>cu         取消注释
nmap <Leader>ca         切换方式
nmap <Leader>cA         行尾添加注释符

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""" doxygenToolKit
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
let g:DoxygenToolkit_briefTag_pre="@brief  "
let g:DoxygenToolkit_paramTag_pre="@Param "
let g:DoxygenToolkit_returnTag="@Returns   "
let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------"
let g:DoxygenToolkit_authorName="Halle Wong"
"let g:DoxygenToolkit_licenseTag="My own license"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""" lua
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
let g:lua_complete_omni = 1
let g:lua_define_omnifunc = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""" lua
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
if exists('$TMUX')
    set term=screen-256color
    "set term=screen
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"go bar
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tagbar_type_go = {  
    \ 'ctagstype' : 'go',  
    \ 'kinds'     : [  
        \ 'p:package',  
        \ 'i:imports:1',  
        \ 'c:constants',  
        \ 'v:variables',  
        \ 't:types',  
        \ 'n:interfaces',  
        \ 'w:fields',  
        \ 'e:embedded',  
        \ 'm:methods',  
        \ 'r:constructor',  
        \ 'f:functions'  
    \ ],  
    \ 'sro' : '.',  
    \ 'kind2scope' : {  
        \ 't' : 'ctype',  
        \ 'n' : 'ntype'  
    \ },  
    \ 'scope2kind' : {  
        \ 'ctype' : 't',  
        \ 'ntype' : 'n'  
    \ },  
    \ 'ctagsbin'  : 'gotags',  
    \ 'ctagsargs' : '-sort -silent'  
\ } 
