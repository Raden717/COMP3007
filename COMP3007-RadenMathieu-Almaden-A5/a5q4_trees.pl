% Raden Mathieu Almaden 101104851
% Assignment 5 Question 4

% a.
% List check that checks it recursively iterating throughout the list
list([]).
list([_| Tail]) :- list(Tail).

/*

?- list([]). Base Case
true.

?- list(test). Word not in List
false.

?- list(10). Number not in list
false.

?- list([1,2,3,4,5]). Number List
true.

?- list([checking,if,words,work,test]). Word List
true.

 */
% b)
treeFlat([],[]).
treeFlat(T,[T]):- \+ list(T).
treeFlat([Head| Rem], L) :-
    treeFlat(Head, Y),
    treeFlat(Rem, New),
    append(Y, New, L).


/* Testing

?- treeFlat([],[]).
true .

?- treeFlat([],R).
R = [] .

?- treeFlat([5,7,9,[10,21,31,[61,41],91],101,[123,124]],[5,7,9,10,21,31,61,41,91,101,123,124]).
true .

?- treeFlat([5,7,9,[10,21,31,[61,41],91],101,[123,124]], R).
R = [5, 7, 9, 10, 21, 31, 61, 41, 91|...] [write]
R = [5, 7, 9, 10, 21, 31, 61, 41, 91, 101, 123, 124]

?- treeFlat([1,[2,3],[[4,[5]],6]],[1,2,3,4,5,6]).
true .

?- treeFlat([1,[2,3],[[4,[5]],6]],R).
R = [1, 2, 3, 4, 5, 6] .

?- treeFlat([[[[1,2,[3],4],[5,6]],10,15,11,12],[19,21,[31]]], [1,2,3,4,5,6,10,15,11,12,19,21,31]).
true .

?- treeFlat([[[[1,2,[3],4],[5,6]],10,15,11,12],[19,21,[31]]], R).
R = [1, 2, 3, 4, 5, 6, 10, 15, 11, 12, 19, 21, 31] .

?-

 */

% c)
treeSum(T, S):-
    treeFlat(T, Flat),
    sum(Flat, S).

% Helper sum function
sum([], 0).
sum([H|T], R):-
    number(H),
    sum(T, Partial),
    R is Partial+H.

/* Testing

?- treeSum([1,[2,3],[[4,[5]],6]],S).
S = 21 .

?- treeSum([5,7,9,[10,21,31,[61,41],91],101,[123,124]], S).
S = 624 .

?- treeSum([[[[1,2,[3],4],[5,6]],10,15,11,12],[19,21,[31]]], S).
S = 140 .

?- treeSum([5,10,15,0,12,31], S).
S = 73 .

?- treeSum([5,[7,21,31],10,[15,[0,12]],31], S).
S = 132

 */

