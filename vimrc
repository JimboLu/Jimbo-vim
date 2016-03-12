" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

set nocompatible " 关闭 vi 兼容模式
syntax on " 自动语法高亮
"colorscheme molokai " 设定配色方案
set number " 显示行号
" set cursorline " 突出显示当前行
set ruler " 打开状态栏标尺
set shiftwidth=4 " 设定 << 和 >> 命令移动时的宽度为 4
set softtabstop=4 " 使得按退格键时可以一次删掉 4 个空格
set tabstop=4 " 设定 tab 长度为 4
set nobackup " 覆盖文件时不备份
set autochdir " 自动切换当前目录为当前文件所在的目录
filetype plugin indent on " 开启插件
set backupcopy=yes " 设置备份时的行为为覆盖
set ignorecase smartcase " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
set nowrapscan " 禁止在搜索到文件两端时重新搜索
set incsearch " 输入搜索内容时就显示搜索结果
set hlsearch " 搜索时高亮显示被找到的文本
set noerrorbells " 关闭错误信息响铃
set novisualbell " 关闭使用可视响铃代替呼叫
set t_vb= " 置空错误铃声的终端代码
" set showmatch " 插入括号时，短暂地跳转到匹配的对应括号
" set matchtime=2 " 短暂跳转到匹配括号的时间
set magic " 设置魔术
set hidden " 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
set guioptions-=T " 隐藏工具栏
set guioptions-=m " 隐藏菜单栏
set smartindent " 开启新行时使用智能自动缩进
set backspace=indent,eol,start
" 不设定在插入状态无法用退格键和 Delete 键删除回车符
set cmdheight=1 " 设定命令行的行数为 1
set laststatus=2 " 显示状态栏 (默认值为 1, 无法显示状态栏)
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\  " 设置在状态行显示的信息
set foldenable " 开始折叠
set foldmethod=syntax " 设置语法折叠
set foldcolumn=0 " 设置折叠区域的宽度
setlocal foldlevel=1 " 设置折叠层数为
" UTF-8 编码
set encoding=utf-8
set termencoding=utf-8
set formatoptions+=mM
set fencs=utf-8,gbk
" 括号自动补全
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
" inoremap { {}<ESC>i
inoremap { {<ESC>o<ESC>o}<ESC>ki<TAB>

"******************************************************************************
" "                          << 自动添加头文件注释 >>
"******************************************************************************

autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec,*.cs ":call SetTitle()"

func SetTitle()
	if &filetype == 'cs'
		call setline(1,"/*******************************************************************************") 
		call append(line("."), " File Name: ".expand("%"))
		call append(line(".")+1, " Descript:")
		call append(line(".")+2, " ")
		call append(line(".")+3, " Version: 1.0")
		call append(line(".")+4, " Created Time: ".strftime("%c"))
		call append(line(".")+5, " Compiler: ")
		call append(line(".")+6, " Editor: vim")
		call append(line(".")+7, " Author: Jimbo")
		call append(line(".")+8, " mail: jimboo.lu@gmail.com")
		call append(line(".")+9, " ")
		call append(line(".")+10, " Company: ")
		call append(line(".")+11, "*******************************************************************************/")
		call append(line(".")+12, "")
		call append(line(".")+13, "using System;")
	endif
	if &filetype == 'cpp'
		call setline(1,"/*******************************************************************************")
		call append(line("."), " File Name: ".expand("%")) 
		call append(line(".")+1, " Descript:") 
		call append(line(".")+2, " ") 
		call append(line(".")+3, " Version: 1.0") 
		call append(line(".")+4, " Created Time: ".strftime("%D %T")) 
		call append(line(".")+5, " Compiler: ")
		call append(line(".")+6, " Editor: vim")
		call append(line(".")+7, " Author: Jimbo") 
		call append(line(".")+8, " mail: jimboo.lu@gmail.com") 
		call append(line(".")+9, " ") 
		call append(line(".")+10, " Company: ") 
		call append(line(".")+11, "*******************************************************************************/")
		call append(line(".")+12, "") 
		call append(line(".")+13, "#ifndef ".expand("%")) 
		call append(line(".")+14, "#define ".expand("%"))
		call append(line(".")+15, "#include <".expand("%").">")
		call append(line(".")+16, "#endif")
	endif
	if &filetype == 'h'
		call setline(1,"/*******************************************************************************")
		call append(line("."), " File Name: ".expand("%"))
		call append(line(".")+1, " Descript:")
		call append(line(".")+2, " ")
		call append(line(".")+3, " Version: 1.0")
		call append(line(".")+4, " Created Time: ".strftime("%c")))
		call append(line(".")+5, " Compiler: ")
		call append(line(".")+6, " Editor: vim")
		call append(line(".")+7, " Author: Jimbo")
		call append(line(".")+8, " mail: jimboo.lu@gmail.com")
		call append(line(".")+9, " ")
		call append(line(".")+10, " Company: ")
		call append(line(".")+11, "*******************************************************************************/")
		call append(line(".")+12, "")
		call append(line(".")+13, "#ifndef ".expand("%"))
		call append(line(".")+14, "#define ".expand("%"))
		call append(line(".")+15, "#include <".expand("%").">")
		call append(line(".")+16, "#endif")
	endif
	"新建文件后，自动定位到文件末尾
	autocmd BufNewFile * normal G
endfunc

"*****************************************************************************
"                          <<  编写文件时的配置 >>
"*****************************************************************************

" 在不使用 MiniBufExplorer 插件时也可用<C-k,j,h,l>切换到上下左右的窗口中去

" 当文件在外部被修改，自动更新该文件
set autoread

" 常规模式下输入 cS 清除行尾空格
nmap cS :%s/\s\+$//g<cr>:noh<cr>

" 常规模式下输入 cM 清除行尾 ^M 符号
nmap cM :%s/\r$//g<cr>:noh<cr>

" Ctrl + K 插入模式下光标向上移动
imap <c-k> <Up>

" Ctrl + J 插入模式下光标向下移动
imap <c-j> <Down>

" Ctrl + H 插入模式下光标向左移动
imap <c-h> <Left>

" Ctrl + L 插入模式下光标向右移动
imap <c-l> <Right>

" 每行超过80个的字符用下划线标示
au BufWinEnter * let w:m2=matchadd('Underlined', '\%>' . 80 . 'v.\+', -1)
