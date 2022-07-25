set nocompatible
filetype on
 
set rtp+=/home/lizhiqian/.vim/bundle/Vundle.vim
call vundle#begin()
 
 
" 这里根据自己需要的插件来设置，以下是我的配置 "
"
" YouCompleteMe:语句补全插件
set runtimepath+=~/.vim/bundle/YouCompleteMe
autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口"
let g:ycm_collect_identifiers_from_tags_files = 1           " 开启 YCM基于标签引擎
let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释与字符串中的内容也用于补全
let g:syntastic_ignore_files=[".*\.py$"]
let g:ycm_seed_identifiers_with_syntax = 1                  " 语法关键字补全
let g:ycm_complete_in_comments = 1
let g:ycm_confirm_extra_conf = 0                            " 关闭加载.ycm_extra_conf.py提示
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']  " 映射按键,没有这个会拦截掉tab, 导致其他插件的tab不能用.
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
let g:ycm_complete_in_comments = 1                          " 在注释输入中也能补全
let g:ycm_complete_in_strings = 1                           " 在字符串输入中也能补全
let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释和字符串中的文字也会被收入补全
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui = 0                           " 禁用语法检查
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"             " 回车即选中当前项
nnoremap <c-j> :YcmCompleter GoToDefinitionElseDeclaration<CR>     " 跳转到定义处
let g:ycm_min_num_of_chars_for_completion=2                 " 从第2个键入字符就开始罗列匹配项
"
 
 
 
" github 仓库中的插件 "
Plugin 'VundleVim/Vundle.vim'
 
 
Plugin 'vim-airline/vim-airline'
"vim-airline配置:优化vim界面"
"let g:airline#extensions#tabline#enabled = 1
" airline设置
" 显示颜色
set t_Co=256
set laststatus=2
" 使用powerline打过补丁的字体
let g:airline_powerline_fonts = 1
" 开启tabline
let g:airline#extensions#tabline#enabled = 1
" tabline中当前buffer两端的分隔字符
let g:airline#extensions#tabline#left_sep = ' '
" tabline中未激活buffer两端的分隔字符
let g:airline#extensions#tabline#left_alt_sep = ' '
" tabline中buffer显示编号
let g:airline#extensions#tabline#buffer_nr_show = 1
" 映射切换buffer的键位
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>
" 映射<leader>num到num buffer
map <leader>1 :b 1<CR>
map <leader>2 :b 2<CR>
map <leader>3 :b 3<CR>
map <leader>4 :b 4<CR>
map <leader>5 :b 5<CR>
map <leader>6 :b 6<CR>
map <leader>7 :b 7<CR>
map <leader>8 :b 8<CR>
map <leader>9 :b 9<CR>
 
 
 
" vim-scripts 中的插件 "
Plugin 'taglist.vim'
"ctags 配置:F3快捷键显示程序中的各种tags，包括变量和函数等。
map <F3> :TlistToggle<CR>
let Tlist_Use_Right_Window=1
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_WinWidt=25
 
Plugin 'The-NERD-tree'
"NERDTree 配置:F2快捷键显示当前目录树
map <F2> :NERDTreeToggle<CR>
let NERDTreeWinSize=25 
 
Plugin 'indentLine.vim'
Plugin 'delimitMate.vim'
 
" 非 github 仓库的插件"
" Plugin 'git://git.wincent.com/command-t.git'
" 本地仓库的插件 "
 
