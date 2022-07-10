" ----------------------------------------------------------------
" Install plugins with Vim-plug

if empty(glob('~/.nvim'))
    call system('mkdir ~/.nvim')
endif

source ~/.config/nvim/autoload/plug.vim
call plug#begin('~/.nvim/plugged')
" 基础功能
Plug 'mhinz/vim-startify'
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
" Plug 'glepnir/spaceline.vim'
Plug 'preservim/nerdcommenter'
" Plug 'vim-autoformat/vim-autoformat'
Plug 'Chiel92/vim-autoformat'

" vim enhancement
" Plug 'mbbill/undotree'
" Plug 'tpope/vim-surround'  " type yskw' to wrap the word with '' or type cs'` to change 'word' to `word`
" Plug 'easymotion/vim-easymotion'
Plug 'ianva/vim-youdao-translater'
" Plug 'voldikss/vim-floaterm'
Plug 'ryanoasis/vim-devicons'
" Plug 'luochen1990/rainbow'
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'junegunn/fzf.vim'    " with the help of third party FZF
" Plug 'yegappan/mru'        " recent files，can be used in conjunction with FZF

" NERDTree --caton--
" Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" program
" Plug 'RRethy/vim-illuminate'
" ------ Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'dhruvasagar/vim-table-mode', { 'on': 'Tablemodetoggle', 'for': ['text', 'markdown', 'vim-plug'] }
" Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['vim-plug', 'c', 'cpp'] }
" ------ Python
" Plug 'tmhedberg/simpylfold', { 'for' :['python', 'vim-plug'] }
" Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
" Plug 'numirias/semshi', { 'do': ':updateremotePlugins', 'for' :['python', 'vim-plug'] }
" Plug 'OmniSharp/omnisharp-vim'
" ------ Go
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" ------ html
" Plug 'RRethy/vim-hexokinase'      " display color
" Plug 'mattn/emmet-vim'
" Plug 'AndrewRadev/tagalong.vim'   " auto rename tag name

" tools
" Plug 'tpope/vim-fugitive'       " add git operation
" Plug 'airblade/vim-gitgutter'   " current line changes
Plug 'folke/which-key.nvim'

" better edit
" Plug 'junegunn/goyo.vim'
" Plug 'mtth/scratch.vim'
" Plug 'kshenoy/vim-signature'
Plug 'vimwiki/vimwiki'

" Plug 'godlygeek/tabular' " ga, or :tabularize <regex> to align
" Plug 'rhysd/clever-f.vim'

" File navigation
" Plug 'Yggdroot/LeaderF', { 'do': 'install.sh' }
" Plug 'kevinhwang91/rnvimr' "ranger

" Taglist
" Plug 'liuchengxu/vista.vim'

" Auto Complete
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'wellle/tmux-complete.vim'

" abandoned
" Plug 'ctrlpvim/ctrlp.vim'
" Plug 'TaDaa/vimade'         " highlighted the current window
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

call plug#end()
