if exists('g:repl')
    let prolog_repl = {'bin': 'gprolog', 'args': [], 'syntax': '', 'title': 'Prolog REPL'}
    call repl#define_repl('prolog', prolog_repl, 'force')
endif
