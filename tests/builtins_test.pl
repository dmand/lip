:- begin_tests(builtins).
:- use_module(src/builtins).

test('(+ 0)') :-
    apply(builtin(+), [number_lit(0)], number_lit(0)), !.

test('(+ 1 2 3 4)') :-
    apply(builtin(+),
	  [number_lit(1),
	   number_lit(2),
	   number_lit(3),
	   number_lit(4)
	  ],
	  number_lit(10)), !.

test('(= 1 1 1 2)') :-
    apply(builtin(=),
	  [
	   number_lit(1),
	   number_lit(1),
	   number_lit(1),
	   number_lit(2)
	  ],
	  boolean_lit(false)), !.

test('(= 0 0)') :-
    apply(builtin(=),
	  [
	   number_lit(0),
	   number_lit(0)
	  ],
	  boolean_lit(true)), !.

test('(- 5)') :-
    apply(builtin(-),
	  [number_lit(5)],
	  number_lit(-5)), !.

test('(- 10 1 2 3 4)') :-
    apply(builtin(-),
	  [
	   number_lit(10),
	   number_lit(1),
	   number_lit(2),
	   number_lit(3),
	   number_lit(4)
	  ],
	  number_lit(0)), !.

test('(* 1 2 3 4 5)') :-
    apply(builtin(*),
	  [
	   number_lit(1),
	   number_lit(2),
	   number_lit(3),
	   number_lit(4),
	   number_lit(5)
	  ],
	  number_lit(120)), !.

test('(/ 30 3)') :-
    apply(builtin(/),
	  [
	      number_lit(30),
	      number_lit(3)
	  ],
	  number_lit(10)), !.

test('(list 1 2 3)') :-
    apply(builtin(list),
	  [number_lit(1), number_lit(2), number_lit(3)],
	  list_lit([number_lit(1), number_lit(2), number_lit(3)])), !.

test('(cons 1 #nil)') :-
    apply(builtin(cons),
	  [number_lit(1), nil_lit],
	  list_lit([number_lit(1)])), !.

test('(car (list 1 2))') :-
    apply(builtin(car),
	  [list_lit([number_lit(1), number_lit(2)])],
	  number_lit(1)), !.

test('(cdr (list 1 2))') :-
    apply(builtin(cdr),
	  [list_lit([number_lit(1), number_lit(2)])],
	  list_lit([number_lit(2)])), !.

test('(cdr (list 1))') :-
    apply(builtin(cdr),
	  [list_lit([number_lit(1)])],
	  nil_lit), !.

test('(read "(+ 1 2)")') :-
    apply(builtin(read),
	  [string_lit("(+ 1 2)")],
	  sexpression([id("+"), number_lit(1), number_lit(2)])), !.

test('(< 3 5 7)') :-
    apply(builtin(<),
	  [number_lit(3),
	   number_lit(5),
	   number_lit(7)],
	  boolean_lit(true)), !.

test('(> 7 5 3)') :-
    apply(builtin(>),
	  [number_lit(7),
	   number_lit(5),
	   number_lit(3)],
	  boolean_lit(true)), !.

:- end_tests(builtins).
