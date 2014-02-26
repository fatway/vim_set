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
"autocmd GUIEnter * simalt ~x             " �������
set lines=40 columns=140                 " �趨���ڴ�С
autocmd! bufwritepost _vimrc source %    " �޸ĺ��Զ����������ļ�����������
set nocompatible                         " �����ϵ�VI�༭ģʽ
set guifont=Consolas:h10.5                    " �������壬��С
"set guioptions-=m                        " ����menu
set guioptions-=T                        " ����toolbar

colorscheme slate                        " ʹ����ɫ����


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" �ر��Զ�����
set nobackup
set nowb
set noswapfile


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"��������
"set langmenu=zh_CN.UTF-8  " ʹ�����Ĳ˵�
"set helplang=cn           " ʹ�����İ����ĵ�

" ����utf8����
set encoding=utf-8                                      " enc  ������룬��ȡ�ļ�����Զ�תΪ�ñ���
"set encoding=gbk
set fileencodings=utf-8,ucs-bom,gb2312,gbk,gb18030      " fencsϵͳ֧�ִ򿪵ı����ļ�
"set fileencoding=utf-8                                  " fenc �����ļ�ʱĬ�ϱ���
							" ����ұ༭��һ��utf-8�ļ����������gbk�ĸ�ʽ���棬����ô���أ�
							" ��������ģʽ���� :set fenc=gbk Ȼ�󱣴��ļ����ɣ�
							" ����֮��������:set fenc=utf-8�Ϳ��Լ����༭����utf-8�ļ���


"set termencoding=utf-8
let &termencoding=&encoding
set fileformats=unix,dos    " ֧���ļ�ϵͳ�����в�ͬ������


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype on
filetype plugin indent on   " ���������ʶ���ܣ�syntax��NERDCommenter����Ҫ�������


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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


set fdm=indent      "���ô����۵�foldmethod,ģʽΪindent��ģʽ��
                    "manual  �ֹ������۵�
                    "indent  �����������ʾ���߼�����۵�
                    "expr    �ñ��ʽ�������۵�
                    "syntax  ���﷨�����������۵�
                    "diff    ��û�и��ĵ��ı������۵�
                    "marker  �����еı�־�۵�


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ctrl + s �����ļ�
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" �л�buffer
nmap <F3> :bn<CR>
nmap <F4> :bp<CR>



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"======================================
" trinity.vim
" ����source explor, nerd_tree��taglist������trinity�����
" ���Ծ����������trinity.vimΪ׼
"======================================

"F7�л��������source_explor,nerd_tree��taglist
nmap <F7> :TrinityToggleAll<CR>

"F8�����л��ļ�Ŀ¼��nerd_tree�����
let g:NERDChristmasTree = 1             " ɫ����ʾ
let g:NERDTreeShowHidden = 1            " ��ʾ�����ļ�
let g:NERDTreeHighlightCursorline = 0   " ������ǰ��
nmap <F8> :TrinityToggleNERDTree<CR>    " ʼ�����ұ���ʾ

"F9�л������б�taglist
"let Tlist_Ctags_Cmd= $VIMRUNTIME .'\ctags'   " ����ctag·��
let Tlist_Exit_OnlyWindow=1             " ��taglist�����һ������ʱ�˳�vim
let Tlist_Show_One_File=0               " 1��Ϊ��ǰ�ļ���ʾtag��0��ʾ�����ļ�tag
let Tlist_File_Fold_Auto_Close=1        " ����ʾ��ǰ�ļ�tag�������۵�
let Tlist_Use_Right_Window=0            " ȱʡ0��Ϊ1ʱtaglist������ʾ���ұ�
let Tlist_Enable_Fold_Column=1          " ��ʾ�ļ���
let Tlist_Show_Menu=1                   " ��ʾtaglist�˵�
nmap <F9> :TrinityToggleTagList<CR>

"F10�л�Դ����ʾ�б�
"nmap <F10> :TrinityToggleSourceExplorer<CR>
"======== end trinity.vim ===========



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" F11 �л��˵��͹���������ʾ״̬
"set guioptions-=m    " ����menu
"set guioptions-=T    " ����toolbar
map <silent> <F11> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
    \endif<CR>



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" �����﷨�Զ���ȫ��ͨ��ctrl-x ctrl-o���������Ĳ˵�
set completeopt=longest,menu
set wildmenu                  " �Զ���ȫʱʹ�ò˵�ʽƥ���б�
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType python runtime! autoload/pythoncomplete.vim
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType java set omnifunc=javacomplete#Complet



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"PHP��������
let g:javascript_enable_domhtmlcss=1   " javascript�﷨�����ű�������


" php����
let php_sql_query=1       " �����ַ������SQL���
let php_htmlInStrings=1   " �����ַ������HTML
let php_noShortTags=1     " ����php�Ķ̱��
let php_folding=0         " ���ô����۵���������ͺ������Զ���

""" F5 ����php����
"nmap <F5> :!"C:/Dev/PHPnow-1.5.6/php-5.2.14-Win32/php.exe" %<CR>



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python ����

" F5 ����python����
nmap <F5> :!"E:\Python27\python.exe" %<CR>

"�Զ���ȫ  pydiction
let g:pydiction_location= $VIMRUNTIME . '\ftplugin\pydiction\complete_dict'
"let g:pydiction_menu_height = 20

"������pyflakes  ʹ������:cc
"let g:pyflakes_use_quickfix = 0   "disable quickfix support


"��������ʾ��ʹ��vim-indent-guides����������趨����Ĳ��������ÿ��Ϊ4�Ŀ鼶��ʾ
let g:indent_guides_enable_on_vim_startup = 1  "����ʱ����������
let g:indent_guides_start_level = 2            "�ӵڶ�����ʼ������ʾ
let g:indent_guides_guide_size = 1             "������ʾ�߿��Ϊ1



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


