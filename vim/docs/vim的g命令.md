Vim 中运行 :he *g* 可以查看内容


```

2.4 Commands starting with 'g'						*g*



tag		char	   note action in Normal mode	~

------------------------------------------------------------------------------

# show info

|g_CTRL-G|	g CTRL-G	  show information about current cursor. (show words counts)

|g<|		g<		    display previous command output  (can be used to debug script)[Vim: Move window left/right? - Stack Overflow](https://stackoverflow.com/a/4561676/5046735)



# Enhance

## line wrap

|g^|		g^		1 when 'wrap' off go to leftmost non-white

				  character of the current line that is on

				  the screen; when 'wrap' on go to the

				  leftmost non-white character of the current

				  screen line

|gj|		gj		1 like "j", but when 'wrap' on go N screen

				  lines down

|gk|		gk		1 like "k", but when 'wrap' on go N screen

				  lines up

|g$|		g$		1 when 'wrap' off go to rightmost character of

				  the current line that is on the screen;

				  when 'wrap' on go to the rightmost character

|g0|		g0		1 when 'wrap' off go to leftmost character of

				  the current line that is on the screen;

				  when 'wrap' on go to the leftmost character

				  of the current screen line



|g_|		g_		1 cursor to the last CHAR N - 1 lines lower



|g#|		g#		1 like "#", but without using "\<" and "\>" of the current screen line

|gstar|		g*		1 like "*", but without using "\<" and "\>"



|gn|		gn	   1,2 find the next match with the last used

				  search pattern and Visually select it

|gN|		gN	   1,2 find the previous match with the last used

				  search pattern and Visually select it



# move

|gi|		gi		2 like "i", but first move to the |'^| mark. jumplist

|g,|		g,		1 go to N newer position in change list

|g;|		g;		1 go to N older position in change list

|ge|		ge		1 go backwards to the end of the previous

				  word

|gE|		gE		1 go backwards to the end of the previous

|gt|		gt		  go to the next tab page

|gT|		gT		  go to the previous tab page

|g<Tab>|	g<Tab>		  go to last accessed tab page



|gf|		gf		  start editing the file whose name is under the cursor

|gF|		gF		  start editing the file whose name is under the cursor and jump to the line number following the filename.



|gg|		gg		1 cursor to line N, default first line





|gd|		gd		1 go to definition of word under the cursor

				  in current function

|gD|		gD		1 go to definition of word under the cursor

				  in current file

				  WORD

# other

|gv|		gv		  reselect the previous Visual area

|netrw-gx|	gx		  execute application for file name under the

				  cursor (only with |netrw| plugin)



# Unstable

|g&|		g&		2 repeat last ":s" on all lines

|g@|		g@{motion}	  call 'operatorfunc'



# can be replaced

|g+|		g+		  go to newer text state N times

|g-|		g-		  go to older text state N times

|gI|		gI		2 like "I", but always start in column 1

|gJ|		gJ		2 join lines without inserting space

|gP|		["x]gP		2 put the text [from register x] before the

				  cursor N times, leave the cursor after it

|gp|		["x]gp		2 put the text [from register x] after the

				  cursor N times, leave the cursor after it



" Don't use 

|g'|		g'{mark}	1 like |'| but without changing the jumplist

|g`|		g`{mark}	1 like |`| but without changing the jumplist

|gQ|		gQ		  switch to "Ex" mode with Vim editing

|gR|		gR		2 enter Virtual Replace mode

|gV|		gV		  don't reselect the previous Visual area

				  when executing a mapping or menu in Select mode

|g8|		g8		  print hex value of bytes used in UTF-8

				  character under the cursor

|gu|		gu{motion}	2 make Nmove text lowercase

|gU|		gU{motion}	2 make Nmove text uppercase

|g~|		g~{motion}	2 swap case for Nmove text

|gw|		gw{motion}	2 format Nmove text and keep cursor

|ga|		ga		  print ascii value of character under the cursor

|gh|		gh		  start Select mode

|gm|		gm		1 go to character at middle of the screenline

|gM|		gM		1 go to character at middle of the text line

|go|		go		1 cursor to byte N in the buffer

|g]|		g]		  :tselect on the tag under the cursor

|gq|		gq{motion}	2 format Nmove text

|gr|		gr{char}	2 virtual replace N chars with {char}

|gs|		gs		  go to sleep for N seconds (default 1)

|g_CTRL-A|	g CTRL-A	  dump a memory profile

|g_CTRL-H|	g CTRL-H	  start Select block mode

|g_CTRL-]|	g CTRL-]	  |:tjump| to the tag under the cursor

|g?|		g?		2 Rot13 encoding operator

|g?g?|		g??		2 Rot13 encode current line

|g?g?|		g?g?		2 Rot13 encode current line

|gH|		gH		  start Select line mode



|g<Down>|	g<Down>		1 same as "gj"

|g<End>|	g<End>		1 same as "g$"

|g<Home>|	g<Home>		1 same as "g0"

|g<LeftMouse>|	g<LeftMouse>	  same as <C-LeftMouse>

		g<MiddleMouse>	  same as <C-MiddleMouse>

|g<RightMouse>|	g<RightMouse>	  same as <C-RightMouse>

|g<Up>|		g<Up>		1 same as "gk"

```



