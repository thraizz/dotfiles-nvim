map <ESC> <ESC>:noh<CR>
" Escape from insertmode with jj
imap jj <ESC>:noh<CR>
" preserve my pinkies health by using ; for :
nnoremap ; :

" Navigate with Ctrl+h,j,k,l
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

" Reduce tab width with shift tab
nnoremap <S-Tab> <<

" Run file with F9
noremap <F9> :!%:p<ENTER>

" Telescope commands start with ,f
nnoremap  <C-d>      <cmd>Telescope buffers sort_lastused=true sort_mru=true<cr>
nnoremap  <C-f>      <cmd>Telescope oldfiles cwd_only=true sort_lastused=true<cr>
map       <C-n>      <cmd>Telescope file_browser sort_lastused=true cwd=%:p:h<cr>
map       <C-p>      <cmd>Telescope oldfiles include_current_session=true<cr>
nnoremap  <leader>ff <cmd>Telescope find_files sort_lastused=true<cr>
xnoremap  <leader>ff y<cmd>Telescope find_files<cr><c-r>"
nnoremap  <leader>fc <cmd>Telescope current_buffer_fuzzy_find<cr>
nnoremap  <leader>fp <cmd>Telescope oldfiles<cr>
nnoremap  <leader>fs <cmd>Telescope live_grep<cr>
xnoremap  <leader>fs y<cmd>Telescope live_grep<cr><c-r>"
nnoremap  <leader>ft <cmd>Telescope live_grep<cr>FIXME\|TODO
nnoremap  <leader>fh <cmd>Telescope help_tags<cr>
nnoremap  <leader>fn <cmd>Telescope find_files cwd=~/Documents/Notes<cr>
nnoremap  <leader>fd <cmd>lua require'telescope.builtin'.lsp_workspace_diagnostics(require('telescope.themes').get_dropdown({layout_config = {width=0.9}}), {line_width=100})<cr>
nnoremap  <leader>fm <cmd>Telescope marks<cr>
nnoremap  <leader>fl <cmd>Telescope jumplist<cr>

" LSP Commands start with ,l
nnoremap  <leader>lD <cmd>Telescope lsp_implementations jump_type=never<cr>
nnoremap  <leader>ld <cmd>Telescope lsp_definitions jump_type=never<cr>
nnoremap  <leader>ls <cmd>Telescope lsp_document_symbols jump_type=never<cr>
nnoremap  <leader>lw <cmd>Telescope lsp_dynamic_workspace_symbols jump_type=never<cr>
xnoremap  <leader>lw y<cmd>Telescope lsp_workspace_symbols query=<c-r>"<cr>
nnoremap  <leader>lr <cmd>Telescope lsp_references<cr>
nnoremap  K          <cmd>lua vim.lsp.buf.hover()<cr>

" Git commands start with ,g
nnoremap  <leader>gs  <cmd>vertical Git<cr>
nnoremap  <leader>gd  <cmd>vertical Gdiffsplit<cr>
nnoremap  <leader>gfa <cmd>Git fetch --all<cr>
nnoremap  <leader>gc   <cmd>Git commit -v<cr>
nnoremap  <leader>ga   <cmd>Git add %<cr>
" Jump between merge conflicts with F8
map <silent> <F8> /^\(<\{7\}\\|>\{7\}\\|=\{7\}\\|\|\{7\}\)\( \\|$\)<cr>

