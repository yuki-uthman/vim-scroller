" Scroller - My custom scroller for vim
"
" Author: Yuki Yoshimine <yuki.uthman@gmail.com>
" Source: https://github.com/yuki-uthman/vim-scroller

if exists("g:loaded_scroller")
  finish
endif
let g:loaded_scroller = 1

let s:save_cpo = &cpo
set cpo&vim

let half_page_delay = get(g:, 'scroller_half_page_delay', 20)
let full_page_delay = get(g:, 'scroller_full_page_delay', 15)

nnoremap  <silent><Plug>(scroller-half-up)   :call scroller#up(&scroll, half_page_delay)<cr>
nnoremap  <silent><Plug>(scroller-half-down) :call scroller#down(&scroll, half_page_delay)<cr>
                                                                                                       
nnoremap  <silent><Plug>(scroller-full-up)   :call scroller#up(&scroll * 2, full_page_delay)<cr>
nnoremap  <silent><Plug>(scroller-full-down) :call scroller#down(&scroll * 2, full_page_delay)<cr>

if !exists("g:scroller_no_mappings") || ! g:scroller_no_mappings
  nmap <c-u> <Plug>(scroller-half-up)
  nmap <c-d> <Plug>(scroller-half-down)

  nmap <c-b> <Plug>(scroller-full-up)
  nmap <c-f> <Plug>(scroller-full-down)
endif


let &cpo = s:save_cpo
unlet s:save_cpo