call vundle#end()
 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""新文件标题
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
func SetTitle() 
	"如果文件类型为.sh文件 
	if &filetype == 'sh' 
		call setline(1, "##########################################################################") 
		call append(line("."), "# File Name: ".expand("%")) 
		call append(line(".")+1, "# Author: lizhiqian") 
		call append(line(".")+2, "# mail: lzhiqian111@gmail.com") 
		call append(line(".")+3, "# Created Time: ".strftime("%c")) 
		call append(line(".")+4, "#########################################################################") 
		call append(line(".")+5, "#!/bin/zsh")
		call append(line(".")+6, "PATH=/home/edison/bin:/home/edison/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/work/tools/gcc-3.4.5-glibc-2.3.6/bin")
		call append(line(".")+7, "export PATH")
		call append(line(".")+8, "")
	else 
		call setline(1, "/*************************************************************************") 
		call append(line("."), "	> File Name: ".expand("%")) 
		call append(line(".")+1, "	> Author: amoscykl") 
		call append(line(".")+2, "	> Mail: amoscykl@163.com ") 
		call append(line(".")+3, "	> Created Time: ".strftime("%c")) 
		call append(line(".")+4, " ************************************************************************/") 
		call append(line(".")+5, "")
	endif
	if &filetype == 'cpp'
		call append(line(".")+6, "#include <iostream>")
		call append(line(".")+7, "#include <algorithm>")
		call append(line(".")+8, "#include <cstring>")
		call append(line(".")+9, "");
    		call append(line(".")+7, "using namespace std;")
		call append(line(".")+8, "")
	endif
	if &filetype == 'c'
		call append(line(".")+6, "#include<stdio.h>")
		call append(line(".")+7, "")
	endif
	"	if &filetype == 'java'
	"		call append(line(".")+6,"public class ".expand("%"))
	"		call append(line(".")+7,"")
	"	endif
	"新建文件后，自动定位到文件末尾
	autocmd BufNewFile * normal G
endfunc 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"键盘命令
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 
nmap <leader>w :w!<cr>
nmap <leader>f :find<cr>
 
" 映射全选+复制 ctrl+a
map <C-A> ggVGY
map! <C-A> <Esc>ggVGY
map <F12> gg=G
" 选中状态下 Ctrl+c 复制
vmap <C-c> "+y
 
 
 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""实用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置当文件被改动时自动载入
set autoread
" quickfix模式
autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>
"代码补全 
set completeopt=preview,menu 
"允许插件  
filetype plugin on
"共享剪贴板  
set clipboard=unnamed 
"从不备份  
set nobackup
"make 运行
:set makeprg=g++\ -Wall\ \ %
"自动保存
set autowrite
set ruler                   " 打开状态栏标尺
set cursorline              " 突出显示当前行
set magic                   " 设置魔术
set guioptions-=T           " 隐藏工具栏
set guioptions-=m           " 隐藏菜单栏
"set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\
" 设置在状态行显示的信息
set foldcolumn=0
set foldmethod=indent 
set foldlevel=3 
set foldenable              " 开始折叠
" 不要使用vi的键盘模式，而是vim自己的
set nocompatible
" 语法高亮
set syntax=on
" 去掉输入错误的提示声音
set noeb
" 在处理未保存或只读文件的时候，弹出确认
set confirm
" 自动缩进
set autoindent
set cindent
" Tab键的宽度
set tabstop=4
" 统一缩进为4
set softtabstop=4
set shiftwidth=4
" 不要用空格代替制表符
set noexpandtab
" 在行和段开始处使用制表符
set smarttab
" 显示行号
set number
" 历史记录数
set history=1000
"禁止生成临时文件
set nobackup
set noswapfile
"搜索忽略大小写
set ignorecase
"搜索逐字符高亮
set hlsearch
set incsearch
"行内替换
set gdefault
"编码设置
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
"语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn
" 我的状态行显示的内容（包括文件类型和解码）
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
" 总是显示状态行
set laststatus=2
" 命令行（在状态行下）的高度，默认为1，这里是2
set cmdheight=2
" 侦测文件类型
filetype on
" 载入文件类型插件
filetype plugin on
" 为特定文件类型载入相关缩进文件
filetype indent on
" 保存全局变量
set viminfo+=!
" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-
" 字符间插入的像素行数目
set linespace=0
" 增强模式中的命令行自动完成操作
set wildmenu
" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2
" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l
" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set mouse=a
set selection=exclusive
set selectmode=mouse,key
" 通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0
" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\
" 高亮显示匹配的括号
set showmatch
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=1
" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3
" 为C程序提供自动缩进
set smartindent
" 高亮显示普通txt文件（需要txt.vim脚本）
 au BufRead,BufNewFile *  setfiletype txt
"自动补全
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
":inoremap { {<CR>}<ESC>O
":inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
function! ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endfunction
filetype plugin indent on 
"打开文件类型检测, 加了这句才可以用智能补全
set completeopt=longest,menu

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500

