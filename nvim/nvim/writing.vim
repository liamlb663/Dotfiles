let g:write_mode_enabled = 0

function! WriteModeToggle()
  if g:write_mode_enabled
    " If write mode is enabled, disable it
    let g:write_mode_enabled = 0
    Goyo
    set linebreak
  else
    " If write mode is not enabled, enable it
    let g:write_mode_enabled = 1
    Goyo
    set nolinebreak
  endif
endfunction

command! -nargs=0 WriteModeToggle call WriteModeToggle()

" disable header folding
let g:vim_markdown_folding_disabled = 1

" do not use conceal feature, the implementation is not so good
let g:vim_markdown_conceal = 0

" disable math tex conceal feature
let g:tex_conceal = ""
let g:vim_markdown_math = 1

" support front matter of various format
let g:vim_markdown_frontmatter = 1  " for YAML format
let g:vim_markdown_toml_frontmatter = 1  " for TOML format
let g:vim_markdown_json_frontmatter = 1  " for JSON format

" do not close the preview tab when switching to other buffers
let g:mkdp_auto_close = 0

nnoremap <C-m> :MarkdownPreview<CR>




