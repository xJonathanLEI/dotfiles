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
nnoremap <S-A-s> :CocList grep<cr>
inoremap <S-A-s> <c-o>:CocList grep<cr>
