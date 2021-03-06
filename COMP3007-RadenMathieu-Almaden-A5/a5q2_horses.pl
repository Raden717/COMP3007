% Raden Mathieu Almaden 101104851
% Assignment 5 Question 2


/*This is a knowledgebase of racing horse information, with the following details:
    name - the horse's name
    sire - the horse's father's name
    starts - the number of races the horse has competed
    wins - the number of races the horse has gotten 1st place
    places - the number of races the horse has gotten 2nd place
    shows - the number of races the horse has gotten 3rd place
    total$ - the total amount of prize money the horse has earned
*/

%format:
%horse(Name, Sire, Starts, Wins, Places, Shows, Total$).

horse(awesome_again, deputy_minister, 12,9,0,2,4374590).
horse(summer_bird, birdstone, 9,4,1,1, 2323040).
horse(life_is_sweet,storm_cat, 8,4,1,1,1620000).
horse(birdstone, grindstone, 9,5,0,0,1575600).
horse(tiz_the_law, constitution, 6,4,2,0,3040000).
horse(wicked_awesome, awesome_again, 20,7,3,1,231460).
horse(constitution, tapit, 8,4,0,1,1031596).
horse(valiance, tapit, 5,3,0,0,373575).
horse(tapit, pulpit, 6,3,0,0,557300).
horse(mind_your_biscuits,posse,5,2,3,0,570400).
horse(kitten_by_the_sea, kittens_joy, 6,2,1,1,51850).
horse(posterity,posse,6,0,0,1,9590).
horse(zenyatta,street_cry,5,5,0,0,3330000).
horse(gio_ponti, tale_of_the_cat, 7,4,2,0,2333000).
horse(mickinzie, street_sense,5,3,1,0,876000).
horse(underpressure,birdstone,12,3,3,4,221790).
horse(jaywalk, cross_traffic,5,4,1,0,1384200).
horse(trigger_warning, candy_ride, 12,4,1,2,543820).
horse(majestic_warrior, dream_supreme, 7,2,0,0,239229).
horse(lone_sailor, majestic_warrior, 10,1,4,1,809600).
horse(mine_that_bird, birdstone, 8,1,2,2,1892200).
horse(lone_rock, majestic_warrior, 7,3,0,1,121625).
horse(something_awesome, awesome_again, 6,3,1,1,912550).
horse(sweet_platinum, elusive_quality, 16, 3, 11, 1, 51003).


