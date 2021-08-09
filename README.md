# vim-scroller 

The simplest smooth scroll plugin for neovim/vim.

The only thing it does is to fix the cursor in the same position relative to the 
window while scrolling.

For more extensive features check out:
  - [neoscroll](https://github.com/karb94/neoscroll.nvim)
  - [vim-smoothie](https://github.com/psliwka/vim-smoothie)
  - [comfortable-motion](https://github.com/yuttie/comfortable-motion.vim)


## Installation

With vim-plug:
```viml
Plug 'yuki-uthman/vim-scroller'
```

With vundle:
```viml
Plugin 'yuki-uthman/vim-scroller'
```

With minpac:
```viml
call minpac#add('yuki-uthman/vim-scroller')
```


## Configuration

By default this plugin overrides the two pairs of scroll motion with the 
following:
```viml
  nmap <C-U> <Plug>(scroller-half-up)
  nmap <C-D> <Plug>(scroller-half-down)

  nmap <C-B> <Plug>(scroller-full-up)
  nmap <C-F> <Plug>(scroller-full-down)
```

To disable the default mappings:
```viml
  let g:scroller_no_mappings = 1
```

Just use the same set of commands to remap to different keys:
```viml
  nmap <C-E> <Plug>(scroller-half-up)
  nmap <C-Y> <Plug>(scroller-half-down)

  nmap <C-J> <Plug>(scroller-full-up)
  nmap <C-K> <Plug>(scroller-full-down)
```
<br>
<br>

You can also customize the speed of the scroll for half-page and full-page 
separately. The larger the number the slower the speed. These are the default 
values:
```viml
  let g:scroller_half_page_delay = 20
  let g:scroller_full_page_delay = 15
```
<br>
<br>

If you want to scroll more pages you can make use of the autoload function.
For example if you want to scroll 2 pages you can get the height of the window 
with winheight(0) or &scroll * 2 and times that by 2. First argument is the 
number of lines to scroll and the second argument is the delay.
```viml
  nnoremap <silent> <C-B> :call scroller#up(&scroll * 4, 20)
  nnoremap <silent> <C-F> :call scroller#down(&scroll * 4, 20)
```

Or
```viml
  nnoremap <silent> <C-B> :call scroller#up(winheight(0) * 2, 20)
  nnoremap <silent> <C-F> :call scroller#down(winheight(0) * 2, 20)
```

## Licence

MIT Licence
