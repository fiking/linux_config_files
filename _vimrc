"�رռ���ģʽ
set nocompatible

"gvim��������
"set guifont=������:h13:cGB2312"

"gvim�ڲ�����
set encoding=utf-8

"��ǰ�༭���ļ�����
set fileencoding=utf-8

"gvim��֧�ֱ�����ļ�
set fileencodings=ucs-bom,utf-8,gbk,cp936,gb2312,big5,euc-jp,euc-kr,latin1
"set langmenu=zh_CN
"let $LANG = 'zh_CN.UTF-8'

"���consle�������
"language messages zh_CN.utf-8"

"�����ն˱���Ϊgvim�ڲ�����encoding
let &termencoding=&encoding

"��ֹ��������޷�������ʾ
set ambiwidth=double

"�����ߴ�Ϊ4���ո�
set sw=4

"tab���Ϊ4���ַ�
set ts=4

"�༭ʱ������tab�滻Ϊ�ո�
"set et

"��һ��backspace��ɾ��4���ո�
set smarttab

"�����ɱ����ļ�
set noswapfile

"�����кű��
set number

"��ɫ����
colo desert

"�ر��ϲ๤����
set guioptions-=T

"�ر��Ҳ������
"set guioptions-=r

"�����Զ�����
set autoindent

set laststatus=2

"Ĭ�ϵ��Լ��Ĳ�������Σ����Բ�д���Լ�ϲ����д�ϰɡ�
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
