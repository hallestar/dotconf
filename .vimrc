set nocompatible
filetype off
if exists("$VUNDLE_ROOT")
    "let plugin_dir = '.vim/bundle/'
    let plugin_dir = $VUNDLE_ROOT
else
    let plugin_dir = $HOME . '/.vim/bundle/'
endif
let init_file_path=plugin_dir.'Vundle.vim'
exe 'set rtp+=' . expand(init_file_path)
call vundle#begin(plugin_dir)

Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-scripts/TagHighlight'
"Plugin 'davidhalter/jedi-vim'
Plugin 'bling/vim-airline'
Plugin 'majutsushi/tagbar'
"Plugin 'Yggdroot/indentLine'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'rdnetto/YCM-Generator'
"Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'scrooloose/nerdtree'
"Plugin 'powerline/powerline'
"Plugin 'thinca/vim-ref'
"Plugin 'gmarik/vundle'
"Plugin 'Lokaltog/vim-powerline'
Plugin 'vim-scripts/DoxygenToolkit.vim'
Plugin 'preservim/nerdcommenter'

Plugin 'xolox/vim-misc'  " required by lua.vim
Plugin 'vim-scripts/lua.vim'
"Plugin 'xolox/vim-lua-ftplugin'  " Lua file type plug-in for the Vim text editor
"Plugin 'fatih/vim-go'
Plugin 'vim-scripts/a.vim'
"Plugin 'Shougo/neocomplete.vim'
"Plugin 'SirVer/ultisnips'
"Plugin 'honza/vim-snippets'
"Plugin 'shawncplus/phpcomplete.vim'


call vundle#end()

filetype indent on
filetype plugin on 
set showcmd
set wildmode=longest,list,full 
set wildmenu
syntax on

" theme
let g:solarized_termcolors=256
syntax enable
let solarized_dir = plugin_dir . 'vim-colors-solarized/colors/solarized.vim'
if filereadable(solarized_dir)
    colorscheme solarized
endif
set background=dark
" theme

set nocompatible
set laststatus=2

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

autocmd FileType lua set omnifunc=ccomplete#Complete
"autocmd FileType lua set omnifunc=lua_complete_omni

 let mapleader=";"
nmap <Leader>lb 0
nmap <Leader>le $
vnoremap <Leader>y "+y
nmap <Leader>p "+p
nmap <Leader>q :q<CR>
nmap <Leader>w :w<CR>
nmap <Leader>pa %

if version >= 603
    set helplang=cn
    set encoding=utf-8
endif

vmap <C-c> "+y<ESC>
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+p

set hlsearch
set incsearch
set ignorecase
set cindent shiftwidth=8
set backspace=indent,eol,start
set tags=./tags,tags

set foldmethod=syntax
set nofoldenable
set visualbell

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
""" Tagbar
""""""""""""""""""""""""""""""
nmap <F8> :TagbarToggle<CR>
let tagbar_left=1 
nnoremap <Leader>tl :TagbarToggle<CR> 
let tagbar_width=32 
let g:tagbar_compact=1
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

:map <F10> :set paste<CR>
:map <F11> :set nopaste<CR>
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set completeopt=preview,menu 
set showmatch
set matchtime=1
set smartindent

set clipboard=unnamed 

set ruler
set cursorline
set magic
set gcr=a:block-blinkon0

set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
set guioptions-=T
set guioptions-=m

set noeb
set confirm
set autoindent
set cindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set number
set history=1000

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CTags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let Tlist_Sort_Type = "name"
let Tlist_Use_Right_Window = 1
let Tlist_Compart_Format = 1 
let Tlist_Exist_OnlyWindow = 1
let Tlist_File_Fold_Auto_Close = 0
let Tlist_Enable_Fold_Column = 0

let Tlist_Show_menu = 1
let Tlist_Show_one_File = 1
let Tlist_Exit_OnlyWindow = 1
set tags=tags;
set autochdir

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" powerline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256
set encoding=utf-8

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
endfunction
call AirlineInit()

"let g:airline_mode_map = {
      "\ '__' : '-',
      "\ 'n'  : 'N',
      "\ 'i'  : 'I',
      "\ 'R'  : 'R',
      "\ 'c'  : 'C',
      "\ 'v'  : 'V',
      "\ 'V'  : 'V',
      "\ '' : 'V',
      "\ 's'  : 'S',
      "\ 'S'  : 'S',
      "\ '' : 'S',
      "\ }

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
    " unicode symbols
    let g:airline_left_sep = '»'
    let g:airline_right_sep = '«'
    let g:airline_symbols.linenr = '¶'
    "let g:airline_symbols.branch = '⎇'
    let g:airline_symbols.paste = 'ρ'
    let g:airline_symbols.whitespace = 'Ξ'

    let g:airline_symbols.branch = ''
    let g:airline_symbols.readonly = ''
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
let g:indent_guides_enable_on_vim_startup=0
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
nmap <silent> <Leader>i <Plug>IndentGuidesToggle


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""" nerdtree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <Leader>fl :NERDTreeToggle<CR>
let NERDTreeWinSize=32
let NERDTreeWinPos="right"
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeAutoDeleteBuffer=1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""    
"""""""" nerd commenter 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""    
nmap <Leader>cc         注释当前行
nmap <Leader>cn         nested注释
nmap <Leader>c<space>   切换选定
nmap <Leader>cu         取消注释
nmap <Leader>ca         切换方式

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""" doxygenToolKit
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
let g:DoxygenToolkit_briefTag_pre="@brief  "
let g:DoxygenToolkit_paramTag_pre="@Param "
let g:DoxygenToolkit_returnTag="@Returns   "
let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------"
let g:DoxygenToolkit_authorName="hallestar"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""" lua.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
let g:lua_compiler_name = 'luac'
let g:lua_complete_omni = 1
let g:lua_define_omnifunc = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""" lua
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
if exists('$TMUX')
    set term=screen-256color
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"neocomplete
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:neocomplete#enable_at_startup = 1
"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"neocomplete
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" for IdeaVim
set visualbell
