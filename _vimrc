"""""""""""""""""" cat from vimrc_example """"""""""""""""""""""""""""""""""
"source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"autocmd GUIEnter * simalt ~x             " 窗口最大化
set lines=40 columns=140                 " 设定窗口大小
autocmd! bufwritepost _vimrc source %    " 修改后自动加载配置文件，无需重启
set nocompatible                         " 禁用老的VI编辑模式
set guifont=Consolas:h10.5                    " 设置字体，大小
"set guioptions-=m                        " 隐藏menu
set guioptions-=T                        " 隐藏toolbar

colorscheme slate                        " 使用配色方案


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 关闭自动备份
set nobackup
set nowb
set noswapfile


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"编码设置
"set langmenu=zh_CN.UTF-8  " 使用中文菜单
"set helplang=cn           " 使用中文帮助文档

" 设置utf8编码
set encoding=utf-8                                      " enc  缓冲编码，读取文件后会自动转为该编码
"set encoding=gbk
set fileencodings=utf-8,ucs-bom,gb2312,gbk,gb18030      " fencs系统支持打开的编码文件
"set fileencoding=utf-8                                  " fenc 保存文件时默认编码
							" 如果我编辑了一个utf-8文件，想把它以gbk的格式保存，该怎么办呢？
							" 在命令行模式输入 :set fenc=gbk 然后保存文件即可，
							" 保存之后再输入:set fenc=utf-8就可以继续编辑其他utf-8文件了


"set termencoding=utf-8
let &termencoding=&encoding
set fileformats=unix,dos    " 支持文件系统（换行不同）类型


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype on
filetype plugin indent on   " 开启插件和识别功能，syntax和NERDCommenter等需要此来配合


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nu              " 显示行号
set ruler           " 右下显示光标位置
syntax enable       " 开启语法方案
syntax on           " 显示语法高亮

set tabstop=4       " 设置缩进长度
set expandtab       " 用空格代替缩进
set smarttab        " 退格空可以删除tab
set softtabstop=4   " 设置缩进
set shiftwidth=4    " 设置平移距离
set backspace=2     " ???

set autoindent      " 开启自动缩进
set smartindent     " 智能对齐方式
set history=200     " 设置冒号命令和搜索命令的历史记录长度
set showcmd         " 回显输入的命令
set showmode        " 显示当前的模式
set bsdir=buffer    " 设定文件浏览目录为当前目录
set mouse=a         " 在所有模式下启用鼠标

set ic              " 搜索时忽略大小写
set hls is          " 高亮搜索结果


set fdm=indent      "启用代码折叠foldmethod,模式为indent，模式表
                    "manual  手工定义折叠
                    "indent  更多的缩进表示更高级别的折叠
                    "expr    用表达式来定义折叠
                    "syntax  用语法高亮来定义折叠
                    "diff    对没有更改的文本进行折叠
                    "marker  对文中的标志折叠


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ctrl + s 保存文件
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" F2(及保存时)处理行尾的空格以及多余空行,F2同时能清除高亮
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif
map <F2> :w<CR>:call CleanupBuffer(1)<CR>:noh<CR>

function! CleanupBuffer(keep)
  if (&bin > 0)
    return
  endif
  silent! %s/\s\+$//ge
  let lnum = line(".")
  let lastline = line("$")
  let n = lastline
  while (1)
    let line = getline(n)
    if (!empty(line))
      break
    endif
    let n = n - 1
  endwhile
  let start = n+1+a:keep
  if (start < lastline)
    execute n+1+a:keep . "," . lastline . "d"
  endif
  exec "normal " . lnum . "G"
endfunction



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 切换buffer
nmap <F3> :bn<CR>
nmap <F4> :bp<CR>



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"======================================
" trinity.vim
" 由于source explor, nerd_tree和taglist采用了trinity插件打开
" 所以具体的设置以trinity.vim为准
"======================================

"F7切换三个插件source_explor,nerd_tree和taglist
nmap <F7> :TrinityToggleAll<CR>

"F8单独切换文件目录（nerd_tree插件）
let g:NERDChristmasTree = 1             " 色彩显示
let g:NERDTreeShowHidden = 1            " 显示隐藏文件
let g:NERDTreeHighlightCursorline = 0   " 高亮当前行
nmap <F8> :TrinityToggleNERDTree<CR>    " 始终在右边显示

"F9切换函数列表taglist
"let Tlist_Ctags_Cmd= $VIMRUNTIME .'\ctags'   " 设置ctag路径
let Tlist_Exit_OnlyWindow=1             " 当taglist是最后一个窗口时退出vim
let Tlist_Show_One_File=0               " 1仅为当前文件显示tag，0显示所有文件tag
let Tlist_File_Fold_Auto_Close=1        " 仅显示当前文件tag，其它折叠
let Tlist_Use_Right_Window=0            " 缺省0，为1时taglist窗口显示在右边
let Tlist_Enable_Fold_Column=1          " 显示文件树
let Tlist_Show_Menu=1                   " 显示taglist菜单
nmap <F9> :TrinityToggleTagList<CR>

"F10切换源码提示列表
"nmap <F10> :TrinityToggleSourceExplorer<CR>
"======== end trinity.vim ===========



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" F11 切换菜单和工具栏的显示状态
"set guioptions-=m    " 隐藏menu
"set guioptions-=T    " 隐藏toolbar
map <silent> <F11> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
    \endif<CR>



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" F12生成/更新tags文件
set tags=tags
set autochdir
function! UpdateTagsFile()
  silent !ctags -R --fields=+ianS --extra=+q
endfunction
nmap <F12> :call UpdateTagsFile()<CR>

" Ctrl + F12删除tags文件
function! DeleteTagsFile()
  silent !del /F /Q tags
endfunction
nmap <C-F12> :call DeleteTagsFile()<CR>



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 开启语法自动补全，通过ctrl-x ctrl-o来打开上下文菜单
set completeopt=longest,menu
set wildmenu                  " 自动补全时使用菜单式匹配列表
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType python runtime! autoload/pythoncomplete.vim
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType java set omnifunc=javacomplete#Complet



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"PHP开发设置
let g:javascript_enable_domhtmlcss=1   " javascript语法高亮脚本的设置


" php设置
let php_sql_query=1       " 高亮字符串里的SQL语句
let php_htmlInStrings=1   " 高亮字符串里的HTML
let php_noShortTags=1     " 禁用php的短标记
let php_folding=0         " 启用代码折叠（用于类和函数、自动）

""" F5 进行php调试
"nmap <F5> :!"C:/Dev/PHPnow-1.5.6/php-5.2.14-Win32/php.exe" %<CR>



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python 设置

" F5 进行python调试
nmap <F5> :!"E:\Python27\python.exe" %<CR>

"自动补全  pydiction
let g:pydiction_location= $VIMRUNTIME . '\ftplugin\pydiction\complete_dict'
"let g:pydiction_menu_height = 20

"代码检查pyflakes  使用命令:cc
"let g:pyflakes_use_quickfix = 0   "disable quickfix support


"缩进线提示（使用vim-indent-guides插件），不设定下面的参数，将用宽度为4的块级提示
let g:indent_guides_enable_on_vim_startup = 1  "启动时开启缩进线
let g:indent_guides_start_level = 2            "从第二级开始进行提示
let g:indent_guides_guide_size = 1             "缩进提示线宽度为1



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


