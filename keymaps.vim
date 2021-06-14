" Escape from insertmode with jj
imap jj <ESC>:noh<CR>
" Show current files in Buffer with Ctrl+f,
" also cycle through ctrl-p with repeated keystroke
map <C-f> :CtrlPBuffer<CR>
" Show NERDTree with Ctrl+n
map <C-n> :NERDTreeToggle<CR>
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
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


imap <C-o> <Plug>(completion_trigger)

" preserve my pinkies health by using ; for :
nnoremap ; :
