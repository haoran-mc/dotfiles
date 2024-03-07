$ go build -o _exe -gcflags "-N -l" main.go

$ dlv exec -r stdin:input.txt _exe         # 重定向输入
(dlv) break(b) main.main   # 每个 Go 程序的入口是 main.main 函数
(dlv) breakpoints(bp)      # 查看当前所有断点
(dlv) vars main            # 查看 main 包的所有包级变量
(dlv) continue(c)          # 通过 continue 命令让程序运行到下一个断点处
(dlv) list(ls/l)           # 打印代码
(dlv) next(n)              # 输入 next 命令单步执行进入 main 函数内部
(dlv) args
(dlv) locals               # 通过 args 和 locals 命令查看函数的参数和局部变量
(dlv) whatis n             # 查看变量的类型
(dlv) print(p) n           # 打印变量
(dlv) set n=9              # 设置变量
(dlv) display -a n         # 每执行一行代码或断点时，打印加入到 display 变量的值
(dlv) display              # 不加参数，直接打印加入到 display 的变量的值
(dlv) break main.go:49     # 在 main.go 的第 49 行设置一个断点
(dlv) condition 2 i==3     # 断点 2 在循环内部，当循环变量 i 等于 3 时，断点生效
(dlv) stack                # 查看堆栈信息
(dlv) step                 # 步入函数内部
(dlv) stepout              # 跳出函数
(dlv) goroutine
(dlv) goroutines           # 通过 goroutine(s) 查看当前 Goroutine 相关的信息

-----

1. continue 运行
2. next 单步
3. step 步入
4. stepout 跳出


1. break internal/restful/util.go:80
2. print(dbTasks)



-----


断点：
	break(b)
			break main.main   在 Go 程序入口处设置一个断点
	breakpoints(bp)
	clear
	clearall
	toggle            toggle 2 关闭断点 2

参数：
	args  
	display
			display -a n      添加变量 n 到 display
			display -a n+1    添加表达式到 display
			display -d 1      删去第 2 个表达式
	locals
	print
			p num[l:r]        打印数组指定范围内的值
	set
	vars
	whatis

其他：
	funcs             打印程序用到的所有函数
	list              打印代码
			list              打印当前位置的代码
			list 22           打印 22 行周围的代码
			list quickSort    打印函数周围的代码
			list main.go:12   打印文件指定行号周围的代码
			list -10          打印当前位置前 10 行位置周围的代码
			list +10          打印当前位置后 10 行位置周围的代码
	help(h)

