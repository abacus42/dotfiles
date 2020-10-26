if exists('g:repl')
    let gap_repl = {'bin': 'sage', 'args': [], 'syntax': '', 'title': 'Sage REPL'}
    call repl#define_repl('gap', gap_repl, 'force')
endif
