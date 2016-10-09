# Vim���������

��������������װ��¼��Ŀǰ�����Ҫ���python����ʹ��
20161009�°�װvim8.0������ms-setup��ʽ��װ����װ�󽫰�װĿ¼����Ϊ����ĿĿ¼��
����Ҫ����vim80�ļ���

---


## pathogen

��װ���������pathogen������ͳһ������
	
	$ git submodule add git@github.com:tpope/vim-pathogen.git vimfiles

���ù����ܣ���Ҫ��`_vimrc`�ļ��м����������

	execute pathogen#infect()
	syntax on
	filetype plugin indent on

���ڶ����������װ��ά��������
	
	# ��װ
	$ git submodule add �����Git�ֿ��ַ vimfiles/bundle/�������
	# ����
	$ git submodule foreach 'git checkout master && git pull'
	# ȷ����master��֧�µĻ�, ʹ��������и���
	$ git submodule foreach 'git stash && git pull && git stash clear'
	# ɾ�����
	$ rm -rf bundle/�����
	$ git rm -r bundle/�����


---

## �����װ��ʹ�ö��ձ�

### [taglist](https://github.com/vim-scripts/taglist.vim) | vimfiles/bundle/taglist

��Ҫ����Դ����Ĺ���Ctags(http://ctags.sourceforge.net/)��
��ѹ���󿽱�ctags.exe��app�µ�vim��װλ�ã����߷���system32
��ݼ�:

* `<CR>`         ���������tag�������λ�ã������˫����tag����Ҳһ��
* `o`             ��һ���´򿪵Ĵ�������ʾ�����tag
* `<Space>`       ��ʾ�����tag��ԭ�Ͷ���
* `u`             ����taglist�����е�tag
* `s`             ��������ʽ���ڰ���������Ͱ�����˳��������л�
* `x`             taglist���ڷŴ����С������鿴�ϳ���tag
* `+`             ��һ���۵���ͬzo
* `-`             ��tag�۵�������ͬzc
* `*`             �����е��۵���ͬzR
* `=`             ������tag�۵�������ͬzM
* `[[`            ����ǰһ���ļ�
* `]]`            ������һ���ļ�
* `q`             �ر�taglist����
* `<F1>`          ��ʾ����

### [SrcExpl](https://github.com/wesleyche/SrcExpl) | vimfiles/bundle/SrcExpl

�����ڶ�����ת�趨

### [nerdtree](https://github.com/scrooloose/nerdtree) | vimfiles/bundle/nerdtree

Ŀ¼�����, ��ݼ�:
	`o`	չ�����ĳ��Ŀ¼���ٰ�һ�¾��Ǻϲ�Ŀ¼ 
	`t`	���� Tab �д�ѡ���ļ�/��ǩ���������� Tab
	`T`	���� Tab �д�ѡ���ļ�/��ǩ������������ Tab
	`P`	���������
	`p`	���������
	`q`	�ر� NerdTree ����

### [nerdcommenter](https://github.com/scrooloose/nerdcommenter) | vimfiles/bundle/nerdcommenter

����ע�Ͳ��, NERD Commenter�ĳ��ü��󶨣���C/C++�ļ�Ϊ����������ʹ�÷�������:h NERDCommenter����Normal����Visual ģʽ�£�

* `\ca`���ڿ�ѡ��ע�ͷ�ʽ֮���л�������C/C++ �Ŀ�ע��/* */����ע��//
* `\cc`��ע�͵�ǰ�У�����ѡ����
* `\c `���л�ע��/��ע��״̬
* `\ci`, �л�ע�� individually
* `\cs`���ԡ��ԸС��ķ�ʽע��
* `\cA`���ڵ�ǰ��β���ע�ͷ���������Insertģʽ
* `\cu`��ȡ��ע��
* `\c$`, �ӵ�ǰ���ע�͵��н�β

Normalģʽ�£�������������ǰ�涼����ָ������
Visualģʽ��ִ��������ѡ�е��ض��������ע��/��ע��

ʹ�øò����Ҫ���� `filetype plugin on`

### [emmet-vim](https://github.com/mattn/emmet-vim) | vimfiles/bundle/emmet-vim

hmtlԴ����ٱ༭  
Ĭ��չ��_���ܼ�_Ϊ`<c-y>,` (��ctrl+yȻ�󰴶���)  
������˶���һ������: `<c-y>`: ���ܼ�, `,(����)`: ִ�м�  
����̳�: https://raw.github.com/mattn/emmet-vim/master/TUTORIAL

ʾ��:

1. �һ����׼��htmlģ��: `html:5` , Ȼ��ʹ�ù��ܼ��� �� ��`,`ִ�м�
2. ������չ: `div>p#foo$*3>a`
3. ���������ı�:

	test1  
	test2  
	test3

  ��visualģʽ��ѡ�и�����, ִ�й��ܼ�+����, ��������﷨��ʾ������: `ul>li*` (Ҳ����������:`blockquote`), �õ�:

	&lt;ul&gt;  
		&lt;li&gt;test1&lt;/li&gt;  
		&lt;li&gt;test2&lt;/li&gt;  
		&lt;li&gt;test3&lt;/li&gt;  
	&lt;/ul&gt;

4. �����Ĳ����о�, �ο��ٷ��ĵ�, �����ٸ�һ��ִ�м����ձ�

	+--------+--------------------------------------------------------------------+
	| ִ�м� | ִ��Ч��                                                           |
	+--------+--------------------------------------------------------------------+
	| ,(����)| չ����д,���ѡ���ڲ�ִ�ж���                                      |
	| d      | ����ƽ���ǩ                                                       |
	| D      | ����ƽ���ǩ                                                       |
	| n      | ��һ���༭��                                                       |
	| N      | ��һ���༭��                                                       |
	| i      | ��img����size(width/height)��ǩ                                    |
	| m      | merge�ϲ���(Visualģʽ��)                                          |
	| k      | ȥ����ǰ��ǩ(��������)                                             |
	| j      | ������չʾ������ǩ(<div class='foo'></div> = <div class='foo' />)  |
	| /      | ע��(��ע��)��ǰ����                                             |
	| a      | ����ַ(��Ҫhttpͷ)����Ϊa��ǩ                                      |
	| A      | ����ַ����Ϊ��վ��Ϣ���ÿ�                                         |
	+--------+--------------------------------------------------------------------+

����: �Զ��幦�ܼ�

	let g:user_emmet_settings = {
	\  'indentation' : '  ',
	\  'perl' : {
	\    'aliases' : {
	\      'req' : 'require '
	\    },
	\    'snippets' : {
	\      'use' : "use strict\nuse warnings\n\n",
	\      'warn' : "warn \"|\";",
	\    }
	\  }
	\}

	let g:user_emmet_expandabbr_key = '<c-e>'
	let g:use_emmet_complete_tag = 1

### [vim-ident-guides](https://github.com/nathanaelkane/vim-indent-guides) | vimfiles/bundle/vim-ident-guides

��������ʾ������, �л���������ʾ����: `\ig`

	let g:indent_guides_enable_on_vim_startup = 1  "����ʱ����������
	let g:indent_guides_start_level = 2            "�ӵڶ�����ʼ������ʾ
	let g:indent_guides_guide_size = 1             "������ʾ�߿��Ϊ1

### [tablify](https://github.com/Stormherz/tablify) | vimfiles/bundle/tablify

���ת�����  
��ѡ�����ı�(�ֶ�Ĭ����|�ָ�, ������ b:tablify_raw_delimiter ��vimrc��ָ��)ת��Ϊ�߿��Χ�ı��, �÷�(���ܼ�Ϊ��б�� \):

* `\tl or \tt` - ��ѡ���ı�ת��Ϊ���(Ĭ���ı������)
* `\tc` - ����ı����ж���
* `\tr` - ����ı��Ҷ���
* `\tu` - ������, ��ѡ���ı��ԭΪ�ı�
* `\ta` - ѡ�е�ǰ�������

���Ѿ�ת���ı��, ����ִ�����²���:

* `\tS` - ���������, ֧�����ֺ��ı�����
* `\tRL` - ����ı�����Ϊ�����
* `\tRR` - ����ı�����Ϊ�Ҷ���
* `\tRC` - ����ı�����Ϊ���ж���


��������ڵĵ�ǰλ�ù��:
* `\tK` - move current row (where the cursor is) up
* `\tJ` - move current row down
* `\tL` - move current column (where the cursor is) right
* `\tH` - move current column left

ʵ��, �������ı�ת��Ϊ���:

	Artist | Song | Album | Year  
	Pantera | Cemetery Gates | Cowboys from Hell | 1990  
	Ozzy Osbourne | Let Me Hear You Scream | Scream | 2010

�������:

	+---------------+------------------------+-------------------+------+  
	| Artist        | Song                   | Album             | Year |  
	+---------------+------------------------+-------------------+------+  
	| Pantera       | Cemetery Gates         | Cowboys from Hell | 1990 |  
	+---------------+------------------------+-------------------+------+  
	| Ozzy Osbourne | Let Me Hear You Scream | Scream            | 2010 |  
	+---------------+------------------------+-------------------+------+

��������Ч��:

1. ���ֱ�����, ���ı������еķָ�����Ϊ # , ת����ı�������ʹ�ò����߰�Χ
2. ���̫��Ӱ��չʾЧ��ʱ, ����ʹ�����ڻ���, ֻ���ڽϳ���cell��, �ʵ����� `\n` ����

���ò���: 

	g:loaded_tablify               - ����1ʱ�����ظÿؼ�
	b:tablify_headerDelimiter      - �����е��ı��ָ���, Ĭ��Ϊ #
	b:tablify_delimiter            - ����ֶεķָ���, Ĭ��Ϊ |

	b:tablify_vertDelimiter        - ����Χ��, ��ֱ�ָ��� (Ĭ��Ϊ |)
	b:tablify_horDelimiter         - ����Χ��, ˮƽ�ָ��� (Ĭ��Ϊ -)
	b:tablify_horHeaderDelimiter   - ����Χ��, ������ˮƽ�ָ��� (Ĭ��Ϊ ~)
	b:tablify_divideDelimiter      - ����Χ��, ������ (Ĭ��Ϊ +)

	b:tablify_cellLeftPadding      - ��������ʱ, ������׿��, Ĭ��Ϊ1
	b:tablify_cellRightPadding     - ����Ҷ���ʱ, �ұ����׿��, Ĭ��Ϊ1

### [python-mode](https://github.com/klen/python-mode) | vimfiles/bundle/python-mode

Python-mode is a vim plugin that helps you to create python code very quickly by utilizing libraries
including pylint, rope, pydoc, pyflakes, pep8, and mccabe for features like static analysis,
refactoring, folding, completion, documentation, and more.

The plugin contains all you need to develop python applications in Vim.

There is no need to install pylint, rope or any other Python libraries on your system.

* Support Python version 2.6+ and 3.2+
* Syntax highlighting
* Virtualenv support
* Run python code (<leader>r)
* Add/remove breakpoints (<leader>b)
* Improved Python indentation
* Python folding
* Python motions and operators (]], 3[[, ]]M, vaC, viM, daC, ciM, ...)
* Code checking (pylint, pyflakes, pylama, ...) that can be run simultaneously (:PymodeLint)
* Autofix PEP8 errors (:PymodeLintAuto)
* Search in python documentation (K)
* Code refactoring <rope refactoring library> (rope)
* Strong code completion (rope)
* Go to definition (<C-c>g for :RopeGotoDefinition)
* And more, more ...