" display numbers
set nu

"visual edit everywhere
set virtualedit=all

"show command
set showcmd
set cmdheight=2
set scrolloff=3

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

set nocompatible

" Search
set ignorecase    " Ignore case when searching
set smartcase     " When searching try to be smart about cases
set hlsearch      " Highlight search results
set incsearch     " Makes search act like search in modern browsers

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
set foldcolumn=1
set fdm=marker

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

colorscheme monokai
"colorscheme murphy
"colorscheme solarized
"let g:solarized_termcolors=256
"let g:solarized_contrast="high"    "default value is normal
set t_Co=256      "set vim terminal color
set background=dark
"set guifont=Mono\ 13
set guifont=monaco\ 14

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions+=m    "hide menu
    set guioptions-=T    "hide tool
    set guioptions-=L    "hide left scrollbar
    set guioptions-=r    "hide right scrollbar
    set guioptions-=b    "hide bottom scrollbar
    set guitablabel=%M\ %t
else
   "hi Comment term=italic ctermfg=Darkgray
"   colorscheme molokai
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Statusline setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline=%1*\ [%{Disp_Mode()}]\ %*\ %-5.58(%F%m%r%h%w%)\ %2*\ %-5.58(CWD:\ %{getcwd()}%)\ %*\ Format:\ [%{&fenc!=''?&fenc:&enc}]\ %3*\ FileType:\ %y\ %*\ %([L:\ %l,C:\ %c][%p%%]%)%<
hi User1 guibg=slateblue guifg=Gray ctermfg=Gray ctermbg=93
hi User2 guibg=#4876FF guifg=Gray ctermfg=Gray ctermbg=53
hi User3 guibg=Brown guifg=Gray ctermfg=Gray ctermbg=160
hi StatusLine guibg=#cccccc guifg=#222222
set laststatus=2  "2:always display

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => file coding and decoding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set utf8 as standard encoding and en_US as the standard language
set termencoding=utf-8
set encoding=utf8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,latin1     "decoding list
set fileencoding=utf-8


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4
" Use spaces instead of tabs
set expandtab
" Be smart when using tabs
set smarttab

"toggle paste mode with hitting F2 key
set pastetoggle=<F2>
"set paste    "open paste mode

set ai "Auto indent
set si "Smart indent

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Wrap and breakline setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Linebreak on 500 characters
set lbr                 "linebreak
set tw=500              "break at 500 words
set showbreak==>\          "show "=>" before the break line
set wrap "Wrap lines

"configure backspace
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Highlight the current line
set cursorline
"highlight CursorLine          guibg=#003853 ctermbg=24  gui=none cterm=none

set clipboard=unnamed    "yank unnamed register to the system register

" Return to last edit position when opening files (You want this!)
autocmd! BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

"auto load ~/.vimrc
autocmd! BufWritePost $MYVIMRC source $MYVIMRC

let mapleader = ','
let g:mapleader = ','

""""""""""""""""""""""""""""""""""""""
"save and quit
""""""""""""""""""""""""""""""""""""""
"quit without save
map <leader>q :q!<cr>
"save and quit
map <leader>w :wq!<cr>
"save force with :W
"command! W w !sudo tee % > /dev/null

""""""""""""""""""""""""""""""""""""""
"save and quit
""""""""""""""""""""""""""""""""""""""
map <leader>tn :tabnew<cr>
map <leader>tc :tabclose<cr>
map <C-tab> :tabn<cr>
map <C-S-tab> :tabp<cr>

" no highlight
map <leader>/ :nohl<cr>

" Merge selected text into one line
vmap <leader>m J

" change all the tab into space
nmap <leader>rt :retab!<cr>

" update when diff two files
nmap <leader>du :diffupdate<cr>

""""""""""""""""""""""""""""""""""""""
"copy and paste
""""""""""""""""""""""""""""""""""""""
"map <C-A> ggVG
"map! <C-A> <Esc>ggVG

" copy
"vmap <C-c> "+y
" cut
"vmap <C-x> "+x
" paste
nmap <leader>p "+gP

"back to file
nmap <leader>b :bf<CR>
nmap gt <C-w>gf
vnoremap gt <C-w>gf

