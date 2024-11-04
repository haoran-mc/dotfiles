#!/bin/bash

NEXTLINE='\n'
# 3 个空格
SPACE='   '

# \033[31m 红色 \033[0m
# \033[32m 绿色 \033[0m
# \033[33m 明黄 \033[0m
# \033[34m 蓝色 \033[0m
# \033[36m 天蓝 \033[0m

function __tldr_git {
    local opt=$1

    case $opt in
        'branch' | 'br')
            printf 'List, create, or delete branches.\n'
            printf $NEXTLINE

            # printf '%s \033[36mgit br\033[0m                   \033[32mgit branch\033[0m \n' $SPACE
            # printf $NEXTLINE

            printf '%s - \033[34mgit br --all\033[0m                                 List all branches (local and remote; the current branch is highlighted by `*`).\n' $SPACE
            printf '%s - \033[34mgit br -r\033[0m                                    List or delete (if used with -d) the remote-tracking branches.\n' $SPACE
            printf '%s - \033[34mgit br -d <branch-name>\033[0m                      Delete a local branch (must not have it checked out to do this).\n' $SPACE
            printf '%s - \033[34mgit br -D <branch-name>\033[0m                      Forced Deletion of Local Branches.\n' $SPACE
            printf '%s - \033[34mgit br -m <old-br-name> <new-br-name>\033[0m        Delete a local branch (must not have it checked out to do this).\n' $SPACE
            printf '%s - \033[34mgit br --set-upstream-to origin/<branch-name>\033[0m\n' $SPACE
            printf '                                                   Set or change the upstream branch for a given branch.\n'
            ;;
        'clone')
            printf 'Clone a repository into a new directory.\n'
            printf $NEXTLINE

            printf '%s - \033[34mgg clone -b main --depth 1 github.com:haoran-mc/dotfiles.git\033[0m\n' $SPACE
            printf '        ➢ -b, --branch       Instead of pointing the newly created HEAD to the branch pointed to by the cloned repository’s HEAD, point to <branch-name> branch instead.\n'
            printf '        ➢ --depth            Create a shallow clone with a history truncated to the specified number of commits.\n'
            printf '                             You may need use \033[33m--single-branch\033[0m to fetch the histories near the tips of single branch.\n'
            ;;
        'log')
            printf 'usage: git log [<options>] [<revision-range>] [[--] <path>...]\n'
            printf '   or: git show [<options>] <object>...\n'
            printf $NEXTLINE

            # printf '%s \033[36m--help\033[0m \n' $SPACE
            # printf $NEXTLINE

            printf '%s \033[36mgit lo\033[0m                   \033[32mgit log --oneline --graph\033[0m \n' $SPACE
            printf '        ➢ --oneline          This is a shorthand for "--pretty=oneline --abbrev-commit" used together.\n'
            printf '        ➢ --graph            Draw a text-based graphical representation of the commit history on the left hand side of the output.\n'
            printf $NEXTLINE

            printf '%s \033[36mgit lp\033[0m                   \033[32mgit log --patch\033[0m \n' $SPACE
            printf '        ➢ -p, -u, --patch    Draw a text-based graphical representation of the commit history on the left hand side of the output.\n'
            printf $NEXTLINE

            printf "%s \033[36mgit la\033[0m                   \033[32mgit log --format='%%an <%%ae>'\033[0m This command will output a list of all authors who have made commits\n" $SPACE
            printf "                                               in your repository, you may use \033[33m| sort -u\033[0m to sort the output alphabetically and\n"
            printf "                                               then removes duplicate lines. This ensures each author appears only once in the list.\n"
            printf '        ➢ %%n                 newline\n'
            printf '        ➢ %%an                author name\n'
            printf '        ➢ %%aN                author email\n'
            printf $NEXTLINE

            printf '%s -------------->\n' $SPACE
            printf '%s ➢\033[33m --author \033[0m              Limit the commits output to ones with author/committer header lines that match the specified pattern (regular expression).\n' $SPACE
            printf '%s ➢\033[33m --graph  \033[0m              Draw a text-based graphical representation of the commit history on the left hand side of the output.\n' $SPACE
            printf '%s ➢\033[33m --reverse \033[0m             Output the commits chosen to be shown (see Commit Limiting section above) in reverse order.\n' $SPACE
            ;;
        'remote')
            printf 'Manage set of tracked repositories.\n'
            printf $NEXTLINE

            printf '%s - \033[34mgit remote -v\033[0m\n' $SPACE
            printf '%s - \033[34mgit remote add origin git@github.com:haoran-mc/remote.git\033[0m\n' $SPACE
            printf '%s - \033[34mgit remote set-url origin git@github.com:haoran-mc/remote.git\033[0m\n' $SPACE
            printf '%s - \033[34mgit remote remove origin\033[0m\n' $SPACE
            printf '%s - \033[34mgit remote update origin -p\033[0m                  Fetch updates for remotes or remote groups in the repository as defined by remotes.<group>.\n' $SPACE
            ;;
        'stash')
            printf 'Stash local Git changes in a temporary area.\n'
            printf $NEXTLINE

            printf '%s - \033[34mgit stash save "save message"\033[0m\n' $SPACE
            printf '%s - \033[34mgit stash list\033[0m\n' $SPACE
            printf '%s - \033[34mgit stash show stash@{0} -p\033[0m\n' $SPACE
            printf '%s - \033[34mgit stash apply stash@{0}\033[0m\n' $SPACE
            printf '%s - \033[34mgit stash pop\033[0m\n' $SPACE
            printf '%s - \033[34mgit stash drop stash@{0}\033[0m\n' $SPACE
            printf '%s - \033[34mgit stash clear\033[0m\n' $SPACE
            ;;
        'switch')
            printf 'usage: git switch [<options>] [--no-guess] <branch>\n'
            printf '       git switch [<options>] --detach [<start-point>]\n'
            printf '       git switch [<options>] (-c|-C) <new-branch> [<start-point>]\n'
            printf '       git switch [<options>] --orphan <new-branch>\n'
            printf $NEXTLINE

            printf '%s - \033[34mgit switch <branch-name>\033[0m                     Switch to an existing branch.\n' $SPACE
            printf '%s - \033[34mgit switch -c <branch-name>\033[0m                  Create a new branch and switch to it.\n' $SPACE
            printf '%s - \033[34mgit switch --detach 83a6f0a\033[0m                  Switching to a commit without creating a new branch.\n' $SPACE
            printf '%s - \033[34mgit switch -\033[0m                                 Switch to the previous branch.\n' $SPACE
            printf '%s - \033[34mgit switch --orphan <branch-name>\033[0m            Create a branch without any commit history.\n' $SPACE
            printf '%s - \033[34mgit switch --merge branch_name\033[0m               Switch to a branch and automatically merge the current branch and any uncommitted changes into it.\n' $SPACE
            ;;
    esac
}

