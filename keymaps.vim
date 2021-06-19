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

" Don't jump to first match
cnoreabbrev Ack Ack!
" Bind Ack to Ctrl+S
nnoremap <C-s> :Ack!<Space>
" Run file with F9
noremap <F9> :!%:p<ENTER>

" LSP Settings
" Set in plugins.vim
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
nnoremap <C-f> <cmd>Telescope buffers sort_lastused=true<cr>
inoremap <C-f> <cmd>Telescope find_files sort_lastused=true<cr>
map <C-n> <cmd>Telescope find_files sort_lastused=true<cr>
map <C-p> <cmd>Telescope oldfiles sort_lastused=true<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fc <cmd>Telescope current_buffer_fuzzy_find<cr>
nnoremap <leader>fp <cmd>Telescope oldfiles<cr>
nnoremap <leader>fs <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers sort_lastused=true<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>gD <cmd>Telescope lsp_implementations<cr>
nnoremap <leader>gd <cmd>Telescope lsp_definitions<cr>
nnoremap <leader>gr <cmd>Telescope lsp_references<cr>

imap <C-o> <Plug>(completion_trigger)

" preserve my pinkies health by using ; for :
nnoremap ; :
