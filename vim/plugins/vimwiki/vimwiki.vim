



let g:vimwiki_map_prefix = '<Leader>e'
nmap <leader>ew  <Plug>VimwikiUISelect


let wiki_1 = {}
let wiki_1.path = '~/dotfiles/vim/docs/'
let wiki_1.syntax = 'markdown'
let wiki_1.ext = '.md'

let wiki_2 = {}
let wiki_2.path = '~/haoran/co/algo/note/'
let wiki_2.syntax = 'markdown'
let wiki_2.ext = '.md'

let g:vimwiki_list = [wiki_1, wiki_2]





