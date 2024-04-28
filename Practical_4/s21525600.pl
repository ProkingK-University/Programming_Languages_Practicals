stripNegativesAndZerosDuplicatePositives([], []).
stripNegativesAndZerosDuplicatePositives([H|T], L) :-
    H > 0,
    stripNegativesAndZerosDuplicatePositives(T, L1),
    append([H, H], L1, L).
stripNegativesAndZerosDuplicatePositives([H|T], L) :-
    H =< 0,
    stripNegativesAndZerosDuplicatePositives(T, L).