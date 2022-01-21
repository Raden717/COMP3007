% Raden Mathieu Almaden 101104851
% Assignment 5 Question 3

% a.
lastEle(X,[X]).
lastEle(X, [_ | Tail]):- lastEle(X,Tail), !.

/* Testing

Expecting today
?- lastEle(X,[how,are,you,today]).
X = today.

Expecting function
?- lastEle(X,[Testing,this,function]).
X = function.

Expecting One
?- lastEle(X,[One]).
X = One .

Expecting Test
?- lastEle(R,[Testing,R,Variable,Instead,of,X,Test]).
R = Test.

Expecting 10
?- lastEle(R,[1,2,3,4,5,6,7,8,9,10]).
R = 10.

Expecting 2
?- lastEle(R,[1,6,2,76,8,2,1,7,9,2,3,1,8,3,8,21,216512,52,512521,125,215,7327,2]).
R = 2.

Expecting false (this is because there is no value to be returned, ie
no item in list).
?- lastEle(X, []).
false.



*/

% b.

%Helper function that is similar to mapList
myMapList([], _Function, []).
myMapList([Head|Tail], Function, [NewHead|NewTail]) :- call(Function, Head, NewHead), myMapList(Tail,Function,NewTail).

% Predicatae that uses helper function to recursively iterate through
% each item in the list and apply the getGrade function
gradeMap(L,R) :- myMapList(L, grade, R), !.

%Setting up grades and their return value based off parameters
grade(Grade, a):- Grade >= 80.
grade(Grade, b):- Grade < 80, Grade >= 70.
grade(Grade, c):- Grade < 70, Grade >= 60.
grade(Grade, d):- Grade < 60, Grade >= 50.
grade(Grade, f):- Grade < 50.

/* Testing

Testing Edge Cases

?- gradeMap([0], R).
R = [f]. (expected [f])

?- gradeMap([50], R).
R = [d]. (expected [d])

?- gradeMap([60], R).
R = [c]. (expected [c])

?- gradeMap([70], R).
R = [b]. (expected [b])

?- gradeMap([80], R).
R = [a]. (expected [a])

?- gradeMap([100], R).
R = [a]. (expected [a])

?- gradeMap([0,100], R).
R = [f, a].

?- gradeMap([0,80], R).
R = [f, a].

?- gradeMap([0,70], R).
R = [f, b].

?- gradeMap([0,60], R).
R = [f, c].

?- gradeMap([0,50], R).
R = [f, d].

?- gradeMap([0,49], R).
R = [f, f].

?- gradeMap([0,100,100], R).
R = [f, a, a].

?- gradeMap([0,100,90], R).
R = [f, a, a].

?- gradeMap([0,100,80], R).
R = [f, a, a].

?- gradeMap([0,100,70], R).
R = [f, a, b].

?- gradeMap([0,100,60], R).
R = [f, a, c].

?- gradeMap([0,100,50], R).
R = [f, a, d].

?- gradeMap([0,100,49], R).
R = [f, a, f].

Testing Random

?- gradeMap([99,61,32,65,74,18,77,81], R).
R = [a, c, f, c, b, f, b, a].

?- gradeMap([0,72,32,51,79,81,51,59,69], R).

R = [f, b, f, d, b, a, d, d, c].

*/

%c

split([],_,[],[]).
split([Car|Cdr], Pivot, L1, L2):-
    Car > Pivot, %Checks car and compares to pivot and splits accordingly
    split(Cdr, Pivot, L1, New), append([Car], New, L2), !;
    split(Cdr, Pivot, New, L2), append([Car], New, L1), !.


/* Testing

?- split([4,7,1,8,2,9,3],5, L1, L2).
L1 = [4, 1, 2, 3],
L2 = [7, 8, 9].

?- split([91,32,61,81,50,90,100,71],50, L1, L2). Larger Values
L1 = [32, 50],
L2 = [91, 61, 81, 90, 100, 71].

?- split([91,32,61,81,50,90,100,71],80, L1, L2).
L1 = [32, 61, 50, 71],
L2 = [91, 81, 90, 100].

?- split([91,32,61,81,50,90,100,71],81, L1, L2). Making Sure 81 is in L1
L1 = [32, 61, 81, 50, 71],
L2 = [91, 90, 100].

?- split([10,6,4,5,5,4,4,3,2,1,9,10,10,6,8],5, L1, L2). Smaller Values
L1 = [4, 5, 5, 4, 4, 3, 2, 1],
L2 = [10, 6, 9, 10, 10, 6, 8].

?- split([10,6,4,5,5,4,4,3,2,1,9,10,10,6,8],9, L1, L2).
L1 = [6, 4, 5, 5, 4, 4, 3, 2, 1|...],
L2 = [10, 10, 10].

?- split([10,6,4,5,5,4,4,3,2,1,9,10,10,6,8],4, L1, L2).
L1 = [4, 4, 4, 3, 2, 1],
L2 = [10, 6, 5, 5, 9, 10, 10, 6, 8].

 */

% d)
myNextto(X, Y, [X, Y|_]).
myNextto(X, Y, [_| Tail]) :- myNextto(X, Y, Tail), !.

/* Testing
Clarification my interpretation was that y has to follow x but not x
follows y. As it mentions x and y are immediately consecutive elements
x->y and not y->x just like the built in next to method

?- myNextto(a,b, [c,a,b,d]).
true.

?- myNextto(a,d, [c,a,b,d]).
false.

?- myNextto(f,h, [c,a,b,d,e,f,g,h,z,i,l,a,f,h]).
true.

?- myNextto(c,h, [c,a,b,d,e,f,g,h,z,i,l,a,f,h]).
false.

?- myNextto(a,l, [c,a,b,d,e,f,g,h,z,i,l,a,f,h]). Testing if a before l
false.
(this should be false as l is only after a and not the other way
around, or thats how interpreted it)

?- myNextto(l,a, [c,a,b,d,e,f,g,h,z,i,l,a,f,h]).
true.
(this should be true)

?- myNextto(f,h, [c,a,b,d,e,f,g,h,z,i,l,a,f,h]).
true.
(edge case, should be true)

?- myNextto(f,g, [c,a,b,d,e,f,g,h,z,i,l,a,f,h]).
true.

?- myNextto(c,a, [c,a,b,d,e,f,g,h,z,i,l,a,f,h]).
true .
(edge case, beginning of list)

?- myNextto(a,c, [c,a,b,d,e,f,g,h,z,i,l,a,f,h]).
false.
(edge case again, c should be after a for this to be true)

 */


