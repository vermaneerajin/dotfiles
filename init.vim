" Welcome message
echo "¯\\_(ツ)_/¯"

" editor basic setup
set number
set relativenumber
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
set list
set listchars=tab:→\→,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

" Coc settings
set hidden
set nobackup
set nowritebackup
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" color scheme
colorscheme gruvbox

" leader and keybindings
let g:mapleader = "\<Space>" 

" move line down
nnoremap m ddp
" move line up
nnoremap <S-m> ddkkp

" which key popup
autocmd! User vim-which-key call which_key#register('<Space>', 'g:which_key_map')
let g:which_key_map =  {}
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
set timeoutlen=300
" Define prefix dictionary
let g:which_key_map['w'] = {
      \ 'name' : '+windows' ,
      \ 'w' : ['<C-W>w'     , 'other-window']          ,
      \ 'd' : ['<C-W>c'     , 'delete-window']         ,
      \ '-' : ['<C-W>s'     , 'split-window-below']    ,
      \ '|' : ['<C-W>v'     , 'split-window-right']    ,
      \ '2' : ['<C-W>v'     , 'layout-double-columns'] ,
      \ 'h' : ['<C-W>h'     , 'window-left']           ,
      \ 'j' : ['<C-W>j'     , 'window-below']          ,
      \ 'l' : ['<C-W>l'     , 'window-right']          ,
      \ 'k' : ['<C-W>k'     , 'window-up']             ,
      \ 'H' : ['<C-W>20<'   , 'expand-window-left']    ,
      \ 'e' : [':vertical resize +20', 'expand-window']   ,
      \ 'L' : ['<C-W>20>'    , 'expand-window-right']   ,
      \ '=' : ['<C-W>='     , 'balance-window']        ,
      \ 's' : ['<C-W>s'     , 'split-window-below']    ,
      \ 'v' : ['<C-W>v'     , 'split-window-below']    ,
      \ '?' : ['Windows'    , 'fzf-window']           ,
      \ } 

let g:which_key_map['t'] = {
      \ 'name' : '+toggle' ,
      \ 'n' : [':set number! <bar> :set relativenumber!'     , 'line-number'],
      \}

let g:which_key_map['d'] = {
    \ 'name' : '+diagnostics' ,
    \ 'a' : [':CocList diagnostics', 'diagnostics-all'],
    \ 'n' : ['<Plug>(coc-diagnostic-next)<cr>', 'diagnostics-next'],
    \ 'p' : ['<Plug>(coc-diagnostic-prev)<cr>', 'diagnostics-previous'],
    \ 'f' : ['<Plug>(coc-fix-current)<cr>', 'fix-current-line'],
    \}

let g:which_key_map['g'] = {
    \ 'name' : '+goto' ,
    \ 'd' : ['<Plug>(coc-definition)<cr>', 'definition'],
    \ 't' : ['<Plug>(coc-type-definition)<cr>', 'type-definition'],
    \ 'r' : ['<Plug>(coc-references)<cr>', 'references'],
    \ 'i' : ['<Plug>(coc-implementation)<cr>', 'implementation'],
    \}

let g:which_key_map['s'] = {
    \ 'name' : '+selection' ,
    \ 'f' : ['<Plug>(coc-format-selected)<cr>', 'format'],
    \}

let g:which_key_map['f'] = {
    \ 'name' : '+file' ,
    \ 'o' : [':CocList outline', 'outline'],
    \}

let g:which_key_map['i'] = {
    \ 'name' : '+Intellisense-action' ,
    \ 'n' : [':CocNext', 'next'],
    \ 'p' : [':CocPrev', 'previous'],
    \ 'r' : [':CocListResume', 'resume'],
    \}


nnoremap <silent> <leader>K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

call plug#begin()
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
Plug 'neoclide/coc.nvim'
Plug 'morhetz/gruvbox'
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
call plug#end()
