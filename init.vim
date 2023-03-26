" Welcome message
echo "¯\\_(ツ)_/¯"

" editor basic setup
set number
set relativenumber
set encoding=utf-8  " The encoding displayed.
set fileencoding=utf-8  " The encoding written to file.
set termencoding=utf-8

" set column highlight
highlight ColorColumn ctermbg=gray
set colorcolumn=80

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#fugitiveline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1
let g:coc_global_extensions = ['coc-json', 'coc-git','coc-css', 'coc-angular', 'coc-cmake', 'coc-eslint', 'coc-flutter', 'coc-go', 'coc-html', 'coc-java', 'coc-markdownlint', 'coc-psalm', 'coc-php-cs-fixer', 'coc-rls', 'coc-solargraph', 'coc-sql', 'coc-xml', 'coc-rust-analyzer', 'coc-phpls', 'coc-sh', 'coc-lists', 'coc-yaml', 'coc-explorer', 'coc-tsserver']
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
colorscheme papercolor
set background=light

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
      \ } 

let g:which_key_map['t'] = {
      \ 'name' : '+toggle' ,
      \ 'n' : [':set number! <bar> :set relativenumber!'     , 'line-number'],
      \ 'w' : [':set list!', 'whitespace'],
      \ 'h' : [':set hlsearch!', 'highlight'],
      \}

let g:which_key_map['d'] = {
    \ 'name' : '+diagnostics' ,
    \ 'a' : [':CocList diagnostics', 'diagnostics-all'],
    \ 'n' : ['<Plug>(coc-diagnostic-next)<cr>', 'diagnostics-next'],
    \ 'p' : ['<Plug>(coc-diagnostic-prev)<cr>', 'diagnostics-previous'],
    \ 'f' : ['<Plug>(coc-fix-current)<cr>', 'fix-current-line'],
    \}

let g:which_key_map['j'] = {
    \ 'name' : '+jump/goto' ,
    \ 'd' : ['<Plug>(coc-definition)<cr>', 'goto-definition'],
    \ 't' : ['<Plug>(coc-type-definition)<cr>', 'goto-type-definition'],
    \ 'r' : ['<Plug>(coc-references)<cr>', 'goto-references'],
    \ 'i' : ['<Plug>(coc-implementation)<cr>', 'goto-implementation'],
    \ 'p' : ['<C-o><cr>', 'jump-previous'],
    \}

let g:which_key_map['g'] = {
    \ 'name' : '+git' ,
    \ 'p' : ['<Plug>(coc-git-prevchunk)', 'git-previous-chunk'],
    \ 'n' : ['<Plug>(coc-git-nextchunk)', 'git-next-chunk'],
    \ 'o' : ['<Plug>(coc-git-chunkinfo)', 'git-chunk-info'],
    \ 'u' : [':CocCommand git.chunkUndo', 'git-chunk-undo'],
    \ 'D' : [':CocCommand git.diffCached', 'git-diff-cached'],
    \ 'S' : [':CocCommand git.chunkStage', 'git-chunk-stage'],
    \ 'B' : [':Git blame', 'Git blame'],
    \ 'd' : [':Git diff', 'Git difference'],
    \ 'C' : [':Git checkout', 'Git checkout'],
    \ 'b' : [':Git branch', 'Git branch'],
    \ 'a' : [':Git add', 'Git add'],
    \ 'c' : [':Git commit', 'Git commit'],
    \ 's' : [':Gstatus', 'Git status'],
    \}

let g:which_key_map['s'] = {
    \ 'name' : '+selection' ,
    \ 'f' : ['<Plug>(coc-format-selected)<cr>', 'format'],
    \}

let g:which_key_map['f'] = {
    \ 'name' : '+file' ,
    \ 'o' : [':CocList outline', 'outline'],
    \ 'v' : {'name' : '+vim', 'e' : [':vsplit $MYVIMRC', 'edit'], 's' : [':source $MYVIMRC' , 'source']}
    \}

let g:which_key_map['i'] = {
    \ 'name' : '+Intellisense-action' ,
    \ 'n' : [':CocNext', 'next'],
    \ 'p' : [':CocPrev', 'previous'],
    \ 'r' : [':CocListResume', 'resume'],
    \}

let g:which_key_map['p'] = {
    \ 'name' : '+project' ,
    \ 'e' : [':CocCommand explorer', 'explorer'],
    \ 'f' : [':CocList files', 'find files'],
    \ 's' : [':CocList grep', 'search'],
    \ 'p' : [':SSave', 'Save project'],
    \ 'l' : [':SLoad', 'Load project']
    \}

let g:which_key_map['b'] = {
    \ 'name' : '+buffers' ,
    \ 'l' : [':ls', 'list'],
    \ 'd' : [':bd', 'drop'],
    \ 'n' : [':bn', 'next'],
    \ 'p' : [':bp', 'previous'],
    \ 'o': [':%bd|e#|bd#', 'drop others'],
    \ 'a': [':%bd', 'drop all'],
    \}

let g:which_key_map['q'] = {
    \ 'name' : '+quick' ,
    \ 'n' : [':e ~/Documents/vim/quicknotes.txt', 'notes'],
    \}


map <tab> :bn<cr>
map <S-tab> :bp<cr>

nnoremap <silent> <leader>K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

let g:which_key_map['K'] = "show-documentation"

" Move cursor to start and end of line
nnoremap H 0
nnoremap L $

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Abbreviations
iabbrev @@ verma.neeraj.in@gmail.com
iabbrev teh the
iabbrev waht what
iabbrev fnp public function() {}
iabbrev fnpv private function() {}

" Startify screen
" " returns all modified files of the current git repo
" `2>/dev/null` makes the command fail quietly, so that when we are not
" in a git repo, the list will be empty
function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_lists = [
        \ { 'type': 'sessions',  'header': ['   Projects']       },
        \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
        \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
        \ { 'type': 'files',     'header': ['   Files']            },
        \ { 'type': 'dir',       'header': ['   Current directory '. getcwd()] },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]

call plug#begin()
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'morhetz/gruvbox'
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'NLKNguyen/papercolor-theme'
Plug 'tpope/vim-fugitive'
Plug 'editorconfig/editorconfig-vim'
call plug#end()
