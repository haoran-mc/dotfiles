"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 键映射
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
imap {<cr> {<cr>}<esc>O
nmap <leader>0 i<Space><C-c>la<Space><C-c>h
" nmap <leader>rc :e ~/dotfiles/vim/init.vim<cr>
nmap <leader>rc :FzfFiles ~/dotfiles/vim<cr>
nmap <leader>ut :e ~/haoran/tr/vim/test.go<cr>
tmap <leader>us :so ~/.vimrc<cr>
nmap <leader>1 :nohlsearch<cr>
nmap <leader><tab> :e#<cr>
" nmap <leader><leader> <esc>/<++><cr>:nohlsearch<cr>c4l
" nmap <leader>ft :Vex<cr>

nmap <leader>wc :q<cr>
nmap <leader>wv :vsp<cr>
nmap <leader>ws :sp<cr>
nmap <leader>wh <c-w><c-h>
nmap <leader>wj <c-w><c-j>
nmap <leader>wk <c-w><c-k>
nmap <leader>wl <c-w><c-l>
nmap <leader>wx <c-w><c-x>
nmap <leader>w= <c-w>=
nmap <leader>wH <c-w>H
nmap <leader>wK <c-w>K

nmap <leader>tn :tabnew<cr>

nmap <leader><tab> :e#<cr>


nmap <c-h> :vertical resize -2<cr>
nmap <c-l> :vertical resize +2<cr>
nmap <c-j> :resize +2<cr>
nmap <c-k> :resize -2<cr>

nmap <leader>ot :term<cr>

nnoremap < <<
nnoremap > >>
vnoremap < <gv
vnoremap > >gv


" 修复 ctags ctrl+] 无效问题
nmap <c-]> g<c-]>




nmap <leader>af :Ydc<cr>

" NERDTree
nmap <leader>ft  :NERDTreeToggle<cr>
nmap <leader>fo  :NERDTreeFind<cr>
nmap <leader>fm  :NERDTreeFromBookmark 

" easymotion
" bidirectional word
" pay attention! no chars at the end of map
nmap <leader>fw <Plug>(easymotion-bd-w)
nmap <leader>fj <Plug>(easymotion-j)
nmap <leader>fk <Plug>(easymotion-k)
nmap <leader>f. <Plug>(easymotion-repeat)
nmap <leader>fa <Plug>(easymotion-overwin-w)
" useless: w b e ge, W B E gE

" fzf
nmap <leader>ff  :FzfFiles<cr>
nmap <leader>fg  :FzfGFiles<cr>
nmap <leader>fl  :FzfLines<cr>
nmap <leader>fb  :FzfBuffers<cr>
nmap <leader>fr  :FzfHistory<cr>

"markdown
nmap <leader>mp :MarkdownPreview<cr>
nmap <leader>mt :TableModeToggle<cr>

"template
" nmap <leader>ti :TemplateInit<cr>
nmap <leader>tr :r ~/haoran/co/algo/misc/08-prog/17-leetcode-template.go<cr>

" tagbar
nmap <leader>tb :TagbarToggle<cr>

" vimwiki
let g:vimwiki_map_prefix = '<Leader>e'
nmap <leader>ew  <Plug>VimwikiUISelect

" coc
nmap <leader>rn <Plug>(coc-rename)
