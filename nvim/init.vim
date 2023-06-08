" Load Impatient before anything else.
" Since this may fail if we're bootstrapping, we use a pcall.
lua pcall(require, 'impatient')

let mapleader=","
lua require('plugins')
lua require('settings')
lua require('keybindings')

let g:go_build_tags = "smoke integration"

" Source custom configs (not under version control).
if filereadable(glob("~/.vimrc.local"))
  source ~/.vimrc.local
endif

set clipboard+=unnamedplus

" Shortcut to edit THIS configuration file: (e)dit (c)onfiguration
nnoremap <silent> <leader>ec :e $MYVIMRC<CR>

" Shortcut to source (reload) THIS configuration file after editing it: (s)ource (c)onfiguraiton
nnoremap <silent> <leader>sc :source $MYVIMRC<CR>

