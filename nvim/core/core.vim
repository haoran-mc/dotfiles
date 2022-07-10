if &compatible
	" vint: -ProhibitSetNoCompatible
	set nocompatible
	" vint: +ProhibitSetNoCompatible
endif

" Set main configuration directory as parent directory
let $VIM_PATH = fnamemodify(resolve(expand('<sfile>:p')), ':h:h')

" set the user config file
" let s:user_init_config = expand($VIM_PATH.'/init.vim')

" Initialize base requirements
if has('vim_starting')
	" Global Mappings "{{{
	" Use spacebar as leader and ; as secondary-leader
	" Required before loading plugins!
	let g:mapleader="\<Space>"
	let g:maplocalleader=';'

	" Release keymappings prefixes, evict entirely for use of plug-ins.
	nnoremap <Space>  <Nop>
	xnoremap <Space>  <Nop>
endif

call utils#source_file($VIM_PATH,'core/general.vim')
call utils#source_file($VIM_PATH,'core/plugin.vim')
call utils#source_file($VIM_PATH,'init/init-func.vim')
call utils#source_file($VIM_PATH,'init/init-plug.vim')
call utils#source_file($VIM_PATH,'core/filetype.vim')

" Load user init config
" call utils#check_source(s:user_init_config)

" disable all keymaps of plugins
let g:vim_disable_mappings = 0
" disable some plugins keymap
let g:vim_disable_pmaping = []

" Load key map
call utils#source_file($VIM_PATH,'keybinds/keybinds.vim')

" Initialize user favorite colorscheme
" call theme#init()
" color gruvbox
color hybrid

if exists("*UserInit")
	call UserInit()
endif

set secure

" vim: set ts=2 sw=2 tw=80 noet :
call utils#source_file($VIM_PATH,'core/the_end.vim')
