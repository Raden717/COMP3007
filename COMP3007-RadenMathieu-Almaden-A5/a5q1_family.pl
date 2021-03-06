% Raden Mathieu Almaden 101104851

%Rules

% X is parent of Y, can be either mother/father
parent(X,Y) :-
    father(X,Y);
    mother(X,Y).

% X is a mother and female
is_mother(X) :-
    parent(X,_),
    female(X).

% X is a father and male
is_father(X) :-
    parent(X,_),
    male(X).

% X is an aunt of Y because of parentage or marriage
aunt(X, Y) :-
    female(X),
    parent(Parent, X),
    parent(ParentOfY, Y),
    parent(Parent, ParentOfY),
    not(ParentOfY = X).

% X is an uncle of Y because of parentage or marriage
uncle(X, Y) :-
    male(X),
    parent(Parent, X),
    parent(ParentOfY, Y),
    parent(Parent, ParentOfY),
    not(ParentOfY = X).

% X is a sister of Y because of same parents
sister(X, Y) :-
    female(X),
    parent(Same, X),
    parent(Same, Y),
    not(X = Y).

% X is a brother of Y because of same parents
brother(X, Y) :-
    male(X),
    parent(Same, X),
    parent(Same, Y),
    not(X = Y).

% X is grandfather of Y because of being the father of parents
grandfather(X,Y) :-
    male(X),
    parent(ParentOfY, Y),
    parent(X, ParentOfY).

% X is grandmother of Y because of being the mother of parents
grandmother(X,Y) :-
    female(X),
    parent(ParentOfY, Y),
    parent(X, ParentOfY).

% X is ancestor of Y because of parentage
ancestor(X,Y) :-
    parent(X,Y).
ancestor(X,Y) :-
    parent(X,var), ancestor(var,Y).

% Facts

% Setting up male/female
male(son1).       %Male
male(dad1).       %Father
male(uncle1).     %Uncle
male(grandpa1).   %GrandFather
male(grandpa2).   %GrandFather
male(greatpa1).   %Great Grandfather
female(daughter1).%Female
female(mom1).     %Mother
female(aunt1).    %Aunt
female(grandma1). %Grandmother
female(grandma2). %Grandmother
female(greatma1). %Great Grandmother

% Setting up Fathers
father(dad1, son1).
father(dad1, daughter1).
father(grandpa1, dad1).
father(grandpa1, aunt1).
father(grandpa2, mom1).
father(grandpa2, uncle1).
father(greatpa1, grandpa1).

% Setting up Mothers
mother(mom1, son1).
mother(mom1, daughter1).
mother(grandma1, dad1).
mother(grandma1, aunt1).
mother(grandma2, mom1).
mother(grandma2, uncle).
mother(greatma1, grandpa2).

% Setting up marriages
married(dad1, mom1).
married(mom1, dad1).

married(grandpa1, grandma1).
married(grandma1, grandpa1).

married(grandpa2, grandma2).
married(grandma2, grandpa2).







