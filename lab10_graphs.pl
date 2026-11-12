% ARTI 401 - Lab 10: Graphs
% Task 1: find paths between cities (directed graph)

% ---------- Facts: edge(From, To) ----------
edge('Makkah', 'Madinah').
edge('Makkah', 'Riyadh').

edge('Madinah', 'Makkah').
edge('Madinah', 'Taif').
edge('Madinah', 'Tabuk').

edge('Taif', 'Dammam').
edge('Taif', 'Tabuk').

edge('Tabuk', 'Taif').

edge('Dammam', 'Qatif').
edge('Dammam', 'Riyadh').

edge('Qatif', 'Madinah').
edge('Qatif', 'Dammam').

edge('Riyadh', 'Dammam').

% ---------- Rules ----------
% travel(Start, Finish, Path)
travel(From, To, Path) :-
    path(From, To, [From], P),
    reverse(P, Path).

% path(From, To, Visited_List, Path_List)
path(X, X, P, P).
path(X, Y, Visited, Path) :-
    edge(X, Z),
    \+ member(Z, Visited),
    path(Z, Y, [Z|Visited], Path).
