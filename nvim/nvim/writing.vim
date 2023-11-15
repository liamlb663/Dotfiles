let g:write_mode_enabled = 0

function! WriteModeToggle()
  if g:write_mode_enabled
    " If write mode is enabled, disable it
    let g:write_mode_enabled = 0
    Goyo
    NoPencil
  else
    " If write mode is not enabled, enable it
    let g:write_mode_enabled = 1
    Goyo
    SoftPencil
  endif
endfunction

command! -nargs=0 WriteModeToggle call WriteModeToggle()
