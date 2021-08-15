"关闭兼容模式
set nocompatible

"gvim字体设置
"set guifont=新宋体:h13:cGB2312"

"gvim内部编码
set encoding=utf-8

"当前编辑的文件编码
set fileencoding=utf-8

"gvim打开支持编码的文件
set fileencodings=ucs-bom,utf-8,gbk,cp936,gb2312,big5,euc-jp,euc-kr,latin1
"set langmenu=zh_CN
"let $LANG = 'zh_CN.UTF-8'

"解决consle输出乱码
"language messages zh_CN.utf-8"

"设置终端编码为gvim内部编码encoding
let &termencoding=&encoding

"防止特殊符号无法正常显示
set ambiwidth=double

"缩进尺寸为4个空格
set sw=4

"tab宽度为4个字符
set ts=4

"编辑时将所有tab替换为空格
"set et

"按一次backspace就删除4个空格
set smarttab

"不生成备份文件
set noswapfile

"开启行号标记
set number

"配色方案
colo desert

"关闭上侧工具栏
set guioptions-=T

"关闭右侧滚动条
"set guioptions-=r

"开启自动缩进
set autoindent

set laststatus=2

"默认的自己的参数代码段，可以不写。自己喜欢就写上吧。
set diffexpr=MyDiff()
function MyDiff()
    let opt = '-a --binary'
    if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
    if &diffopt =~ 'iwhite' | let opt = opt . '-b' | endif
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
