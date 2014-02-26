# Vim插件及配置

启动配置与插件安装记录，目前插件主要针对python开发使用
基于`gVim Portable` [(offical)](http://portableapps.com/apps/development/gvim_portable) 软件进行相关配置
所有文件位于`..\gVimPortable\Data\settings`目录下

---


### trinity

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

	－
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



### NERD_commenter

	http://www.vim.org/scripts/script.php?script_id=1218
	代码注释插件
	2014年1月13日 14:39:30

NERD Commenter的常用键绑定，以C/C++文件为例，详析的使用方法，请:h NERDCommenter。在Normal或者Visual 模式下：

* `\ca`，在可选的注释方式之间切换，比如C/C++ 的块注释/* */和行注释//
* `\cc`，注释当前行，或者选定块
* `\c `，切换注释/非注释状态
* `\ci`, 切换注释 individually
* `\cs`，以”性感”的方式注释
* `\cA`，在当前行尾添加注释符，并进入Insert模式
* `\cu`，取消注释
* `\c$`, 从当前光标注释到行结尾

Normal模式下，几乎所有命令前面都可以指定行数
Visual模式下执行命令，会对选中的特定区块进行注释/反注释

使用该插件需要设置 `filetype plugin on`




### bufexplorer

	bufexplorer.zip : Buffer Explorer / Browser
	http://www.vim.org/scripts/script.php?script_id=42
	缓冲区查看，可以快速在已编辑过的文件之间进行切换
	2014年2月12日 09:24:34

原来的`minibufexpl`在打开`trinity`再切换文件时会出现窗口混乱的问题, 故改用`bufexplorer`  
使用命令:

* `\be` 当前窗口中打开缓冲区列表
* `\bs` 在水平切分窗口中打开缓冲区
* `\bv` 在垂直切分窗口中打开缓冲区 (与trinity不兼容)



### Emmet

	vim plugins for HTML and CSS hi-speed coding.
	http://www.vim.org/scripts/script.php?script_id=2981
	hmtl源码快速编辑
	参考教程：http://docs.emmet.io/abbreviations/syntax/
	2014年1月13日 14:40:41

Tips:

默认展开_功能键_为`<c-y>,` (即ctrl+y然后按逗号)  
这里统一一个名称: `<c-y>`: 功能键, `,(逗号)`: 执行键  
插件教程: https://raw.github.com/mattn/emmet-vim/master/TUTORIAL

示例:

1. 搭建一个标准的html模板: `html:5` , 然后使用功能键后 再 按`,`执行键
2. 常规扩展: `div>p#foo$*3>a`
3. 处理已有文本:

	test1  
	test2  
	test3

  在visual模式下选中该三行, 执行功能键+逗号, 在下面的语法提示中输入: `ul>li*` (也可以用诸如:`blockquote`), 得到:

	&lt;ul&gt;  
		&lt;li&gt;test1&lt;/li&gt;  
		&lt;li&gt;test2&lt;/li&gt;  
		&lt;li&gt;test3&lt;/li&gt;  
	&lt;/ul&gt;

4. 其它的不再列举, 参看官方文档, 这里再给一个执行键对照表
<table border="1">
  <tr>
    <th>执行键</th><th>执行效果</th>
  </tr>
  <tr>
    <td>,(逗号)</td><td>展开缩写,或对选定内部执行定义</td>
  </tr>
  <tr>
    <td>d</td><td>向内平衡标签</td>
  </tr>
  <tr>
    <td>D</td><td>向外平衡标签</td>
  </tr>
  <tr>
    <td>n</td><td>下一个编辑点</td>
  </tr>
  <tr>
    <td>N</td><td>上一个编辑点</td>
  </tr>
  <tr>
    <td>i</td><td>给img增加size(width/height)标签</td>
  </tr>
  <tr>
    <td>m</td><td>merge合并行(Visual模式下)</td>
  </tr>
  <tr>
    <td>k</td><td>去除当前标签(及其内容)</td>
  </tr>
  <tr>
    <td>j</td><td>收缩或展示独立标签(&lt;div class='foo'&gt;&lt;/div&gt;  = &lt;div class='foo' /&gt;)</td>
  </tr>
  <tr>
    <td>/</td><td>注释(或反注释)当前代码</td>
  </tr>
  <tr>
    <td>a</td><td>将网址(需要http头)处理为a标签</td>
  </tr>
  <tr>
    <td>A</td><td>将网址处理为网站信息引用块</td>
  </tr>
</table>


其它: 自定义功能键

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




### Pydiction

	Tab-complete your Python code
	http://www.vim.org/scripts/script.php?script_id=850
	python代码补全插件
	2014年1月13日 14:41:29

Coding时,使用`<TAB>`来弹出补全列表, 弹出后可执行的操作:

* `CTRL-Y`    Accept the currently selected match and stop completion.
* `<Space>`   Accept the currently selected match and insert a space.
* `CTRL-E`    Close the menu and not accept any match.

需要在启动配置文件中设定'字典路径' 和'补全列表大小'(可选)

	filetype plugin on
	let g:pydiction_location = 'C:/vim/vimfiles/ftplugin/pydiction/complete-dict'
	let g:pydiction_menu_height = 20  "The default menu height is 15.



### pyflakes

	PyFlakes on-the-fly Python code checking
	http://www.vim.org/scripts/script.php?script_id=2441
	py语法检查
	2014年1月13日 15:36:25

使用命令为 `:cc`



### vim-indent-guides

	A Vim plugin for visually displaying indent levels in code
	http://www.vim.org/scripts/script.php?script_id=3361
	给代码显示缩进线
	2014年1月13日 15:37:27

切换缩进线显示命令: `\ig`

	let g:indent_guides_enable_on_vim_startup = 1  "启动时开启缩进线
	let g:indent_guides_start_level = 2            "从第二级开始进行提示
	let g:indent_guides_guide_size = 1             "缩进提示线宽度为1



### OTHERS TO BE ADD..