/*

a. How many times has Jaywalk raced, and how much money have they
earned?

query: horse(jaywalk,_,Races,_,_,_,MoneyEarned).

Output:
Races = 5,
MoneyEarned = 1384200.

b. What horses have been sired by Birdstone?

query: horse(Horse,birdstone,_,_,_,_,_).

Output:
Horse = summer_bird ;
Horse = underpressure ;
Horse = mine_that_bird.


c. Who has placed in more races than they've won?

query:  horse(Horse,_,_,Wins,Places,_,_), Places > Wins.

Output:
Horse = mind_your_biscuits,
Wins = 2,
Places = 3 ;
Horse = lone_sailor,
Wins = 1,
Places = 4 ;
Horse = mine_that_bird,
Wins = 1,
Places = 2 ;
Horse = sweet_platinum,
Wins = 3,
Places = 11.


d. Did any horse at least show in all of their races?

query: ?- horse(Horse,_,Races,Wins,Places,Shows,_), Total is
Wins+Shows+Places, Total = Races.

Output:
|    Horse = tiz_the_law,
Races = Total, Total = 6,
Wins = 4,
Places = 2,
Shows = 0 ;
Horse = mind_your_biscuits,
Races = Total, Total = 5,
Wins = 2,
Places = 3,
Shows = 0 ;
Horse = zenyatta,
Races = Wins, Wins = Total, Total = 5,
Places = Shows, Shows = 0 ;
Horse = jaywalk,
Races = Total, Total = 5,
Wins = 4,
Places = 1,
Shows = 0 ;


Output:
false.


e. Who has sired a horse that has won at least 5 races?

query: ?- horse(_,Sire,_,Won,_,_,_), Won >= 5.

Output:
Sire = deputy_minister,
Won = 9 ;
Sire = grindstone,
Won = 5 ;
Sire = awesome_again,
Won = 7 ;
Sire = street_cry,
Won = 5 ;
false.


f. Who is the grand-sire (i.e. the sire of the sire) of Valiance?

query: ?- horse(valiance, Sire1,_,_,_,_,_), horse(Horse, GrandSire,_,_,_,_,_), Horse = Sire1.

Output:
Sire1 = Horse, Horse = tapit,
GrandSire = pulpit ;
false.


g. What pair(s) of horses are siblings?

query: ?- horse(Horse1,Sire,_,_,_,_,_), horse(Horse2,Sire,_,_,_,_,_), Horse1 \= Horse2.

Output:
Horse1 = summer_bird,
Sire = birdstone,
Horse2 = underpressure ;
Horse1 = summer_bird,
Sire = birdstone,
Horse2 = mine_that_bird ;
Horse1 = wicked_awesome,
Sire = awesome_again,
Horse2 = something_awesome ;
Horse1 = constitution,
Sire = tapit,
Horse2 = valiance ;
Horse1 = valiance,
Sire = tapit,
Horse2 = constitution ;
Horse1 = mind_your_biscuits,
Sire = posse,
Horse2 = posterity ;
Horse1 = posterity,
Sire = posse,
Horse2 = mind_your_biscuits ;
Horse1 = underpressure,
Sire = birdstone,
Horse2 = summer_bird ;
Horse1 = underpressure,
Sire = birdstone,
Horse2 = mine_that_bird ;
Horse1 = lone_sailor,
Sire = majestic_warrior,
Horse2 = lone_rock ;
Horse1 = mine_that_bird,
Sire = birdstone,
Horse2 = summer_bird ;
Horse1 = mine_that_bird,
Sire = birdstone,
Horse2 = underpressure ;
Horse1 = lone_rock,
Sire = majestic_warrior,
Horse2 = lone_sailor ;
Horse1 = something_awesome,
Sire = awesome_again,
Horse2 = wicked_awesome ;
false.


h. What is the win-percentage of horses who have won more than 75% of
their races?

query: ?- horse(Horse1,_,Races,Wins,_,_,_), WinPer = Wins/Races, WinPer > 0.75.

Output:
Horse1 = zenyatta,
Races = Wins, Wins = 5,
WinPer = 5/5 ;
Horse1 = jaywalk,
Races = 5,
Wins = 4,
WinPer = 4/5 ;
false.

i. What horses earn less than $10,000 per race on average?

qeury: ?- horse(Horse1,_,Races,_,_,_,Earnings), EarnAvr = Earnings/Races, 10000 > EarnAvr.

Output:
Horse1 = kitten_by_the_sea,
Races = 6,
Earnings = 51850,
EarnAvr = 51850/6 ;
Horse1 = posterity,
Races = 6,
Earnings = 9590,
EarnAvr = 9590/6 ;
Horse1 = sweet_platinum,
Races = 16,
Earnings = 51003,
EarnAvr = 51003/16.


j. What horse has the highest average winnings per race?

query: ?- horse(Horse1,_,Races1,_,_,_,Earnings1), horse(Horse2,_,Races2,_,_,_,Earnings2), EarnAvr1 = Earnings1/Races1, EarnAvr2 = Earnings2/Races2, not(Horse1=Horse2), \+EarnAvr1 > EarnAvr2, !.

Output:
Horse1 = awesome_again,
Races1 = 12,
Earnings1 = 4374590,
Horse2 = tiz_the_law,
Races2 = 6,
Earnings2 = 3040000,
EarnAvr1 = 4374590/12,
EarnAvr2 = 3040000/6.

Tiz the law has the most earnings average with an earning average of
3040000/6.
*/
