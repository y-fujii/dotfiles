vim9script

def g:Complete(): string
	const x = col(".") - 1
	return x > 0 && getline(".")[x - 1] =~ "[0-9a-zA-Z_]" ? "\<c-n>" : "\<tab>"
enddef

g:eskk#large_dictionary = { "path": "/usr/share/skk/SKK-JISYO.L" }
g:mapleader = " "

set autowrite
set backspace=indent,eol
set breakindent
set cinoptions=(1s,u1s,m1
set completeopt^=longest
set fillchars=eob:\ ,vert:│
set grepprg=rg\ --vimgrep
set scrolloff=4
set shiftwidth=4
set t_Co=8
set tabstop=4
set wildmenu
set wildmode^=longest:full
set wildoptions^=pum

noremap Y y$
noremap U <c-r>
noremap <leader>m :make<cr>
noremap <leader>t :make! test<cr>
noremap <leader>r :make! run<cr>
inoremap <silent> <tab> <c-r>=g:Complete()<cr>

autocmd bufreadpost * normal g`"
autocmd quickfixcmdpost * cwindow | set nowrap

filetype plugin indent on
syntax enable

highlight vertsplit cterm=none
highlight statusline ctermfg=0
highlight statuslinenc ctermfg=0
highlight pmenu cterm=reverse ctermfg=0 ctermbg=none
highlight pmenusel cterm=reverse ctermfg=4 ctermbg=none

if filereadable("Cargo.toml") || filereadable("../Cargo.toml")
	compiler! cargo
	set makeprg=RUST_BACKTRACE=1\ cargo\ $*
	noremap <leader>m :make build<cr>
	noremap <leader>R :make! run --release<cr>
	noremap <leader>T :make! test -- --test-threads=1 --nocapture<cr>
elseif filereadable("build.ninja")
	set makeprg=ninja
endif
