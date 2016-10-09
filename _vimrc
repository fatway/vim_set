"""""""""""""""""""""""""""""""""" 窗体外观 """"""""""""""""""""""""""""""""""
"autocmd GUIEnter * simalt ~x             " 窗口最大化
set lines=40 columns=120                 " 设定窗口大小
autocmd! bufwritepost _vimrc source %    " 修改后自动加载配置文件，无需重启
set nocompatible                         " 禁用老的VI编辑模式
set guifont=Consolas:h10.5               " 设置字体，大小
set guioptions-=m                        " 隐藏menu
set guioptions-=T                        " 隐藏toolbar
set nobackup                             " 关闭自动备份
set nowb
set noswapfile

set laststatus=2                         " 始终显示状态栏
"let g:mapleader = ';'                    " leader键


" Ctrl + s 保存文件
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a

" 切换窗口
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" F11 切换菜单和工具栏的显示状态
"set guioptions-=m                      " 隐藏menu
"set guioptions-=T                      " 隐藏toolbar
map <silent> <F11> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
    \endif<CR>


"""""""""""""""""""""""""""""""""" 插件管理 """"""""""""""""""""""""""""""""""
" Pathogen load
filetype off

call pathogen#infect()
call pathogen#helptags()

syntax on
filetype plugin indent on



"""""""""""""""""""""""""""""""""" 编码设置 """"""""""""""""""""""""""""""""""
set langmenu=zh_CN.UTF-8                               " 使用中文菜单
set helplang=cn                                        " 使用中文帮助文档

" 设置utf8编码
set encoding=utf-8                                      " enc  缓冲编码，读取文件后会自动转为该编码
set fileencodings=utf-8,ucs-bom,gb2312,gbk,gb18030      " fencs系统支持打开的编码文件
let &termencoding=&encoding
set fileformats=unix,dos    " 支持文件系统（换行不同）类型


"""""""""""""""""""""""""""""""""" 代码风格 """"""""""""""""""""""""""""""""""
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
set nowrap          " 设置不自动折行
set cursorline      " 高亮当前行


set fdm=marker      "启用代码折叠foldmethod,模式为indent，模式表
                    "manual  手工定义折叠
                    "indent  更多的缩进表示更高级别的折叠
                    "expr    用表达式来定义折叠
                    "syntax  用语法高亮来定义折叠
                    "diff    对没有更改的文本进行折叠
                    "marker  对文中的标志折叠


"colorscheme solarized                   " 自定义配色方案
colorscheme monokai


"""""""""""""""""""""""""""""""""" 清除高亮及空格 """"""""""""""""""""""""""""""""""

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


"""""""""""""""""""""""""""""""""" 项目风格 """"""""""""""""""""""""""""""""""
"单独使用tree和tag插件
nmap <leader>w :NERDTreeToggle<CR>
nmap <leader>e :TlistToggle<CR>


"""""""""""""""""""""""""""""""""" tags管理 """"""""""""""""""""""""""""""""""
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


"""""""""""""""""""""""""""""""""" 语法补全 """"""""""""""""""""""""""""""""""
" 开启语法自动补全，通过ctrl-x ctrl-o来打开上下文菜单
set completeopt=longest,menu
set wildmenu                  " 自动补全时使用菜单式匹配列表
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType java set omnifunc=javacomplete#Complet


"""""""""""""""""""""""""""""""""" 缩进线 """"""""""""""""""""""""""""""""""
" vim-indent-guides
" 不设定下面的参数，将用宽度为4的块级提示
let g:indent_guides_enable_on_vim_startup = 1  "启动时开启缩进线
let g:indent_guides_start_level = 2            "从第二级开始进行提示
let g:indent_guides_guide_size = 1             "缩进提示线宽度为1


"""""""""""""""""""""""""""""""""" ctrlp """"""""""""""""""""""""""""""""""
" start: <ctrl-p>
let g:ctrlp_max_height = 10
set wildignore+=*.pyc,*.swp,*.zip,*.exe


"""""""""""""""""""""""""""""""""" python-mode """"""""""""""""""""""""""""""""""
" 十全大补丸
let g:pymode = 1
let g:pymode_warnings = 1
let g:pymode_paths = []
let g:pymode_folding = 1
let g:pymode_quickfix_minheight = 3
let g:pymode_quickfix_maxheight = 6

let g:pymode_doc = 0
let g:pymode_run = 0           "禁用运行代码
let g:pymode_breakpoint = 0    "禁用插入断点

let g:pymode_lint_checkers = ['pylint', 'pyflakes', 'mccabe']

let g:pymode_rope_lookup_project = 0   "解决代码提示出错
let g:pymode_rope_complete = 1
let g:pymode_rope_complete_on_dot = 1

let g:pymode_rope_goto_definition_cmd = 'vnew'
let g:pymode_syntax = 1
let g:pymode_syntax_builtin_objs = 0
let g:pymode_syntax_builtin_funcs = 0

"nmap <leader>g :RopeGotoDefinition<CR>


"""""""""""""""""""""""""""""""""" tasklist """"""""""""""""""""""""""""""""""
let g:tlWindowPosition = 1   "底部显示
let g:tlTokenList = ['TODO', 'UNDONE', 'HACK', 'NOTE', 'WARN', 'ERROR', 'TEMP']

"我的任务定义：
"  TODO: 待完成任务
"  UNDONE: 未完成
"  HACK: 有问题需要修改
"  NOTE: 友情提示，需要注意的事项
"  WARN: 警告（即代码有陷阱，需要特别注意）
"  ERROR: 错误的代码，且目前还无解。。
"  TEMP: 临时切换代码，如屏蔽某任务


"""""""""""""""""""""""""""""""""" Startify """"""""""""""""""""""""""""""""""
"替换启动界面
let g:startify_disable_at_vimenter = 0
let g:startify_custom_header=''
let g:startify_custom_footer='The time of life is short;
\ to spend that shortness basely,
\ it would be too long .
\  via [William Shakewspeare]'

