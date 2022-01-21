% Raden Mathieu Almaden 101104851
% Assignment 5 Question 5

%primitive elements
element(air).
element(earth).
element(fire).
element(water).

%compound things are made up of their list of components
%compounde(Thing, Components)
compound(animal,[life,forest]).
compound(bird,[animal,air]).
compound(cloud, [water,air]).
compound(fish,[animal,ocean]).
compound(forest, [tree,tree]).
compound(life, [lightning,ocean,volcano]).
compound(lightning, [storm,cloud,earth]).
compound(ocean, [water,water,water]).
compound(plant, [earth,life]).
compound(tree, [plant,rain]).
compound(field, [earth,plant,wind]).
compound(grass, [field,plant]).
compound(horse, [animal,field]).
compound(rain, [cloud,water]).
compound(storm, [cloud,wind]).
compound(volcano, [fire,earth]).
compound(wind, [air,air]).
compound(sun, [fire,fire]).
compound(life, [sun,earth,ocean]).


% a)
% Join function from the notes
join([], L, L).
join([H|L1], L2, [H|L3]):-
    join(L1, L2, L3).

% Our predicate is true if elements within the list is containing
% exactly those primitive elemtns that are reqquiresd to make the atom
% Item

% Empty Case for our predicate
divide([], []).


% Our Base case for elements because they're primitive
divide(Thing, Elements):-
    element(Thing),
    Elements = [Thing|[]].


% Case where our elements aren't primitive (ie, a list)
divide(Thing, Elements):-
    not(is_list(Thing)),
    compound(Thing, ThingElements),
    divide(ThingElements, Elements).


% Case which checks both of the lists and their heads, iterating through
% the tails
% by doing this we end up making sure that the head is an element
divide([H1|T1], [H2|T2]):-
    element(H1),
    H1 = H2,
    divide(T1, T2).

divide([Head|Tail], List):-
    compound(Head, Var),
    join(Var, Tail, NewList),
    divide(NewList, List).

/* Testing

?- divide(fire, X).
X = [fire] .

?- divide(air, X).
X = [air] .

?- divide(earth, X).
X = [earth] .

?- divide(fire, X).
X = [fire] .

?- divide(water, X).
X = [water] .

?- divide(life, X).
X = [water, air, air, air, water, air, earth, water, water, water, fire, earth] ;
X = [fire, fire, earth, water, water, water] ;
false.

?- divide(plant, X).
X = [earth, water, air, air, air, water, air, earth, water, water, water, fire, earth] ;
X = [earth, fire, fire, earth, water, water, water] ;

LONG
?- divide(forest, X).
X = [earth, water, air, air, air, water, air, earth, water, water, water, fire, earth, water, air, water, earth, water, air, air, air, water, air, earth, water, water, water, fire, earth, water, air, water] ;
X = [earth, water, air, air, air, water, air, earth, water, water, water, fire, earth, water, air, water, earth, fire, fire, earth, water, water, water, water, air, water] ;
X = [earth, fire, fire, earth, water, water, water, water, air, water, earth, water, air, air, air, water, air, earth, water, water, water, fire, earth, water, air, water] ;
X = [earth, fire, fire, earth, water, water, water, water, air, water, earth, fire, fire, earth, water, water, water, water, air, water] ;
false.

?- divide(rain, X).
X = [water, air, water] ;
false.

?- divide(sun, X).
X = [fire, fire] ;
false.

?- divide(cloud, [water,air]).
true .

?- divide(plant, [earth,life]).
false. (false becacuse these are not primitive elements)

?- divide(tree, [plant,rain]).
false. (false because these are not primitive elements)

?- divide(wind, [air,air]).
true .

?- divide(wind, [air,air]).
true .

?- divide(ocean, [water,water,water]).
true .

 */



% b)
%
combine([],_).

combine(Items, Construct):-
    compound(Construct, Items).

combine(Items, Construct):-
    is_list(Construct),
    subset(Construct, Items).
combine(Items, Construct):-
    not(is_list(Construct)),
    compound(Construct,A),
    subset(A, Items).

% Delete function from notes
del(X, [X|T], T).
del(X, [H|T], [H|Result]):- del(X,T,Result).

% Select function from notes
selects([X|Xs], Ys):-
      del(X, Ys, Ys1),
      selects(Xs,Ys1).

% Helper function for checking subset
subsets(Item, ConItem):-
    selects(Item, ConItem).
    %subset([_|T], del())


/* Testing
Some of the combine might be duplicating some outputs because the
predicate made looks through each possible combination of the list.

?- combine([lightning,ocean,volcano], X).
X = life ;
X = life ;
false.

?- combine([cloud,water], X).
X = rain ;
X = ocean ;
X = rain ;
false.

?- combine([animal,air], X).
X = bird ;
X = bird ;
X = wind ;
false.

?- combine([storm,cloud,earth], X).
X = lightning ;
X = lightning ;
false.

Now Testing if combinations work for the target

?- combine([fire,earth], volcano).
true .

?- combine([lightning,ocean,volcano], life).
true .

?- combine([air, air], wind).
true .

?- combine([air, fire], wind).
true.

?- combine([fire, fire], wind).
false.

?- combine([fire, water], wind).
false.

?- combine([cloud, wind], storm).
true .

?- combine([air,wind], storm).
false.

 */

