set number
colorscheme desert
set omnifunc=syntaxcomplete#Complete
set completeopt=menuone,longest,popup
set mouse=n
" Auto-close brackets
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>

inoremap <expr> ) strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
inoremap <expr> ] strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"
inoremap <expr> } strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"

inoremap <expr> " strpart(getline('.'), col('.')-1, 1) == '"' ? "\<Right>" : (getline('.')[col('.')-2] =~ '\w' ? '"' : '""<Left>')
inoremap <expr> ' strpart(getline('.'), col('.')-1, 1) == "'" ? "\<Right>" : (getline('.')[col('.')-2] =~ '\w' ? "'" : "''<Left>")

inoremap {<CR> {<CR>}<Esc>O

" ---------- Backspace deletes both characters of an empty pair ----------
function! s:SmartBS() abort
  let l:line = getline('.')
  let l:col  = col('.')
  let l:prev = l:line[l:col - 2]
  let l:next = l:line[l:col - 1]
  let l:pairs = {'(': ')', '[': ']', '{': '}', '"': '"', "'": "'"}
  if has_key(l:pairs, l:prev) && l:pairs[l:prev] ==# l:next
    return "\<BS>\<Del>"
  endif
  return "\<BS>"
endfunction

inoremap <expr> <BS> <SID>SmartBS()
