let mapleader=" "                                              " 设置leader键

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 非 LEADER 前缀
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" inoremap {<CR> {<CR>}<ESC>O
autocmd Filetype markdown set wrap
autocmd Filetype markdown nnoremap j gj
autocmd Filetype markdown nnoremap k gk

nnoremap <silent> tl :ls<CR>
nnoremap <silent> tN :enew<CR>
nnoremap <silent> tn :bnext<CR>
nnoremap <silent> tp :bprevious<CR>
nnoremap <silent> td :bdelete<CR>
nnoremap <silent> gN :tabnew<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LEADER 与 which_key 保持一致
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <LEADER>0 i<Space><C-c>la<Space><C-c>h
noremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l
noremap <LEADER><CR> :nohlsearch<CR>

" Easymotion
" map  <Leader>e   <Plug>(easymotion-prefix)
map  <Leader>ef  <Plug>(easymotion-bd-f)
nmap <leader>ef  <Plug>(easymotion-overwin-f)
nmap <leader>eF  <Plug>(easymotion-overwin-f2)
nmap <leader>eJ  <Plug>(easymotion-j)
nmap <leader>eK  <Plug>(easymotion-k)
nmap <leader>eH  <Plug>(easymotion-bd-jk)
nmap <leader>eL  <Plug>(easymotion-overwin-line)
nmap <leader>ewj <Plug>(easymotion-t2)
nmap <leader>ewk <Plug>(easymotion-s2)
map  <Leader>ewl <Plug>(easymotion-lineforward)
map  <Leader>ewh <Plug>(easymotion-linebackward)
map  <leader>eW  <Plug>(easymotion-bd-w)
nmap <leader>eW  <Plug>(easymotion-overwin-w)
map  <leader>e/  <Plug>(easymotion-sn)
omap <leader>e/  <Plug>(easymotion-tn)

vnoremap <silent> <LEADER>oy :<C-u>Ydv<CR>

" Windows
noremap <leader>wh <c-w>h
noremap <leader>wj <c-w>j
noremap <leader>wk <c-w>k
noremap <leader>wl <c-w>l

" 分屏窗口大小调整, 可以通过 CTRL+方向键 来调整vim分屏窗口大小
nnoremap <c-up> <c-w>-
nnoremap <c-down> <c-w>+
nnoremap <c-left> <c-w><
nnoremap <c-right> <c-w>>
