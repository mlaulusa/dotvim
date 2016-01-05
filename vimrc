" Matthew's VIMRC!
" Started 11/7/14

" TO ADD
" tmux-navigator - once I understand tmux
" YouCompleteMe - need to compile vim
" tern for vim - something wrong with python and javascript
" thematic - can't use in puTTY
" vim-javascript - need to compile vim

" -----------------------------------------------------------
" Manage runtime path for plugins
" -----------------------------------------------------------
execute pathogen#infect()


" ----------------------------------------------------------
" General Settings
" ----------------------------------------------------------

syntax on
set background=dark
colorscheme jellybeans
filetype plugin indent on
set number
set tabstop=4 softtabstop=4 noexpandtab shiftwidth=4

map <Leader> <Plug>(easymotion-prefix)
imap fj <esc>
vmap fj <esc> 
map <UP> <C-W>k
map <DOWN> <C-W>j
map <RIGHT> <C-W>l
map <LEFT> <C-W>h

" ----------------------------------------------------------
" Settings for emmet
" ----------------------------------------------------------
" makes it so emmet only works for html and css
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
" changes the leader key for emeet
"let g:user_emmet_leader_key='<C-K>'

" ----------------------------------------------------------
" Settings for syntastic 
" ----------------------------------------------------------

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': ['javascript', 'python']  }
nnoremap <C-w>E :SyntasticToggleMode<Return>

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

" ----------------------------------------------------------
" netrw [file explorer]
" ----------------------------------------------------------

" Toggle Vexplore with Ctrl-E
function! ToggleVExplorer()	
	if exists("t:expl_buf_num")
		let expl_win_num = bufwinnr(t:expl_buf_num)
		if expl_win_num != -1
			let cur_win_nr = winnr()
			exec expl_win_num . 'wincmd w'
			close
			exec cur_win_nr . 'wincmd w'
			unlet t:explo_buf_num
		else
			unlet t:expl_buf_num
		endif
	else
		exec '1wincmd w'
		Vexplore
		let t:explo_buf_num = bufnr("%")
	endif
endfunction
map <silent> <C-E> :call ToggleVExplorer()<CR>

" Hit enter in the file browser to open the selected
" file with :vplits to the right of the browser
let g:netr_browse_split = 4
let g:netrw_altv = 1

" Default to tree mode
let g:netrw_liststyle=3

" Change directory to the current buffer when opening files
set autochdir

" --------------------------------------------------------
" Thematic dictionaries
" [doesn't work with puTTY]
" --------------------------------------------------------

" let g:thematic#themes = {
" \ 'bubblegum' : {
" \				},
" \'jellybeans' : {'laststatus': 2,
" \				'ruler' : 0,
" \				'airline-theme' : '',
" \				'number-column-color-mute' : 2,
" \				},
" \'pencil_dark' : {'colorscheme' : 'pencil',
" \				'background' : 'dark',
" \				'airline-theme' : 'badwold',
" \				'ruler' : 1,
" \				},
" \'pencil_lite' : {'colorscheme' : 'pencil',
" \				'background' : 'light',
" \				'airline-theme' : 'badwolf',
" \				'ruler' : 1,
" \				},
" \'solarized' : {'background' : 'dark',
" \				'ruler' : 1,
" \				},
" \}
