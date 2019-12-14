if exists('g:repl')
    let gap_repl = {'bin': 'gap', 'args': [], 'syntax': '', 'title': 'GAP REPL'}
    call repl#define_repl('gap', gap_repl, 'force')
endif
