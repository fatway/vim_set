"""""""""""""""""""""""""""""""""" ������� """"""""""""""""""""""""""""""""""
"autocmd GUIEnter * simalt ~x             " �������
set lines=40 columns=120                 " �趨���ڴ�С
autocmd! bufwritepost _vimrc source %    " �޸ĺ��Զ����������ļ�����������
set nocompatible                         " �����ϵ�VI�༭ģʽ
set guifont=Consolas:h10.5               " �������壬��С
set guioptions-=m                        " ����menu
set guioptions-=T                        " ����toolbar
set nobackup                             " �ر��Զ�����
set nowb
set noswapfile

set laststatus=2                         " ʼ����ʾ״̬��
"let g:mapleader = ';'                    " leader��


" Ctrl + s �����ļ�
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a

" �л�����
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" F11 �л��˵��͹���������ʾ״̬
"set guioptions-=m                      " ����menu
"set guioptions-=T                      " ����toolbar
map <silent> <F11> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
    \endif<CR>


"""""""""""""""""""""""""""""""""" ������� """"""""""""""""""""""""""""""""""
" Pathogen load
filetype off

call pathogen#infect()
call pathogen#helptags()

syntax on
filetype plugin indent on



"""""""""""""""""""""""""""""""""" �������� """"""""""""""""""""""""""""""""""
set langmenu=zh_CN.UTF-8                               " ʹ�����Ĳ˵�
set helplang=cn                                        " ʹ�����İ����ĵ�

" ����utf8����
set encoding=utf-8                                      " enc  ������룬��ȡ�ļ�����Զ�תΪ�ñ���
set fileencodings=utf-8,ucs-bom,gb2312,gbk,gb18030      " fencsϵͳ֧�ִ򿪵ı����ļ�
let &termencoding=&encoding
set fileformats=unix,dos    " ֧���ļ�ϵͳ�����в�ͬ������


"""""""""""""""""""""""""""""""""" ������ """"""""""""""""""""""""""""""""""
set nu              " ��ʾ�к�
set ruler           " ������ʾ���λ��
syntax enable       " �����﷨����
syntax on           " ��ʾ�﷨����

set tabstop=4       " ������������
set expandtab       " �ÿո��������
set smarttab        " �˸�տ���ɾ��tab
set softtabstop=4   " ��������
set shiftwidth=4    " ����ƽ�ƾ���
set backspace=2     " ???

set autoindent      " �����Զ�����
set smartindent     " ���ܶ��뷽ʽ
set history=200     " ����ð������������������ʷ��¼����
set showcmd         " �������������
set showmode        " ��ʾ��ǰ��ģʽ
set bsdir=buffer    " �趨�ļ����Ŀ¼Ϊ��ǰĿ¼
set mouse=a         " ������ģʽ���������

set ic              " ����ʱ���Դ�Сд
set hls is          " �����������
set nowrap          " ���ò��Զ�����
set cursorline      " ������ǰ��


set fdm=marker      "���ô����۵�foldmethod,ģʽΪindent��ģʽ��
                    "manual  �ֹ������۵�
                    "indent  �����������ʾ���߼�����۵�
                    "expr    �ñ��ʽ�������۵�
                    "syntax  ���﷨�����������۵�
                    "diff    ��û�и��ĵ��ı������۵�
                    "marker  �����еı�־�۵�


"colorscheme solarized                   " �Զ�����ɫ����
colorscheme monokai


"""""""""""""""""""""""""""""""""" ����������ո� """"""""""""""""""""""""""""""""""

" F2(������ʱ)������β�Ŀո��Լ��������,F2ͬʱ���������
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


"""""""""""""""""""""""""""""""""" ��Ŀ��� """"""""""""""""""""""""""""""""""
"����ʹ��tree��tag���
nmap <leader>w :NERDTreeToggle<CR>
nmap <leader>e :TlistToggle<CR>


"""""""""""""""""""""""""""""""""" tags���� """"""""""""""""""""""""""""""""""
" F12����/����tags�ļ�
set tags=tags
set autochdir
function! UpdateTagsFile()
  silent !ctags -R --fields=+ianS --extra=+q
endfunction
nmap <F12> :call UpdateTagsFile()<CR>

" Ctrl + F12ɾ��tags�ļ�
function! DeleteTagsFile()
  silent !del /F /Q tags
endfunction
nmap <C-F12> :call DeleteTagsFile()<CR>


"""""""""""""""""""""""""""""""""" �﷨��ȫ """"""""""""""""""""""""""""""""""
" �����﷨�Զ���ȫ��ͨ��ctrl-x ctrl-o���������Ĳ˵�
set completeopt=longest,menu
set wildmenu                  " �Զ���ȫʱʹ�ò˵�ʽƥ���б�
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType java set omnifunc=javacomplete#Complet


"""""""""""""""""""""""""""""""""" ������ """"""""""""""""""""""""""""""""""
" vim-indent-guides
" ���趨����Ĳ��������ÿ��Ϊ4�Ŀ鼶��ʾ
let g:indent_guides_enable_on_vim_startup = 1  "����ʱ����������
let g:indent_guides_start_level = 2            "�ӵڶ�����ʼ������ʾ
let g:indent_guides_guide_size = 1             "������ʾ�߿��Ϊ1


"""""""""""""""""""""""""""""""""" ctrlp """"""""""""""""""""""""""""""""""
" start: <ctrl-p>
let g:ctrlp_max_height = 10
set wildignore+=*.pyc,*.swp,*.zip,*.exe


"""""""""""""""""""""""""""""""""" python-mode """"""""""""""""""""""""""""""""""
" ʮȫ����
let g:pymode = 1
let g:pymode_warnings = 1
let g:pymode_paths = []
let g:pymode_folding = 1
let g:pymode_quickfix_minheight = 3
let g:pymode_quickfix_maxheight = 6

let g:pymode_doc = 0
let g:pymode_run = 0           "�������д���
let g:pymode_breakpoint = 0    "���ò���ϵ�

let g:pymode_lint_checkers = ['pylint', 'pyflakes', 'mccabe']

let g:pymode_rope_lookup_project = 0   "���������ʾ����
let g:pymode_rope_complete = 1
let g:pymode_rope_complete_on_dot = 1

let g:pymode_rope_goto_definition_cmd = 'vnew'
let g:pymode_syntax = 1
let g:pymode_syntax_builtin_objs = 0
let g:pymode_syntax_builtin_funcs = 0

"nmap <leader>g :RopeGotoDefinition<CR>


"""""""""""""""""""""""""""""""""" tasklist """"""""""""""""""""""""""""""""""
let g:tlWindowPosition = 1   "�ײ���ʾ
let g:tlTokenList = ['TODO', 'UNDONE', 'HACK', 'NOTE', 'WARN', 'ERROR', 'TEMP']

"�ҵ������壺
"  TODO: ���������
"  UNDONE: δ���
"  HACK: ��������Ҫ�޸�
"  NOTE: ������ʾ����Ҫע�������
"  WARN: ���棨�����������壬��Ҫ�ر�ע�⣩
"  ERROR: ����Ĵ��룬��Ŀǰ���޽⡣��
"  TEMP: ��ʱ�л����룬������ĳ����


"""""""""""""""""""""""""""""""""" Startify """"""""""""""""""""""""""""""""""
"�滻��������
let g:startify_disable_at_vimenter = 0
let g:startify_custom_header=''
let g:startify_custom_footer='The time of life is short;
\ to spend that shortness basely,
\ it would be too long .
\  via [William Shakewspeare]'