" tab to indent and shift-tab to unindent
nmap <tab> >>
vmap <tab> >gv
nmap <S-tab> <<
vmap <S-tab> <gv
imap <S-tab> <ESC><<i

"visual block key i behaves like <shift-i>
vnoremap <expr> i mode()=~'\cv' ? 'i' : 'I'
vnoremap <expr> a mode()=~'\cv' ? 'a' : 'A'

""""""""""""""""""""""""""""""""""""""
"auto complete (),[],{}and so on
""""""""""""""""""""""""""""""""""""""
:inoremap ( ()<Left>
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {}<Left>
autocmd FileType c,cpp :inoremap { {<CR>}<ESC>O
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<Left>
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<Left>
"autocmd Filetype c,cpp,python,perl :inoremap ' ''<ESC>i
function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunction

""""""""""""""""""""""""""""""""""""""
"自动插入文件头
""""""""""""""""""""""""""""""""""""""
autocmd! BufNewFile * silent! 0r ~/.vim/skel/Template.%:e
autocmd! BufNewFile *.cpp,*.[ch],*.sh,*.java,*.v,*.sv,*.vhd,*.py exec ":call SetTitle()"
function! SetTitle()
    "如果文件类型为脚本文件
    if &filetype =~ 'sh\|perl\|python'
        if &filetype == 'sh'
            call setline(1,"#!/bin/bash")
        elseif &filetype == 'perl'
            call setline(1,"#!/usr/bin/perl -w")
        elseif &filetype == 'python'
            call setline(1,"#!/usr/bin/env python")
        endif
        call append(line("."), "")
    elseif &filetype =~ 'verilog\|systemverilog\|c\|cpp'
        call setline(1          , "\//------------------------------------------------------------------------")
        call append(line(".")   , "\// File Name   : ".expand("%"))
        call append(line(".")+1 , "\// Author      : victor dong (dxs_uestc@163.com)")
        call append(line(".")+2 , "\// Version     : V0.1 ")
        call append(line(".")+3 , "\//------------------------------------------------------------------------")
        call append(line(".")+4 , "\// Description :" )
        call append(line(".")+5 , "\//     " )
        call append(line(".")+6 , "\//------------------------------------------------------------------------")
        call append(line(".")+7 , "\// Revision History:" )
        call append(line(".")+8 , "\// *Version* | *Modifier* | *Modified Date* | *Description*")
        call append(line(".")+9 , "\//   V0.1    |   Victor   |   ".strftime("%Y-%m-%d")."    | Fisrt Created.")
        call append(line(".")+10, "\//------------------------------------------------------------------------")
        call append(line(".")+11, "" )
    endif
    if &filetype == 'cpp'
        call append(line(".")+12, "#include<iostream>")
        call append(line(".")+13, "using namespace std;")
        call append(line(".")+14, "")
    endif
    if &filetype == 'c'
        call append(line(".")+12, "#include<stdio.h>")
        call append(line(".")+13, "")
    endif
    if &filetype =~ 'verilog\|systemverilog'
        if expand("%:r") =~ 'tb$'
            call append(line(".")+12, "`timescale 1ns/1ps")
            call append(line(".")+13, "")
            call append(line(".")+14, "module ".expand("%:r")."();")
            call append(line(".")+15, "")
            call append(line(".")+16, "initial begin")
            call append(line(".")+17, "    $fsdbDumpfile(\"wave.fsdb\");")
            call append(line(".")+18, "    $fsdbDumpvars(0);")
            call append(line(".")+19, "\//    $fsdbDumpMDA(0);")
            call append(line(".")+20, "end")
            call append(line(".")+21, "")
            call append(line(".")+22, "endmodule")
        else
            call append(line(".")+12, "module ".expand("%:r")."(")
            call append(line(".")+13, "    input clk   ,")
            call append(line(".")+14, "    input rst_n ,")
            call append(line(".")+15, ");")
            call append(line(".")+16, "")
            call append(line(".")+17, "\//==============================================")
            call append(line(".")+18, "\// Definition of regs and wires")
            call append(line(".")+19, "\//==============================================")
            call append(line(".")+20, "")
            call append(line(".")+21, "\//**********************************************")
            call append(line(".")+22, "\// Function")
            call append(line(".")+23, "\//**********************************************")
            call append(line(".")+24, "")
            call append(line(".")+25, "endmodule")
        endif
    endif
    "新建文件后，自动定位到文件末尾
    exec "normal G"
endfunc

"""""""""""""""""""""""""""""""""""""""""
""实现上面函数中的，Last Modified功能
"""""""""""""""""""""""""""""""""""""""""
"autocmd! BufWrite,BufWritePre,FileWritePre  *.cpp,*.[ch],*.sh,*.java,*.v,*.sv,*.vhd,*.py  ks|call LastModified()|'s
"function! LastModified()
"	if line("$") > 20
"		let l = 20
"	else
"		let l = line("$")
"	endif
"	exec "1,".l."g/Last Modified: /s/Last Modified: .*/Last Modified:".
"			\strftime(" %Y-%m-%d %H:%M:%S") . "/e"
"endfunc

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return '[PASTE MODE]  '
    endif
    return ''
endfunction

"""""""""""""""""""""""""""""""""""""""""
" return vim mode
"""""""""""""""""""""""""""""""""""""""""
function! Disp_Mode()
    let mode=mode()
    if mode ==# 'v'
        return 'Visual'
    elseif mode ==# 'V'
        return 'V-Line'
    elseif mode ==# '␖'
        return 'V-Block'
    elseif mode ==# 's'
        return 'Select'
	elseif mode ==# 'S'
        return 'S-Line'
	elseif mode ==# '␓'
        return 'S-Block'
	elseif mode =~# '\vi'
        return 'Insert'
	elseif mode =~# '\v(R|Rv)'
        return 'Replace'
	else
        return 'Normal'
	endif
endfunction

"""""""""""""""""""""""""""""""""""""""""
" add comment and del comment
"""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile,BufRead * map <C-c> :call AddComment()<CR>
autocmd BufNewFile,BufRead * map <S-c> :call DelComment()<CR>
function! AddComment()
    if &filetype =~? 'python\|perl\|tcl\|sh\|zsh\|csh\|conf\|sdc\|make'
        exec 's/\v^(\s*)#*/#\1/'
    elseif &filetype =~? 'verilog\|c\|cpp\|h'
        exec 's/\v^(\s*)\/*/\/\/\1/'
    elseif &filetype ==? 'vhdl'
        exec 's/\v^(\s*)-*/--\1/'
    elseif &filetype ==? 'vim'
        exec 's/\v^(\s*)\"*/\"\1/'
    elseif &filetype == 'xml'
        exec 's/\v^(.*)$/<!--\1-->'
    endif
    exec "nohl"
endfunction

function! DelComment()
    if &filetype =~? 'python\|perl\|tcl\|sh\|zsh\|csh\|conf\|sdc\|make'
        exec 's/\v^(\s*)#*/\1/'
    elseif &filetype =~? 'verilog\|c\|cpp\|h'
        exec 's/\v^(\s*)\/*/\1/'
    elseif &filetype ==? 'vhdl'
        exec 's/\v^(\s*)-*/\1/'
    elseif &filetype ==? 'vim'
        exec 's/\v^(\s*)\"*/\1/'
    elseif &filetype == 'xml'
        exec 's/\v^%(\s*\<\!--)*(.*)%(-->\s*)*$/\1/'
    endif
    exec "nohl"
endfunction

"""""""""""""""""""""""""""""""""""""""""
" filetype
"""""""""""""""""""""""""""""""""""""""""
au BufNewFile,BufRead readme,README setf help

"""""""""""""""""""""""""""""""""""""""""
" plugin: supertab
"""""""""""""""""""""""""""""""""""""""""
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabMappingForward = '<s-space>'
let g:SuperTabMappingBackward = '<s-c-space>'

"""""""""""""""""""""""""""""""""""""""""
" plugin: NERDTree
"""""""""""""""""""""""""""""""""""""""""
"autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <F3> :NERDTreeToggle<CR>
let NERDTreeShowHidden=0
let NERDTreeWinSize=25
let NERDTreeIgnore=['\~$', '\.swap$', '.pyc$']

"""""""""""""""""""""""""""""""""""""""""
" plugin: UltiSnips
"""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
