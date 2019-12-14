syn match gapComment "\(#.*\)*" contains=gapTodo,gapFunLine

" strings and characters
syn region gapString  start=+"+ end=+\([^\\]\|^\)\(\\\\\)*"+
syn match  gapString  +"\(\\\\\)*"+
syn match gapChar +'\\\=.'+
syn match gapChar +'\\"'+

" must do
syn keyword gapTodo TODO contained
syn keyword gapTodo XXX contained

" basic infos in file and folded lines
syn match gapFunLine '^#[FVOMPCAW] .*$' contained

syn keyword gapDeclare	DeclareOperation DeclareGlobalFunction
syn keyword gapDeclare  DeclareGlobalVariable
syn keyword gapDeclare	DeclareAttribute DeclareProperty
syn keyword gapDeclare	DeclareCategory DeclareFilter DeclareCategoryFamily
syn keyword gapDeclare	DeclareRepresentation DeclareInfoClass
syn keyword gapDeclare	DeclareCategoryCollections DeclareSynonym
syn keyword gapDeclare  MakeProperty MakeAttribute MakeOperation
syn keyword gapDeclare  MakeGlobalVariable MakeGlobalFunction

syn keyword gapMethsel	InstallMethod InstallOtherMethod NewType Objectify
syn keyword gapMethsel	NewFamily InstallTrueMethod
syn keyword gapMethsel  InstallGlobalFunction ObjectifyWithAttributes
syn keyword gapMethsel  BindGlobal BIND_GLOBAL InstallValue
syn keyword gapMethsel  NewMethod

syn keyword gapOperator	and div in mod not or

syn keyword gapFunction	function -> return local end Error
syn keyword gapConditional	if else elif then fi
syn keyword gapRepeat		do od for while repeat until
syn keyword gapOtherKey         Info Unbind IsBound

syn keyword gapBool         true false fail
syn match  gapNumber		"-\=\<\d\+\>\/"
syn match  gapListDelimiter	"[][]"
syn match  gapParentheses	"[)(]"
syn match  gapSublist	"[}{]"

hi link gapString                      String
hi link gapFunction                    Function
hi link gapDeclare                     Define
hi link gapMethsel                     Special
hi link gapOtherKey                    SpecialKey
hi link gapOperator                    Operator
hi link gapConditional                 Conditional
hi link gapRepeat                      Repeat
hi link gapComment                     Comment
hi link gapTodo                        Todo
hi link gapTTodoComment                gapTodo
hi link gapTodoComment                 gapTodo
hi link gapNumber                      Number
hi link gapBool                        Boolean
hi link gapChar                        Character
hi link gapListDelimiter               Delimiter
hi link gapParentheses                 gapListDelimiter
hi link gapSublist                     gapListDelimiters
hi link gapFunLine                     TabLine
