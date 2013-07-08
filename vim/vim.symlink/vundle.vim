set nocompatible " be iMproved
filetype off     " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'

Bundle 'L9'
Bundle 'FuzzyFinder'

Bundle 'ack.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'myusuf3/numbers.vim'

Bundle 'altercation/vim-colors-solarized'
syntax enable
set background=dark
colorscheme solarized
let g:solarized_termcolors=256

Bundle 'airblade/vim-gitgutter'

Bundle 'kien/ctrlp.vim'
let g:ctrlp_map = '<Leader>t'
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
let g:ctrlp_working_path_mode = 'c'
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 'H'
let g:ctrlp_use_caching = 1
let g:ctrlp_show_hidden = 1

Bundle 'scrooloose/syntastic'
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_always_populate_loc_list = 1

Bundle 'Valloric/YouCompleteMe'
"let g:ycm_complete_in_comments = 1
"let g:ycm_collect_identifiers_from_comments_and_strings = 1
"let g:ycm_autoclose_preview_window_after_completion = 1

Bundle 'pangloss/vim-javascript'
Bundle 'leshill/vim-json'

Bundle 'nono/vim-handlebars'
Bundle 'digitaltoad/vim-jade'
Bundle 'othree/html5.vim'
"Bundle 'indenthtml.vim'

Bundle 'mutewinter/vim-tmux'
Bundle 'plasticboy/vim-markdown'
