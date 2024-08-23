vim.cmd([[
  let test#php#pest#executable = 'vendor/bin/pest'
  let test#php#pest#options = '--colors=always'

  function! FloatermStrategy(cmd)
    execute 'silent FloatermKill scratch'
    execute 'FloatermNew! --autoclose=2 --name=scratch '.a:cmd
  endfunction

  let g:test#custom_strategies = {'floaterm': function('FloatermStrategy')}
  let g:test#strategy = 'floaterm'
]])
