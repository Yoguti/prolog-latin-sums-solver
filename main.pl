:- initialization(main).

:- include('solver.pl').
:- include('puzzles.pl').

% cell width in characters
cell_width(6).

% print_cell(+Cell) - prints cells with padding
print_cell(w(Val)) :-
    cell_width(W),
    format(atom(S), "~w", [Val]),
    atom_length(S, L),
    Pad is W - L,
    forall(between(1, Pad, _), put_char(' ')),
    write(Val).
print_cell(b(Sum)) :-
    cell_width(W),
    format(atom(S), "[~w]", [Sum]),
    atom_length(S, L),
    Pad is W - L,
    forall(between(1, Pad, _), put_char(' ')),
    format("[~w]", [Sum]).

% print_grid(+Grid)
print_grid([]).
print_grid([Row|Rest]) :-
    maplist(print_cell, Row),
    nl,
    print_grid(Rest).

main :-
    between(1, 6, ID),
    puzzle(ID, Rows, Cols, Blacks, grid(NR, NC, Grid)),
    format("~n=== Puzzle ~w (~wx~w) ===~n", [ID, NR, NC]),
    get_time(T0),
    solve(Rows, Cols, Blacks),
    get_time(T1),
    Elapsed is (T1 - T0) * 1000,
    print_grid(Grid),
    format("Tempo: ~2f ms~n", [Elapsed]),
    fail.
main.