# too long, didn't read
function __help_tldr {
    local cmd=$1 opt=$2
    if [ -z $cmd ]; then
        printf " | brew | fd | fzf | git | help(h) | pacman | printf | rg | shutdown | tree | \n"
        return
    fi

    case $cmd in
        'brew')
            printf 'Homebrew - a package manager for macOS and Linux.\n'
            printf $NEXTLINE

            printf '安装与更新\n'
            printf '%s - \033[34mbrew install FORMULA|CASK...\033[0m          安装软件\n' $SPACE
            printf '%s - \033[34mbrew upgrade [FORMULA|CASK...]\033[0m        安装新版本的包，但是旧版本依然会保留\n' $SPACE
            printf '%s - \033[34mbrew upgrade\033[0m                          brew自身更新\n' $SPACE
            printf '%s - \033[34mbrew outdated\033[0m                         查看哪些包可以更新\n' $SPACE
            printf '%s - \033[34mbrew pin [FORMULA...]\033[0m                 锁定某个包，不更新\n' $SPACE
            printf '%s - \033[34mbrew unpin [FORMULA...]\033[0m               取消锁定\n' $SPACE
            printf $NEXTLINE

            printf '卸载软件\n'
            printf '%s - \033[34mbrew uninstall FORMULA|CASK...\033[0m        卸载软件\n' $SPACE
            printf $NEXTLINE

            printf '搜索软件\n'
            printf '%s - \033[34mbrew search TEXT|/REGEX/\033[0m              在仓库搜索包含关键字的软件包\n' $SPACE
            printf '%s - \033[34mbrew info [FORMULA|CASK...]\033[0m           查看已安装包信息\n' $SPACE
            printf $NEXTLINE

            printf '清理缓存\n'
            printf '%s - \033[34mbrew cleanup\033[0m                          清理所有包的旧版本\n' $SPACE
            printf '%s - \033[34mbrew cleanup [FORMULA...]\033[0m             清理指定包的旧版本\n' $SPACE
            printf '%s - \033[34mbrew cleanup -n\033[0m                       查看可清理的旧版本包，不执行实际操作\n' $SPACE
            printf $NEXTLINE

            printf '软件服务管理\n'
            printf '%s - \033[34mbrew services list\033[0m                    查看使用brew安装的服务列表\n' $SPACE
            printf '%s - \033[34mbrew services run formula|--all\033[0m       启动服务（仅启动不注册）\n' $SPACE
            printf '%s - \033[34mbrew services start formula|--all\033[0m     启动服务，并注册\n' $SPACE
            printf '%s - \033[34mbrew services stop formula|--all\033[0m      停止服务，并注册\n' $SPACE
            printf '%s - \033[34mbrew services restart formula|--all\033[0m   重启服务，并注册\n' $SPACE
            printf $NEXTLINE
            ;;
        'fd')
            printf 'An alternative to `find`. Aims to be faster and easier to use than `find`.\n'
            printf $NEXTLINE

            printf '%s - \033[34mfd -t directory <pattern>\033[0m\n' $SPACE
            printf '        ➢ -t, --type         Filetype.\n'
            printf $NEXTLINE

            printf '%s -------------->\n' $SPACE
            printf '%s ➢\033[33m -i \033[0m               case-insensitive.\n' $SPACE
            printf '%s ➢\033[33m -s \033[0m               smartcase.\n' $SPACE
            printf "%s ➢\033[33m -l \033[0m               Use a detailed listing format like 'ls -l'. \n" $SPACE
            ;;
        'fzf')
            printf 'Command-line fuzzy finder. Similar to `sk`.\n'
            printf $NEXTLINE

            printf '%s - \033[34mecho "one\\ntwo\\nthree\\nfour" | fzf\033[0m\n' $SPACE
            printf '%s - \033[34mls | fzf\033[0m\n' $SPACE
            printf '%s - \033[34mfd --type file | fzf\033[0m\n' $SPACE
            printf '%s - \033[34mvim `fzf`\033[0m\n' $SPACE
            ;;
        'git')
            if [ -z $opt ]; then
                printf 'Distributed version control system.\n'
                printf $NEXTLINE

                printf '%s - \033[34mgit log --help\033[0m\n' $SPACE
                printf $NEXTLINE

                printf '%s ➢\033[33m branch(br) \033[0m  List, create, or delete branches.\n' $SPACE
                printf '%s ➢\033[33m clone \033[0m       Clone a repository into a new directory.\n' $SPACE
                printf '%s ➢\033[33m log \033[0m         Show commit logs.\n' $SPACE
                printf '%s ➢\033[33m remote \033[0m      Manage set of tracked repositories.\n' $SPACE
                printf '%s ➢\033[33m switch \033[0m      Switch between Git branches. Requires Git version 2.23+.\n' $SPACE
                printf '%s ➢\033[33m stash \033[0m       Stash local Git changes in a temporary area.\n' $SPACE
            else
                __tldr_git $opt
            fi
            ;;
        'help' | 'h')
            # printf '%s ┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄→\n' $SPACE
            printf '%s ➢\033[31m position: \033[0m\n' $SPACE
            printf '%s     1.\033[34m which \033[0m            Locate a program in the user'\''s path.\n' $SPACE
            printf '                             If there are multiple executables which match, use \033[33m-a\033[0m display all.\n'
            printf '%s     2.\033[34m type \033[0m             Display the type of a command.\n' $SPACE
            printf '%s     3.\033[34m whereis \033[0m          Locate the binary, source, and manual page files for a command.\n' $SPACE
            printf '%s     4.\033[34m locate/updatedb \033[0m  Find filenames quickly.\n' $SPACE
            printf '%s     5.\033[34m find → fd \033[0m        Find files or directories under a directory tree, recursively.\n' $SPACE
            printf $NEXTLINE

            printf '%s ➢\033[31m function: \033[0m\n' $SPACE
            printf '%s     1.\033[34m --help \033[0m           A brief version of the information in the man command.\n' $SPACE
            printf '%s     2.\033[34m whatis \033[0m           Search a set of database files for short descriptions of system commands for keywords.\n' $SPACE
            printf '%s     3.\033[34m man → tldr \033[0m       Format and display manual pages. \033[33mman man\033[0m see more.\n' $SPACE
            printf '%s     4.\033[34m info \033[0m             Reads documentation stored in the info format.\n' $SPACE
            printf '%s     5.\033[34m /usr/share/doc \033[0m\n' $SPACE
            ;;
        'pacman')
            printf 'package manager utility.\n'
            printf $NEXTLINE

            printf '安装软件\n'
            printf '%s - \033[34mpacman -S <software>\033[0m                  安装软件，若有多个软件包，空格分隔\n' $SPACE
            printf '%s - \033[34mpacman -S --needed <software>\033[0m         安装软件，若存在，不重新安装最新的软件\n' $SPACE
            printf '%s - \033[34mpacman -Sv <software>\033[0m                 输出操作信息后安装\n' $SPACE
            printf '%s - \033[34mpacman -U <software.pkg.tar.gz>\033[0m       安装本地软件包\n' $SPACE
            printf $NEXTLINE

            printf '卸载软件\n'
            printf '%s - \033[34mpacman -R <software>\033[0m                  只卸载软件包不卸载依赖的软件\n' $SPACE
            printf '%s - \033[34mpacman -Rv <software>\033[0m                 卸载软件，并输出卸载信息\n' $SPACE
            printf '%s - \033[34mpacman -Rs <software>\033[0m                 卸载软件，并同时卸载该软件的依赖软件\n' $SPACE
            printf '%s - \033[34mpacman -Rsc <software>\033[0m                卸载软件，并卸载依赖该软件的程序\n' $SPACE
            printf $NEXTLINE

            printf '搜索软件\n'
            printf '%s - \033[34mpacman -Ss <keyword>\033[0m                  在仓库搜索包含关键字的软件包\n' $SPACE
            printf '%s - \033[34mpacman -Sl\033[0m                            显示软件仓库所有软件的列表\n' $SPACE
            printf '%s - \033[34mpacman -Q <software>\033[0m                  查看软件是否已安装\n' $SPACE
            printf '%s - \033[34mpacman -Qs <keyword>\033[0m                  搜索已安装的软件包\n' $SPACE
            printf '%s - \033[34mpacman -Qi <software>\033[0m                 查看软件包详细信息\n' $SPACE
            printf '%s - \033[34mpacman -Ql <software>\033[0m                 列出软件包所有文件安装路径\n' $SPACE
            printf '%s - \033[34mpacman -Qu\033[0m                            列出可升级的软件包\n' $SPACE
            printf '%s - \033[34mpacman -Qt\033[0m                            列出不被任何软件要求的软件包\n' $SPACE
            printf $NEXTLINE

            printf '软件包组\n'
            printf '%s - \033[34mpacman -Sg\033[0m                            列出软件仓库上所有软件包组\n' $SPACE
            printf '%s - \033[34mpacman -Qg\033[0m                            列出本地已经安装的软件包组和子软件包\n' $SPACE
            printf '%s - \033[34mpacman -Sg <groups>\033[0m                   查进软件包组所包含的软件包\n' $SPACE
            printf '%s - \033[34mpacman -Qg <groups>\033[0m                   查看软件包组所包含的软件包\n' $SPACE
            printf $NEXTLINE

            printf '更新系统\n'
            printf '%s - \033[34mpacman -Sy\033[0m                            从服务器下载最新的软件包数据库到本地\n' $SPACE
            printf '%s - \033[34mpacman -Su\033[0m                            升级所有已安装的软件包\n' $SPACE
            printf '%s - \033[34mpacman -Syu\033[0m                           升级整个系统\n' $SPACE
            printf $NEXTLINE

            printf '清理缓存\n'
            printf '%s - \033[34mpacman -Sc\033[0m                            清理未安装的软件包文件\n' $SPACE
            printf '%s - \033[34mpacman -Scc\033[0m                           清理所有的缓存文件\n' $SPACE
            printf $NEXTLINE
            ;;
        'printf')
            printf 'Format and print text. If you want to use ${myvar} to view variables, use \033[31m"\033[0m, otherwise use \033[31m'\''\033[0m at all times.\n'
            printf $NEXTLINE

            printf '%s - \033[34mprintf "%%s\\n" "Hello world"\033[0m                  Print a text message.\n' $SPACE
            printf '%s - \033[34mprintf "\\e[1;34m%%.3d\\e[0m\\n" 42\033[0m              Print an integer in bold blue.\n' $SPACE
            printf '%s - \033[34mprintf -v myvar "This is %%s = %%d\\n" "a year" 20a4\033[0m\n' $SPACE
            printf '                                                   Store a formatted message in a variable.'
            printf $NEXTLINE

            printf '%s -------------->\n' $SPACE
            printf '%s ➢\033[33m \\n \033[0m                    Write a <new-line> character.\n' $SPACE
            printf '%s ➢\033[33m \\t \033[0m                    Write a <tab> character.\n' $SPACE
            printf '%s ➢\033[33m \\` \033[0m                    Write a <single quote> character.\n' $SPACE
            printf '%s ➢\033[33m \\\\ \033[0m                    Write a backslash character.\n' $SPACE
            printf '%s ➢\033[33m %%%% \033[0m                    Write a percent sign character.\n' $SPACE
            ;;
        'rg')
            printf 'Ripgrep is a recursive line-oriented search tool.\n'
            printf 'Aims to be a faster alternative to `grep`.\n'
            printf $NEXTLINE

            printf "%s - \033[34mrg <glob> -g '!/*/*'\033[0m\n" $SPACE
            printf '        ➢ -g <glob>              Include or exclude files and directories for searching that match the given glob.\n'
            printf $NEXTLINE

            printf '%s -------------->\n' $SPACE
            printf '%s ➢\033[33m -e \033[0m                        regular-expression.\n' $SPACE
            printf '%s ➢\033[33m -i \033[0m                        case-insensitive.\n' $SPACE
            printf '%s ➢\033[33m -S \033[0m                        smartcase.\n' $SPACE
            ;;
        'shutdown')
            printf 'Shutdown and reboot the system.\n'
            printf $NEXTLINE

            printf '%s - \033[34mshutdown -h now\033[0m                  Power off ([h]alt) immediately.\n' $SPACE
            printf '%s - \033[34mshutdown -r now\033[0m                  [r]eboot immediately.\n' $SPACE
            printf '%s - \033[34mshutdown -r +5 &\033[0m                 [r]eboot in 5 minutes.\n' $SPACE
            printf '%s - \033[34mshutdown -h 13:00\033[0m                Shutdown at 1:00 pm (Uses 24[h] clock).\n' $SPACE
            printf '%s - \033[34mshutdown -c\033[0m                      [c]ancel a pending shutdown/reboot operation.\n' $SPACE
            ;;
        'tree')
            printf 'Show the contents of the current directory as a tree.\n'
            printf $NEXTLINE

            printf '%s -------------->\n' $SPACE
            printf '%s ➢\033[33m -L \033[0m                        levels of depth.\n' $SPACE
            printf '%s ➢\033[33m -d \033[0m                        directories only.\n' $SPACE
    esac
}



#################################################################
# An alternative to `find`. Aims to be faster and easier to use than `find`.
#
#     - fd -t directory <pattern>
#         ➢ -t, --type         Filetype.
#
#     -------------->
#     ➢ -i                case-insensitive.
#     ➢ -s                smartcase.
#     ➢ -l                Use a detailed listing format like 'ls -l'.
#################################################################

# 1. short description
# 2. - example
# 3.     ➢ the arg used in example
#
# -------------->
# ➢ other args
