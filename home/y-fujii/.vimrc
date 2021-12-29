if !has("nvim")
	source $VIMRUNTIME/defaults.vim
	set t_Co=8
endif

function Complete()
	let x = col(".") - 1
	return x > 0 && getline(".")[x - 1] =~ "[0-9a-zA-Z_]" ? "\<c-p>" : "\<tab>"
endfunction

set autowrite
set breakindent
set cinoptions=(1s,u1s,m1
set completeopt^=longest
set grepprg=rg\ --vimgrep
set laststatus=1
set shiftwidth=4
set tabstop=4
set wildmode^=longest:full
let g:mapleader = " "

noremap Y y$
noremap U <c-r>
noremap <leader>m :make<cr>
noremap <leader>t :make! test<cr>
noremap <leader>r :make! run<cr>
inoremap <silent> <tab> <c-r>=Complete()<cr>

autocmd bufreadpost * normal g`"
autocmd quickfixcmdpost * cwindow | set nowrap

if filereadable("Cargo.toml") || filereadable("../Cargo.toml")
	compiler! cargo
	noremap <leader>m :make build<cr>
	noremap <leader>R :make! run --release<cr>
elseif filereadable("build.ninja")
	set makeprg=ninja
endif

highlight vertsplit term=none cterm=none ctermfg=0
highlight statusline ctermfg=0
highlight statuslinenc ctermfg=0
highlight search term=reverse cterm=reverse ctermfg=4 ctermbg=none
highlight pmenu term=reverse cterm=reverse ctermfg=0 ctermbg=none
highlight pmenusel term=reverse cterm=reverse ctermfg=4 ctermbg=none

if isdirectory(expand("~/.vim-plugins"))
	set runtimepath^=~/.vim-plugins/yankround.vim
	set runtimepath^=~/.vim-plugins/eskk.vim
	let g:eskk#large_dictionary = { "path": "/usr/share/skk/SKK-JISYO.L" }

	nmap p <plug>(yankround-p)
	xmap p <plug>(yankround-p)
	nmap P <plug>(yankround-P)
	nmap gp <plug>(yankround-gp)
	xmap gp <plug>(yankround-gp)
	nmap gP <plug>(yankround-gP)
	nmap <c-p> <plug>(yankround-prev)
	nmap <c-n> <plug>(yankround-next)
endif

if filereadable(expand("~/.vimrc-ex"))
	source ~/.vimrc-ex
endif
