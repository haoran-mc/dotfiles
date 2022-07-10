"===================== Start of Plugin Settings =====================
"----------------------------------------------------------------
" ALE
"始终开启标志列
let g:ale_sign_column_always = 0
let g:ale_set_highlights = 0
"自定义error和warning图标
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚡'
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = '❌'
let g:ale_echo_msg_warning_str = '🔰'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"cpp NOT C++
let g:ale_linters = {
            \   'cpp': ['gcc'],
            \   'c': ['gcc'],
            \   'python': ['flake8'],
            \   'html': ['tidy'],
            \   'css': ['stylelint'],
            \   'javascript': ['eslint'],
            \}

"----------------------------------------------------------------
" vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_concepts_highlight = 1
let g:cpp_no_function_highlight = 1

"----------------------------------------------------------------
" emmet
let g:user_emmet_mode='a'    "enable all function in all mode.
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

"----------------------------------------------------------------
" javascript
let javascript_enable_domhtmlcss = 1

"----------------------------------------------------------------
" vim-go
let g:go_echo_go_info = 0
let g:go_doc_popup_window = 1
let g:go_def_mapping_enabled = 0
let g:go_template_autocreate = 0
let g:go_textobj_enabled = 0
let g:go_auto_type_info = 1
let g:go_def_mapping_enabled = 0
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_functions = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_structs = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_types = 1
let g:go_highlight_variable_assignments = 0
let g:go_highlight_variable_declarations = 0
let g:go_doc_keywordprg_enabled = 0


"----------------------------------------------------------------
" Bullets.vim
let g:bullets_enabled_file_types = [
            \ 'markdown',
            \ 'text',
            \ 'gitcommit',
            \ 'scratch'
            \]

"----------------------------------------------------------------
" vim-visual-multi
"let g:VM_theme             = 'iceblue'
"let g:VM_default_mappings = 0
let g:VM_leader                     = {'default': '?', 'visual': '?', 'buffer': '?'}
let g:VM_maps                       = {}
let g:VM_custom_motions             = {'k': 'h', 'l': 'u', 'i': 'n', 'f': 'y', 'J': '0', 'L': '$', 'h': 'k'}
let g:VM_maps['Find Under']         = '<C-n>'
let g:VM_maps['Find Subword Under'] = '<C-n>'
let g:VM_maps['Find Next']          = ''
let g:VM_maps['Find Prev']          = ''
let g:VM_maps['Remove Region']      = 'q'
let g:VM_maps['Skip Region']        = '<c-j>'
let g:VM_maps["Undo"]               = 'u'
let g:VM_maps["Redo"]               = '<C-r>'

"----------------------------------------------------------------
" xtabline
noremap \p :echo expand('%:p')<CR>

"----------------------------------------------------------------
" vim-easymotion
let g:EasyMotion_do_mapping  = 0
let g:EasyMotion_do_shade    = 0
let g:EasyMotion_smartcase   = 1
let g:EasyMotion_startofline = 0

"----------------------------------------------------------------
" NrrwRgn
" let g:nrrw_rgn_nomap_Nr = 1

"----------------------------------------------------------------
" FZF
let g:fzf_preview_window = 'right:60%'
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

function! s:list_buffers()
    redir => list
    silent ls
    redir END
    return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
    execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8 } }

"----------------------------------------------------------------
" Leaderf
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewCode = 1
let g:Lf_ShowHidden = 1
let g:Lf_ShowDevIcons = 1
let g:Lf_CommandMap = {
            \   '<C-j>': ['<C-n>'],
            \   '<C-k>': ['<C-p>'],
            \   '<C-]>': ['<C-l>'],
            \   '<C-p>': ['<C-h>'],
            \   '<C-T>': ['<C-t>'],
            \   '<C-Down>': ['<C-j>'],
            \   '<C-Up>': ['<C-k>'],
            \}
let g:Lf_WildIgnore = {
            \ 'dir': ['.svn','.git','.hg','.vscode','.wine','.deepinwine','.oh-my-zsh','_exe'],
            \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]','--haoran']
            \}

