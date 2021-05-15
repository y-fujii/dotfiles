if !has("nvim")
	source $VIMRUNTIME/defaults.vim
	set t_Co=8
endif

let g:eskk#large_dictionary = { "path": "/usr/share/skk/SKK-JISYO.L" }

call plug#begin("~/.vim-plugged")
Plug 'junegunn/goyo.vim'
Plug 'tyru/eskk.vim'
Plug 'rust-lang/rust.vim'
call plug#end()

function Complete()
	let x = col(".") - 1
	if x != 0 && getline(".")[x - 1] =~ "[a-zA-Z_]"
		return "\<c-p>"
	else
		return "\<tab>"
	endif
endfunction

inoremap <silent> <tab> <c-r>=Complete()<cr>
noremap Y y$
noremap U <c-r>
noremap zm :make<cr>
noremap zt :make! test<cr>
noremap zr :make! run<cr>
noremap zd ggO<esc>:0read !cargo run -q --bin=date<cr>A
noremap zl :!cargo run -q --bin=link<cr>

set autowrite
set breakindent
set laststatus=1
set grepprg=rg\ --vimgrep

autocmd bufreadpost * normal g`"
autocmd quickfixcmdpost * cwindow | set nowrap

if filereadable("Cargo.toml")
	compiler cargo
	noremap zm :make build<cr>
	noremap zR :make! run --release<cr>
endif

highlight clear vertsplit
highlight clear statusline
highlight clear statuslinenc
highlight vertsplit ctermfg=0
highlight statusline cterm=reverse,bold ctermfg=0
highlight statuslinenc cterm=reverse ctermfg=0
