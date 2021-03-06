:- module(lisp, [repl/0, interp/1]).
:- use_module(gramma).
:- use_module(eval).
:- use_module(pretty).


read_expr(X) :-
    format(">>> "),
    read_line_to_codes(user_input, String),
    parse_repl(String, SyntaxTree),
    %format("Debug: parsed syntax tree ~w\n", [SyntaxTree]),
    %pretty:print(SyntaxTree, PrettyST),
    %format("Debug: parsed expression ~s\n", [PrettyST]),
    X = SyntaxTree.

print(X) :-
    pretty:print(X, Pretty),
    format("~s\n", [Pretty]).

repl :-
    read_expr(SyntaxTree),
    eval_safe(SyntaxTree, Result),
    print(Result),
    repl.

interp(Filename) :-
    atom_codes(FileAtom, Filename),
    read_file_to_codes(FileAtom, Content, []),
    parse_module(Content, SyntaxTree),
    eval_safe(SyntaxTree, _), !.
