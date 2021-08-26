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

nnoremap  <C-f>      <cmd>Telescope buffers sort_lastused=true<cr>
map       <C-n>      <cmd>Telescope file_browser sort_lastused=true<cr>
map       <C-p>      <cmd>Telescope oldfiles include_current_session=True<cr>
nnoremap  <leader>ff <cmd>Telescope find_files sort_lastused=true<cr>
nnoremap  <leader>fc <cmd>Telescope current_buffer_fuzzy_find<cr>
nnoremap  <leader>fp <cmd>Telescope oldfiles<cr>
nnoremap  <leader>fs <cmd>Telescope live_grep<cr>
xnoremap  <leader>fs <cmd>Telescope grep_string<cr>
nnoremap  <leader>fh <cmd>Telescope help_tags<cr>
nnoremap  <leader>fn <cmd>Telescope find_files cwd=~/Documents/Notes<cr>
nnoremap  <leader>fd <cmd>Telescope lsp_workspace_diagnostics<cr>
nnoremap  gD         <cmd>Telescope lsp_implementations jump_type=never<cr>
nnoremap  gd         <cmd>Telescope lsp_definitions jump_type=never<cr>
nnoremap  gr         <cmd>Telescope lsp_references<cr>
" Resize with ,,r
nnoremap  <leader>r  <cmd>GoldenRatioResize<cr>
" LSP Settings
nnoremap  K          <cmd>lua vim.lsp.buf.hover()<cr>
nnoremap  <C-l>      <cmd>lua vim.lsp.buf.signature_help()<cr>
nnoremap <space>wa   <cmd>lua vim.lsp.buf.add_workspace_folder()<cr>
nnoremap <space>wr   <cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>
nnoremap <space>wl   <cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>
nnoremap <space>D    <cmd>lua vim.lsp.buf.type_definition()<cr>
nnoremap <space>rn   <cmd>lua vim.lsp.buf.rename()<cr>
nnoremap <space>ca   <cmd>lua vim.lsp.buf.code_action()<cr>

imap <C-o>         <Plug>(completion_trigger)
" preserve my pinkies health by using ; for :
nnoremap ; :
