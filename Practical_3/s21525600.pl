married(peter, mary).
married(lilly, joseph).
ownsPet(peter, rover).
ownsPet(mary, fluffy).
ownsPet(joseph, tweety).
ownsPet(lilly, fluffy).

household(X, Y) :- married(X, Y).
household(X, Y) :- married(Y, X).

householdPet(O1, O2, P) :- household(O1, O2), ownsPet(O1, P).
householdPet(O1, O2, P) :- household(O1, O2), ownsPet(O2, P).

wanderingPet(P) :- householdPet(O1, _, P), householdPet(O2, _, P), O1 \= O2.

addPositives([], 0).

addPositives([H|T], Sum) :-
    H > 0,
    addPositives(T, Rest),
    Sum is H + Rest.

addPositives([H|T], Sum) :-
    H =< 0,
    addPositives(T, Sum).

getEverySecondValue([], []).
getEverySecondValue([_], []).

getEverySecondValue([_, Second|Tail], [Second|Rest]) :-
getEverySecondValue(Tail, Rest).