# Vim����

��������������װ��¼��Ŀǰ�����Ҫ���python����ʹ��
����`gVim Portable` [http://portableapps.com/apps/development/gvim_portable] ���������������

---

### trinity.vim

	Trinity : the Trinity of taglist, NERDtree and SrcExpl: an IDE works like "Source Insight"
	http://www.vim.org/scripts/script.php?script_id=2347
	һվʽ�������ɲ��������taglist,tree,srcexpl����������к����б����ļ�Ŀ¼
	2014��1��13�� 14:21:32

������vimrc�ļ��е�������������Ӧ�Ĺ��ܴ���

	nmap <F8>   :TrinityToggleAll<CR>             " �л����������ʾ
	nmap <F9>   :TrinityToggleSourceExplorer<CR>  " �л�Դ����ʾ���
	nmap <F10>  :TrinityToggleTagList<CR>         " �л������б����
	nmap <F11>  :TrinityToggleNERDTree<CR>        " �л��ļ�Ŀ¼���


��������������£�����Ҫ�ٶ���������������趨��
--
 |-- taglist.vim
 |     http://www.vim.org/scripts/script.php?script_id=273
 |     ��Ҫ����Դ����Ĺ���Ctags(http://ctags.sourceforge.net/)��
 |     ��ѹ���󿽱�ctags.exe��app�µ�vim��װλ�ã����߷���system32
 |
 |-- SrcExpl
 |     http://www.vim.org/scripts/script.php?script_id=2179
 |     ���Դ�������ת�趨
 |
 |-- The NERD tree
 |     http://www.vim.org/scripts/script.php?script_id=1658
 |



### NERD_commenter.vim

	http://www.vim.org/scripts/script.php?script_id=1218
	����ע�Ͳ��
	2014��1��13�� 14:39:30

NERD Commenter�ĳ��ü��󶨣���C/C++�ļ�Ϊ����������ʹ�÷�������:h NERDCommenter����Normal����Visual ģʽ�£�

`\ca`���ڿ�ѡ��ע�ͷ�ʽ֮���л�������C/C++ �Ŀ�ע��/* */����ע��//
`\cc`��ע�͵�ǰ�У�����ѡ����
`\c `���л�ע��/��ע��״̬
`\ci`, �л�ע�� individually
`\cs`���ԡ��ԸС��ķ�ʽע��
`\cA`���ڵ�ǰ��β����ע�ͷ���������Insertģʽ
`\cu`��ȡ��ע��
`\c$`, �ӵ�ǰ���ע�͵��н�β
Normalģʽ�£�������������ǰ�涼����ָ������
Visualģʽ��ִ��������ѡ�е��ض��������ע��/��ע��

ʹ�øò����Ҫ���� `filetype plugin on`




### minibufexpl.vim

	Elegant buffer explorer - takes very little screen space
	http://www.vim.org/scripts/script.php?script_id=159
	�������鿴�����Կ������ѱ༭�����ļ�֮������л�
	2014��1��13�� 14:24:34

There are a growing number of optional features in this script that are enabled by letting variables in your .vimrc:

  `control + the vim direction keys [hjkl]` can be made to move you between windows.
  `control + arrow keys` can be made to do the same thing
  `control + tab` & `shift + control + tab` can be setup to switch through your open windows (like in MS Windows)
  `control + tab` & `shift + control + tab` can alternatively be setup to cycle forwards and backwards through your modifiable buffers in the current window

NOTE: Some versions of vim don't support all of the key mappings that this script uses so you may experience degraded functionality. For example on Solaris SHIFT-TAB appears to fire the regular TAB mappings (same for console and gvim.) Also CONTROL+ARROWS appears to work in gvim on Solaris, but not in my xterm. All of the key bindings appear to work in Windows.


If you want to enable extra functionality (documented in the source) you might want to add the following to your .vimrc:

	let g:miniBufExplMapWindowNavVim = 1
	let g:miniBufExplMapWindowNavArrows = 1
	let g:miniBufExplMapCTabSwitchBufs = 1
	let g:miniBufExplModSelTarget = 1



### Emmet.vim

	vim plugins for HTML and CSS hi-speed coding.
	http://www.vim.org/scripts/script.php?script_id=2981
	hmtlԴ����ٱ༭
	�ο��̳̣�http://docs.emmet.io/abbreviations/syntax/
	2014��1��13�� 14:40:41

Tips:

You can customize behavior of expanding with overriding config.
This configuration will be merged at loading plugin.

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

You can set language attribute in html using emmet_settings['lang'].




### Pydiction

	Tab-complete your Python code
	http://www.vim.org/scripts/script.php?script_id=850
	python���벹ȫ���
	2014��1��13�� 14:41:29


`CTRL-Y`       Accept the currently selected match and stop completion.
`<Space>`      Accept the currently selected match and insert a space.
`CTRL-E`       Close the menu and not accept any match.


	filetype plugin on
	let g:pydiction_location = 'C:/vim/vimfiles/ftplugin/pydiction/complete-dict'
	let g:pydiction_menu_height = 20  "The default menu height is 15.




### pyflakes.vim

	PyFlakes on-the-fly Python code checking
	http://www.vim.org/scripts/script.php?script_id=2441
	py�﷨���
	2014��1��13�� 15:36:25

ʹ������Ϊ `:cc`




### vim-indent-guides

	A Vim plugin for visually displaying indent levels in code
	http://www.vim.org/scripts/script.php?script_id=3361
	vim������
	2014��1��13�� 15:37:27

Indent Guides
�л���ʾ���� `\ig`

	let g:indent_guides_enable_on_vim_startup = 1  "����ʱ����������
	let g:indent_guides_start_level = 2            "�ӵڶ�����ʼ������ʾ
	let g:indent_guides_guide_size = 1             "������ʾ�߿���Ϊ1



### TO BE ADD..