### [vim-airline](https://github.com/bling/vim-airline) | vimfiles/bundle/vim-airline

״̬����Ĭ���ڶര��ʱ����ʾ, �����Ҫֻ��һ������ʱҲ��ʾ��״̬��, ��Ҫ��vimrc������ `set laststatus=2`

### [ctrlp](https://github.com/kien/ctrlp.vim) | vimfiles/bundle/ctrlp

����everything�Ŀ����ļ��������л����, ʹ��`<c-p>`��

### [tasklist](https://github.com/vim-scripts/TaskList.vim) | vimfiles/bundle/tasklist

������ʾ, �򿪷�ʽ `<leader>t`

��Ҫ���Զ��������б�

	let g:tlWindowPosition = 1  �ײ���ʾ
	let g:tlTokenList = ['TODO', 'UNDONE', 'HACK', 'WARN', 'NOTE']

����˵��

	TODO: ���������
	UNDONE: δ���
	HACK: ��������Ҫ�޸�
	NOTE: ��Ҫע�������
	WARN: ���棨�����������壬��Ҫ�ر�ע�⣩
	ERROR: ����Ĵ��룬��Ŀǰ���޽⡣��
	TEMP: ��ʱ�л����룬������ĳ����

### [vim-startify](https://github.com/mhinz/vim-startify) | vimfiles/bundle/vim-startify

�滻vim������������ʾ����, ��Ҫ�г�buffer�б��������ļ��б�

���ļ��б���, ��������ָ����ļ�

	b  ��ǰ���ڴ�
	s  split���ڴ�
	v  vsplit���ڴ�
	t  tab�д�
	<cr>  ִ������

�������ļ����������, ���Ҫ���ָ���������, ����`:Startify`ʵ��


### [vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors) | vimfiles/bundle/vim-multiple-cursors
### [vim-surround](https://github.com/tpope/vim-surround) | vimfiles/bundle/vim-surround
### [vim-markdown](https://github.com/plasticboy/vim-markdown) | vimfiles/bundle/vim-markdown