"----------------------------------------------------------------
" rnvimr
let g:rnvimr_ex_enable = 1
let g:rnvimr_pick_enable = 1
let g:rnvimr_draw_border = 1
let g:rnvimr_border_attr = {'fg': 14, 'bg': -1}
let g:rnvimr_enable_bw = 1
"let g:rnvimr_ranger_cmd = 'ranger --cmd="set draw_borders both"'
highlight link RnvimrNormal CursorLine
let g:rnvimr_action = {
            \ 'o':     'NvimEdit edit',
            \ '<CR>':  'NvimEdit edit',
            \ '<C-t>': 'NvimEdit tabedit',
            \ '<C-h>': 'NvimEdit vsplit',
            \ '<C-j>': 'NvimEdit split',
            \ '<C-k>': 'NvimEdit split',
            \ '<C-l>': 'NvimEdit vsplit',
            \ '\gw': 'JumpNvimCwd',
            \ '\yw': 'EmitRangerCwd'
            \ }
let g:rnvimr_presets = [{'width': 0.6, 'height': 0.6}]

"----------------------------------------------------------------
" floaterm
let g:floaterm_keymap_toggle = '<leader>tt'

"----------------------------------------------------------------
" Undotree
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 24


"----------------------------------------------------------------
" vim-focus
let g:VimFocusOpenWay = 'window'

"----------------------------------------------------------------
" Vista.vim
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'ctags'
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
            \   "function": "\uf794",
            \   "variable": "\uf71b",
            \  }


"----------------------------------------------------------------
" GitGutter
let g:gitgutter_map_keys = 0
highlight GitGutterAdd    guifg=#98C379 ctermfg=2
highlight GitGutterChange guifg=#FF8B8B ctermfg=3
highlight GitGutterDelete guifg=#FFFF00 ctermfg=1
let g:gitgutter_sign_added = '•'
let g:gitgutter_sign_modified = '•'
let g:gitgutter_sign_removed = '•'
let g:gitgutter_sign_removed_first_line = '•'
let g:gitgutter_sign_removed_above_and_below = '•'
let g:gitgutter_sign_modified_removed = '•'
set updatetime=100

"----------------------------------------------------------------
" AutoFormat
let g:formatdef_custom_js = '"js-beautify -t"'
let g:formatters_javascript = ['custom_js']
au BufWrite *.js :Autoformat

"----------------------------------------------------------------
" OmniSharp
let g:OmniSharp_typeLookupInPreview = 1
let g:omnicomplete_fetch_full_documentation = 1

let g:OmniSharp_server_use_mono = 1
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_highlight_types = 2
let g:OmniSharp_selector_ui = 'ctrlp'

sign define OmniSharpCodeActions text=💡

augroup OSCountCodeActions
    autocmd!
    autocmd FileType cs set signcolumn=yes
    autocmd CursorHold *.cs call OSCountCodeActions()
augroup END

function! OSCountCodeActions() abort
    if bufname('%') ==# '' || OmniSharp#FugitiveCheck() | return | endif
    if !OmniSharp#IsServerRunning() | return | endif
    let opts = {
                \ 'CallbackCount': function('s:CBReturnCount'),
                \ 'CallbackCleanup': {-> execute('sign unplace 99')}
                \}
    call OmniSharp#CountCodeActions(opts)
endfunction

function! s:CBReturnCount(count) abort
    if a:count
        let l = getpos('.')[1]
        let f = expand('%:p')
        execute ':sign place 99 line='.l.' name=OmniSharpCodeActions file='.f
    endif
endfunction

"----------------------------------------------------------------
" CTRLP (Dependency for omnisharp)
let g:ctrlp_map = ''
let g:ctrlp_cmd = 'CtrlP'

"----------------------------------------------------------------
" org-mode
let g:org_heading_shade_leading_stars = 0
let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

"----------------------------------------------------------------
" dart-vim-plugin
let g:dart_style_guide = 2
let g:dart_format_on_save = 1
let g:dartfmt_options = ["-l 100"]

"----------------------------------------------------------------
" AsyncTasks
let g:asyncrun_open = 6

"----------------------------------------------------------------
" devicons
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ''

"----------------------------------------------------------------
" rainbow
let g:rainbbw_active = 0


" ===================== End of Plugin Settings =====================
