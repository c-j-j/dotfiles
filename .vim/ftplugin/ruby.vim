"Rspec mappings
map <Leader>rt :wa<CR>:call VimuxRunCommand("clear; bundle exec rspec " . bufname("%"))<CR>
map <Leader>ra :wa<CR>:call VimuxRunCommand("clear; bundle exec rspec")<CR>
map <Leader>rs :wa<CR>:call VimuxRunCommand("clear; bundle exec rspec " . bufname("%") . ":" . line("."))<CR>
