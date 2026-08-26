" GQL file type detection
" Maintainer: Geode Team
" Generated from language_metadata.zig

augroup filetypedetect
  autocmd BufRead,BufNewFile *.gql set filetype=gql
  autocmd BufRead,BufNewFile *.geode set filetype=gql
augroup END
