简单地记一记 vim 的一些操作：

# vim 的多文件编辑

1. 编辑好一个文件后，:w 保存退出，然后使用 vifm 或者 mc 进行路径切换，最后再用 vim 打开需要编辑的文件；
2. 编辑后一个文件后，:w 保存但不推出， 使用 :e + $PATH 来打开新的文件进行编辑；
3. 或者直接使用 :tabedit + $FILE 进行多标签页编辑；
4. 或者使用 :vs 等分屏进行编辑，然后使用 crtl+w+w 进行窗口间切换。

# vim 的常用命令

- :Sex vim的文件管理器
- :Vexplore 纵向的文件管理器

# netrw 快捷键

- d 新建一个目录
- D 删除文件或者目录
- R 重命名文件
- s 排序
- gh 隐藏 dot 开头的文件
- - 返回上级目录
- % 新建文件

# :s

```
" 把当前行第一个匹配的 str1 替换成 str2
:s/str1/str2/
" 把当前行所有的 str1 替换成 str2
:s/str1/str2/g
" 把第 x1 行至 x2 行中，每一行第一个匹配的 str1 替换成 str2
:x1,x2 s/str1/str2/
" 把第 x1 行至 x2 行中所有的 str1 替换成 str2
:x1,x2 s/str1/str2/g
" 把所有行第一个匹配的 str1 替换成 str2
:%s/str1/str2/
" 把全文件所有的 str1 替换成 str2
:%s/str1/str2/g
```

# colors

cp -r ~/dotfiles/vim/colors ~/.vim/colors
