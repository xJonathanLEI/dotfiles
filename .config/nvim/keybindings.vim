" Alt + Shift + F for formatting
nnoremap <S-A-f> :Format<cr>
inoremap <S-A-f> <c-o>:Format<cr>

" Ctrl + S for saving
nnoremap <c-s> :w<cr>
inoremap <c-s> <c-o>:w<cr>

" Ctrl + B for toggling NERDTree
nnoremap <c-b> :NERDTreeToggle<cr>
inoremap <c-b> <c-o>:NERDTreeToggle<cr>

" // for searching selected text
vnoremap // y/\V<c-r>=escape(@",'/\')<cr><cr>

" Ctrl + F for line search
nnoremap <C-f> :CocList lines<cr>
inoremap <C-f> <c-o>:CocList lines<cr>

" Alt + Shift + S for file search
nnoremap <S-A-s> :Telescope live_grep<cr>
inoremap <S-A-s> <c-o>:Telescope live_grep<cr>

" Ctrl + A for select all
nnoremap <C-a> ggVG<cr>
inoremap <C-a> <c-c>ggVG<cr>

" Esc for exiting terminal mode
tnoremap <Esc> <C-\><C-n>

" Ctrl + X for cutting one line
nnoremap <C-x> dd
inoremap <C-x> <c-o>dd

" Alt + Up for moving line upward
nnoremap <A-Up> ddkP
inoremap <A-Up> <c-o>dd<Up><c-o>P

" Alt + K for moving line upward
nnoremap <A-k> ddkP
inoremap <A-k> <c-o>dd<Up><c-o>P

" Alt + Down for moving line downward
nnoremap <A-Down> ddjP
inoremap <A-Down> <c-o>dd<Down><c-o>P

" Alt + J for moving line upward
nnoremap <A-j> ddjP
inoremap <A-j> <c-o>dd<Down><c-o>P
