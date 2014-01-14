# Vim配置

启动配置与插件安装记录，目前插件主要针对python开发使用  
基于`gVim Portable` [http://portableapps.com/apps/development/gvim_portable] 软件进行相关配置

---

### trinity.vim

	Trinity : the Trinity of taglist, NERDtree and SrcExpl: an IDE works like "Source Insight"
	http://www.vim.org/scripts/script.php?script_id=2347
	一站式开发集成插件，调用taglist,tree,srcexpl三个插件进行函数列表、文件目录
	2014年1月13日 14:21:32

根据在vimrc文件中的设置来开关相应的功能窗口

	nmap <F8>   :TrinityToggleAll<CR>             " 切换三个插件显示
	nmap <F9>   :TrinityToggleSourceExplorer<CR>  " 切换源码提示插件
	nmap <F10>  :TrinityToggleTagList<CR>         " 切换函数列表插件
	nmap <F11>  :TrinityToggleNERDTree<CR>        " 切换文件目录插件


三个独立插件如下（不需要再独立进行相关配置设定）

	－－
	 |-- taglist.vim
	 |     http://www.vim.org/scripts/script.php?script_id=273
	 |     需要分析源代码的工具Ctags(http://ctags.sourceforge.net/)，
	 |     解压缩后拷贝ctags.exe到app下的vim安装位置，或者放于system32
	 |
	 |-- SrcExpl
	 |     http://www.vim.org/scripts/script.php?script_id=2179
	 |     可以处定义跳转设定
	 |
	 |-- The NERD tree
	 |     http://www.vim.org/scripts/script.php?script_id=1658
	 |



### NERD_commenter.vim

	http://www.vim.org/scripts/script.php?script_id=1218
	代码注释插件
	2014年1月13日 14:39:30

NERD Commenter的常用键绑定，以C/C++文件为例，详析的使用方法，请:h NERDCommenter。在Normal或者Visual 模式下：

`\ca`，在可选的注释方式之间切换，比如C/C++ 的块注释/* */和行注释//  
`\cc`，注释当前行，或者选定块  
`\c `，切换注释/非注释状态  
`\ci`, 切换注释 individually  
`\cs`，以”性感”的方式注释  
`\cA`，在当前行尾添加注释符，并进入Insert模式  
`\cu`，取消注释  
`\c$`, 从当前光标注释到行结尾  
Normal模式下，几乎所有命令前面都可以指定行数  
Visual模式下执行命令，会对选中的特定区块进行注释/反注释  

使用该插件需要设置 `filetype plugin on`




### minibufexpl.vim

	Elegant buffer explorer - takes very little screen space
	http://www.vim.org/scripts/script.php?script_id=159
	缓冲区查看，可以快速在已编辑过的文件之间进行切换
	2014年1月13日 14:24:34

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
	hmtl源码快速编辑
	参考教程：http://docs.emmet.io/abbreviations/syntax/
	2014年1月13日 14:40:41

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
	python代码补全插件
	2014年1月13日 14:41:29


`CTRL-Y`    Accept the currently selected match and stop completion.  
`<Space>`   Accept the currently selected match and insert a space.  
`CTRL-E`    Close the menu and not accept any match.  


	filetype plugin on
	let g:pydiction_location = 'C:/vim/vimfiles/ftplugin/pydiction/complete-dict'
	let g:pydiction_menu_height = 20  "The default menu height is 15.




### pyflakes.vim

	PyFlakes on-the-fly Python code checking
	http://www.vim.org/scripts/script.php?script_id=2441
	py语法检查
	2014年1月13日 15:36:25

使用命令为 `:cc`




### vim-indent-guides

	A Vim plugin for visually displaying indent levels in code
	http://www.vim.org/scripts/script.php?script_id=3361
	vim缩进线
	2014年1月13日 15:37:27

Indent Guides
切换显示命令 `\ig`

	let g:indent_guides_enable_on_vim_startup = 1  "启动时开启缩进线
	let g:indent_guides_start_level = 2            "从第二级开始进行提示
	let g:indent_guides_guide_size = 1             "缩进提示线宽度为1



### TO BE ADD..
