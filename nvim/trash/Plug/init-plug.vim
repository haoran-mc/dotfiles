" ----------------------------------------------------------------
" Install plugins with Vim-plug

if empty(glob('~/.nvim'))
    call system('mkdir ~/.nvim')
endif

source ~/.config/nvim/autoload/plug.vim
call plug#begin('~/.nvim/plugged')

" File navigation
Plug 'mhinz/vim-startify'
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-Plugin'

" Status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dracula/vim'
Plug 'connorholyday/vim-snazzy'
Plug 'w0ng/vim-hybrid'
Plug 'chriskempson/base16-vim'
Plug 'nanotech/jellybeans.vim'
" Plug 'theniceboy/eleline.vim'
" Plug 'liuchengxu/space-vim-theme'
" Plug 'liuchengxu/vim-which-key'

" C++ Highlighter
Plug 'preservim/nerdcommenter'
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['vim-plug', 'c', 'cpp'] }
" Plug 'dense-analysis/ale',

" HTML, CSS, JavaScript, Typescript, PHP, JSON, etc.
Plug 'gorodinskiy/vim-coloresque'
Plug 'mattn/emmet-vim'
Plug 'pangloss/vim-javascript'
Plug 'elzr/vim-json'
Plug 'othree/html5.vim'
Plug 'alvan/vim-closetag'
Plug 'yuezk/vim-js', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'HerringtonDarkholme/yats.vim'
Plug 'posva/vim-vue'
" Plug 'hail2u/vim-css3-syntax' " , { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
" Plug 'spf13/PIV', { 'for' :['php', 'vim-plug'] }
" Plug 'pangloss/vim-javascript', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
" Plug 'MaxMEllon/vim-jsx-pretty', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
" Plug 'jelera/vim-javascript-syntax', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
" Plug 'jaxbot/browserlink.vim'

" Go
Plug 'fatih/vim-go' , { 'for': ['go', 'vim-plug'], 'tag': '*' }

" python
Plug 'tmhedberg/simpylfold', { 'for' :['python', 'vim-plug'] }
Plug 'vimjas/vim-python-pep8-indent', { 'for' :['python', 'vim-plug'] }
Plug 'numirias/semshi', { 'do': ':updateremotePlugins', 'for' :['python', 'vim-plug'] }
Plug 'tweekmonster/braceless.vim', { 'for' :['python', 'vim-plug'] }
" Plug 'vim-scripts/indentpython.vim', { 'for' :['python', 'vim-plug'] }
" Plug 'plytophogy/vim-virtualenv', { 'for' :['python', 'vim-plug'] }

" markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'dhruvasagar/vim-table-mode', { 'on': 'Tablemodetoggle', 'for': ['text', 'markdown', 'vim-plug'] }
Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] }
Plug 'dkarter/bullets.vim'

" editor enhancement
" Plug 'raimondi/delimitmate'
" Plug 'jiangmiao/auto-pairs' //蠢
Plug 'mg979/vim-visual-multi'
Plug 'theniceboy/antovim' " gs to switch
Plug 'tpope/vim-surround' " type yskw' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'gcmt/wildfire.vim' " in visual mode, type k' to select all text in '', or type k) k] k} kp
Plug 'godlygeek/tabular' " ga, or :tabularize <regex> to align
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/vim-peekaboo'
Plug 'rhysd/clever-f.vim'
Plug 'chrisbra/nrrwrgn'
Plug 'andrewradev/splitjoin.vim'
" Plug 'tomtom/tcomment_vim' " in <space>cn to comment a line
" Plug 'junegunn/vim-after-object' " da= to delete what's after =
" Plug 'tpope/vim-capslock' " ctrl+l (insert) to toggle capslock
" Plug 'konfekt/fastfold'
" Plug 'wellle/context.vim'
" Plug 'svermeulen/vim-subversive'
" Plug 'theniceboy/argtextobj.vim' " 可视延迟

" File navigation
Plug 'junegunn/fzf.vim'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'kevinhwang91/rnvimr' "ranger
Plug 'pechorin/any-jump.vim'
Plug 'voldikss/vim-floaterm'
"Plug 'airblade/vim-rooter' "nerdtree打开python文件

" Find & Replace
Plug 'brooth/far.vim', { 'on': ['F', 'Far', 'Fardo'] }

" Undo Tree
Plug 'mbbill/undotree'

" Calculator
Plug 'theniceboy/vim-calc'

" Practical
Plug 'SpringHan/vim-focus'

" Pretty Dress
" Plug 'bling/vim-bufferline'
" Plug 'bpietravalle/vim-bolt'
" Plug 'theniceboy/vim-deus'
" Plug 'arzg/vim-colors-xcode'

" General Highlighter
" Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
" Plug 'RRethy/vim-illuminate'

" Taglist
Plug 'liuchengxu/vista.vim'

" Debugger
" Plug 'puremourning/vimspector', {'do': './install_gadget.py --enable-c --enable-python --enable-go'}

" Auto Complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'wellle/tmux-complete.vim'

" Snippets
" Plug 'SirVer/ultisnips'
Plug 'theniceboy/vim-snippets'

" Git
Plug 'theniceboy/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }
" Plug 'fszymanski/fzf-gitignore', { 'do': ':UpdateRemotePlugins' }
" Plug 'mhinz/vim-signify'
Plug 'airblade/vim-gitgutter'
Plug 'cohama/agit.vim'

" Autoformat
Plug 'Chiel92/vim-autoformat'

" Tex
" Plug 'lervag/vimtex'

" CSharp
Plug 'OmniSharp/omnisharp-vim'
Plug 'ctrlpvim/ctrlp.vim' , { 'for': ['cs', 'vim-plug'] } " omnisharp-vim dependency

" Flutter
" Plug 'dart-lang/dart-vim-plugin'

" Other filetypes
Plug 'jceb/vim-orgmode', {'for': ['vim-plug', 'org']}
Plug 'tpope/vim-speeddating'
Plug 'vim-scripts/utl.vim'
"Plug 'cespare/vim-toml', { 'for': ['toml', 'vim-plug'] }
Plug 'vimwiki/vimwiki', {'for': ['pdf', 'vimwiki'] }

" For general writing
Plug 'junegunn/goyo.vim'
" Plug 'reedes/vim-wordy'
" Plug 'ron89/thesaurus_query.vim'

" Bookmarks
" Plug 'MattesGroeger/vim-bookmarks'

" Documentation
" Plug 'KabbAmine/zeavim.vim' " <LEADER>z to find doc

" Mini Vim-APP
" Plug 'hardcoreplayers/dashboard-nvim'
" Plug 'liuchengxu/vim-clap' " Dependency of dashboard
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'

" Vim Applications
Plug 'itchyny/calendar.vim'

" Other visual enhancement
Plug 'ryanoasis/vim-devicons'
Plug 'luochen1990/rainbow'
Plug 'mg979/vim-xtabline'
Plug 'wincent/terminus'

" Other useful utilities
" Plug 'lambdalisue/suda.vim' " do stuff like :sudowrite
" Plug 'makerj/vim-pdf'
" Plug 'xolox/vim-session'
" Plug 'xolox/vim-misc' " vim-session dep

" Dependencies
" Plug 'MarcWeber/vim-addon-mw-utils'
" Plug 'kana/vim-textobj-user'
" Plug 'roxma/nvim-yarp'

call plug#end()
