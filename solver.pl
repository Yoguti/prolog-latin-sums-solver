:- use_module(library(clpfd)).

% solve(+Rows, +Cols, +BlackCells)
% Rows      : list of white-variable lists, one per grid row.

% cols cant be a transpose of rows, because white cells dont align across rows
% Cols      : list of white-variable lists, one per grid column.

% BlackCells: list of black(Sum, Neighbors), where Neighbors contains
%             all white variables orthogonally or diagonally adjacent
%             (8-neighborhood) to that black cell.


solve(Rows, Cols, BlackCells) :-
    % N = number of white cells per row (and per column)
    Rows = [FirstRow|_],
    length(FirstRow, N),

    % Set domain for all white variables
    append(Rows, AllVars),
    AllVars ins 1..N,

    % Every row has distinct values
    maplist(all_distinct, Rows),

    % Every column has distinct values
    maplist(all_distinct, Cols),

    % Every black cell equals the sum of its white 8-neighbors
    maplist(black_constraint, BlackCells),

    % Search
    label(AllVars).

black_constraint(black(Sum, Neighbors)) :-
    sum(Neighbors, #=, Sum).