:- initialization(main).

:- include('solver.pl').
:- include('puzzles.pl').

main :-
    between(1, 6, ID),
    puzzle(ID, Rows, Cols, Blacks),
    format("~n=== Puzzle ~w ===~n", [ID]),
    get_time(T0),
    solve(Rows, Cols, Blacks),
    get_time(T1),
    Elapsed is (T1 - T0) * 1000,
    maplist(writeln, Rows),
    format("Tempo: ~2f ms~n", [Elapsed]),
    fail.
main.