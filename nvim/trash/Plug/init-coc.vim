"----------------------------------------------------------------
" coc.nvim
let g:coc_global_extensions = [
            \ 'coc-java',
            \ 'coc-actions',
            \ 'coc-css',
            \ 'coc-diagnostic',
            \ 'coc-explorer',
            \ 'coc-flutter-tools',
            \ 'coc-gitignore',
            \ 'coc-html',
            \ 'coc-json',
            \ 'coc-lists',
            \ 'coc-marketplace',
            \ 'coc-prettier',
            \ 'coc-pyright',
            \ 'coc-python',
            \ 'coc-snippets',
            \ 'coc-sourcekit',
            \ 'coc-stylelint',
            \ 'coc-syntax',
            \ 'coc-tasks',
            \ 'coc-todolist',
            \ 'coc-translator',
            \ 'coc-tslint-plugin',
            \ 'coc-tsserver',
            \ 'coc-vimlsp',
            \ 'coc-vetur',
            \ 'coc-yaml',
            \ 'coc-yank']
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
function! Show_documentation()
    call CocActionAsync('highlight')
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction
function! s:cocActionsOpenFromSelected(type) abort
    execute 'CocCommand actions.open ' . a:type
endfunction
let g:snips_author = 'haoran'
