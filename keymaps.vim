map <ESC> <ESC>:noh<cr>
" Escape from insertmode with jj
imap jj <ESC>:noh<cr>

noremap <F4> <cmd>FocusMaxOrEqual<cr>
" Run file with F9
noremap <F9> :!%:p<cr>
" preserve my pinkies health by using ; for :
" nnoremap ; :

" Jump to config
nnoremap  <leader>; <cmd>vs ~/.config/nvim/init.vim<cr>

" Telescope
"" Show keymaps
nnoremap  <leader><leader> <cmd>Telescope keymaps<cr>
"" NvimTree / nnn
nnoremap  <leader>N  <cmd>NvimTreeFindFileToggle<cr>
nnoremap  <leader>nn  <cmd>NnnPicker<cr>
"" Show [f]iles
nnoremap  <leader>fd <cmd>Telescope buffers <cr>
nnoremap  <leader>fo <cmd>Telescope oldfiles cwd_only=true include_current_session=true<cr>
nnoremap  <leader>fO <cmd>Telescope oldfiles cwd_only=true include_current_session=true<cr>
nnoremap  <leader>ff <cmd>Telescope find_files sort_lastused=true hidden=true<cr>
xnoremap  <leader>ff y<cmd>Telescope find_files<cr><c-r>"
nnoremap  <leader>fc <cmd>Telescope current_buffer_fuzzy_find<cr>
nnoremap  <leader>fp <cmd>Telescope frecency workspace=CWD theme=ivy <cr>
nnoremap  <leader>fP <cmd>Telescope frecency<cr>
nnoremap  <leader>fs <cmd>Telescope live_grep grep_open_files=true theme=ivy<cr>
nnoremap  <leader>fS <cmd>Telescope live_grep<cr>
xnoremap  <leader>fs <cmd>Telescope grep_string<cr>
nnoremap  <leader>fh <cmd>Telescope help_tags<cr>
nnoremap  <leader>fn <cmd>Telescope file_browser path=%:p:h<cr>
nnoremap  <leader>fN <cmd>Telescope file_browser<cr>
nnoremap  <leader>fm <cmd>Telescope marks<cr>
nnoremap  <leader>fl <cmd>Telescope jumplist<cr>
"" [l]sp stuff
nnoremap  <A-Cr> <cmd>lua vim.lsp.buf.code_action()<cr>
nnoremap  <leader>lfd <cmd>Telescope diagnostics<cr>
nnoremap  <leader>lD <cmd>Telescope lsp_definitions jump_type=never theme=cursor<cr>
nnoremap  <leader>ls <cmd>Telescope lsp_document_symbols theme=cursor jump_type=never<cr>
nnoremap  <leader>lw <cmd>Telescope lsp_document_symbols<cr>
nnoremap  <leader>lW <cmd>Telescope lsp_dynamic_workspace_symbols jump_type=never<cr>
xnoremap  <leader>lw y<cmd>Telescope lsp_workspace_symbols cursor query=<c-r>"<cr>
nnoremap  K          <cmd>lua vim.lsp.buf.hover()<cr>
nnoremap  <leader>lr <cmd>Telescope lsp_references<cr>
"" [d]iagnostics
nnoremap  <leader>dn <cmd>lua vim.diagnostic.goto_next({severity={min=vim.diagnostic.severity.WARN}})<cr>zz
nnoremap  <leader>dN <cmd>lua vim.diagnostic.goto_prev({severity={min=vim.diagnostic.severity.WARN}})<cr>zz

"" [g]it stuff
nnoremap  <leader>gs  <cmd>Git<cr>
nnoremap  <leader>gd  <cmd>vertical Gdiffsplit<cr>
nnoremap  <leader>gfa <cmd>Git fetch --all<cr>
nnoremap  <leader>gCm  <cmd>Git checkout main<cr>
nnoremap  <leader>gc  <cmd>Git commit -v<cr>
nnoremap  <leader>ga  <cmd>Git add %<cr>
nnoremap  <leader>gp  <cmd>Git push<cr>
nnoremap  <leader>gP  <cmd>Git pull --ff-only<cr>
nnoremap  <leader>gb  <cmd>Telescope git_branches<cr>
nnoremap  <leader>gl  <cmd>GV<cr>
nnoremap  <leader>gro <cmd>Git rebase -i origin/main<cr>
"" Commentary
nnoremap  <C-_>       <cmd>Commentary<cr>
vnoremap  <C-_>       <Plug>Commentary<cr>
"" [r]eact stuff
vnoremap <leader>re   <cmd>lua require("react-extract").extract_to_new_file()<cr>
vnoremap <leader>rc   <cmd>lua require("react-extract").extract_to_current_file()<cr>
"" [t]ypescript stuff
nnoremap <leader>ta   <cmd>lua require("typescript").actions.addMissingImports()<cr>
nnoremap <leader>tf   <cmd>lua require("typescript").actions.fixAll()<cr>
nnoremap <leader>td   <cmd>lua require("typescript").actions.removeUnused()<cr>
nnoremap <leader>tr   <cmd>lua vim.lsp.buf.rename()<cr>


" Jump between merge conflicts with F8
map <F8> /^\(<\{7\}\\|>\{7\}\\|=\{7\}\\|\|\{7\}\)\( \\|$\)<cr>

