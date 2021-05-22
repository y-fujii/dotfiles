if !has("nvim")
	source $VIMRUNTIME/defaults.vim
	set t_Co=8
endif

set autowrite
set breakindent
set completeopt^=longest
set wildmode^=longest:full
set laststatus=1
set grepprg=rg\ --vimgrep
set runtimepath^=~/.vim-plugins/eskk.vim
set runtimepath^=~/.vim-plugins/goyo.vim
let g:eskk#large_dictionary = { "path": "/usr/share/skk/SKK-JISYO.L" }

function Complete()
	let x = col(".") - 1
	return x > 0 && getline(".")[x - 1] =~ "[a-zA-Z_]" ? "\<c-p>" : "\<tab>"
endfunction

inoremap <silent> <tab> <c-r>=Complete()<cr>
noremap Y y$
noremap U <c-r>
noremap zm :make<cr>
noremap zt :make! test<cr>
noremap zr :make! run<cr>

autocmd bufreadpost * normal g`"
autocmd quickfixcmdpost * cwindow | set nowrap

if filereadable("Cargo.toml") || filereadable("../Cargo.toml")
	compiler! cargo
	noremap zm :make build<cr>
	noremap zR :make! run --release<cr>
elseif filereadable("build.ninja")
	set makeprg=ninja
endif

highlight clear vertsplit
highlight clear pmenu
highlight clear pmenusel
highlight vertsplit ctermfg=0
highlight statusline ctermfg=0
highlight statuslinenc ctermfg=0
highlight pmenu cterm=reverse ctermfg=0
highlight pmenusel cterm=reverse ctermfg=4
