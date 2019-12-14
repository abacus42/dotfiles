if exists('g:repl')
    let singular_repl = {'bin': 'Singular', 'args': [], 'syntax': '', 'title': 'Singular REPL'}
    call repl#define_repl('singular', singular_repl, 'force')
endif
