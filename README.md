# Vim���������

��������������װ��¼��Ŀǰ�����Ҫ���python����ʹ��
����`gVim Portable` [(offical)](http://portableapps.com/apps/development/gvim_portable) ��������������
�����ļ�λ��`..\gVimPortable\Data\settings`Ŀ¼��

---


### trinity

	Trinity : the Trinity of taglist, NERDtree and SrcExpl: an IDE works like "Source Insight"
	http://www.vim.org/scripts/script.php?script_id=2347
	һվʽ�������ɲ��������taglist,tree,srcexpl����������к����б��ļ�Ŀ¼
	2014��1��13�� 14:21:32

������vimrc�ļ��е�������������Ӧ�Ĺ��ܴ���

	nmap <F8>   :TrinityToggleAll<CR>             " �л����������ʾ
	nmap <F9>   :TrinityToggleSourceExplorer<CR>  " �л�Դ����ʾ���
	nmap <F10>  :TrinityToggleTagList<CR>         " �л������б���
	nmap <F11>  :TrinityToggleNERDTree<CR>        " �л��ļ�Ŀ¼���


��������������£�����Ҫ�ٶ���������������趨��

	��
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



### NERD_commenter

	http://www.vim.org/scripts/script.php?script_id=1218
	����ע�Ͳ��
	2014��1��13�� 14:39:30

NERD Commenter�ĳ��ü��󶨣���C/C++�ļ�Ϊ����������ʹ�÷�������:h NERDCommenter����Normal����Visual ģʽ�£�

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




### bufexplorer

	bufexplorer.zip : Buffer Explorer / Browser
	http://www.vim.org/scripts/script.php?script_id=42
	�������鿴�����Կ������ѱ༭�����ļ�֮������л�
	2014��2��12�� 09:24:34

ԭ����`minibufexpl`�ڴ�`trinity`���л��ļ�ʱ����ִ��ڻ��ҵ�����, �ʸ���`bufexplorer`  
ʹ������:

* `\be` ��ǰ�����д򿪻������б�
* `\bs` ��ˮƽ�зִ����д򿪻�����
* `\bv` �ڴ�ֱ�зִ����д򿪻����� (��trinity������)



### Emmet

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

Codingʱ,ʹ��`<TAB>`��������ȫ�б�, �������ִ�еĲ���:

* `CTRL-Y`    Accept the currently selected match and stop completion.
* `<Space>`   Accept the currently selected match and insert a space.
* `CTRL-E`    Close the menu and not accept any match.

��Ҫ�����������ļ����趨'�ֵ�·��' ��'��ȫ�б��С'(��ѡ)

	filetype plugin on
	let g:pydiction_location = 'C:/vim/vimfiles/ftplugin/pydiction/complete-dict'
	let g:pydiction_menu_height = 20  "The default menu height is 15.



### pyflakes

	PyFlakes on-the-fly Python code checking
	http://www.vim.org/scripts/script.php?script_id=2441
	py�﷨���
	2014��1��13�� 15:36:25

ʹ������Ϊ `:cc`



### vim-indent-guides

	A Vim plugin for visually displaying indent levels in code
	http://www.vim.org/scripts/script.php?script_id=3361
	��������ʾ������
	2014��1��13�� 15:37:27

�л���������ʾ����: `\ig`

	let g:indent_guides_enable_on_vim_startup = 1  "����ʱ����������
	let g:indent_guides_start_level = 2            "�ӵڶ�����ʼ������ʾ
	let g:indent_guides_guide_size = 1             "������ʾ�߿��Ϊ1



### OTHERS TO BE ADD..
