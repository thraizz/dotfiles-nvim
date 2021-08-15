" Escape from insertmode with jj
imap jj <ESC>:noh<CR>
" Show current files in Buffer with Ctrl+f,
" Jump between merge conflicts with F8
map <silent> <F8> /^\(<\{7\}\\|>\{7\}\\|=\{7\}\\|\|\{7\}\)\( \\|$\)<cr>

" Navigate with Ctrl+h,j,k,l in insert mode
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

" Also navigate the same way through command mode
cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>

" Reduce tab width with shift tab
nnoremap <S-Tab> <<

" Run file with F9
noremap <F9> :!%:p<ENTER>

" LSP Settings
" Set in plugins.vim
nnoremap <C-f> <cmd>Telescope buffers sort_lastused=true<cr>
inoremap <C-f> <cmd>Telescope find_files sort_lastused=true<cr>
map <C-n> <cmd>Telescope file_browser sort_lastused=true<cr>
map <C-p> <cmd>Telescope oldfiles sort_lastused=true<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fc <cmd>Telescope current_buffer_fuzzy_find<cr>
nnoremap <leader>fp <cmd>Telescope oldfiles<cr>
nnoremap <leader>fs <cmd>Telescope live_grep<cr>
xnoremap <leader>fs <cmd>Telescope grep_string<cr>
nnoremap <leader>fg <cmd>Telescope grep_string<cr>
nnoremap <leader>fb <cmd>Telescope buffers sort_lastused=true<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap gD <cmd>Telescope lsp_implementations jump_type=never<cr>
nnoremap gd <cmd>Telescope lsp_definitions jump_type=never<cr>
nnoremap gr <cmd>Telescope lsp_references<cr>

imap <C-o> <Plug>(completion_trigger)

" preserve my pinkies health by using ; for :
nnoremap ; :
