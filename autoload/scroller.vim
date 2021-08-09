
function! scroller#up(distance, delay)
  call s:scroll(1, a:distance, a:delay)
endfunction

function! scroller#down(distance, delay)
  call s:scroll(0, a:distance, a:delay)
endfunction

function! s:scroll(up, distance, delay)

  " is the cursor bottom or top of the screen
  let top = 0
  let bottom = 0

  if winline() == 1
    let top = 1
  elseif winline() == winheight(0)
    let bottom = 1
  endif

  let keypress = ''
  for count in range(1, a:distance, 1)

    " break out of the loop if any key is pressed during the scroll
    let keypress = getchar(1)
    if keypress != ''
      break
    endif

    " this delay is necesarry to make it look smooth
    exec 'sleep! ' . a:delay . 'm'

    if a:up
      if top
        execute "normal! \<C-Y>"
        execute 'normal! k'
      else
        execute 'normal! k'
        execute "normal! \<C-Y>"
      endif
    else
      if bottom
        execute "normal! \<C-E>"
        execute 'normal! j'
      else
        execute 'normal! j'
        execute "normal! \<C-E>"
      endif
    endif

    " vim doens't update the screen unless necesarry
    " this forces it to update every time it moves
    redraw
  endfor

  " re-execute the keypress
  exec 'normal ' . keypress
endf
