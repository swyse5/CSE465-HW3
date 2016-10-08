% Stuart Wyse
% CSE 465 - HW 3
% Due 10/11/2016

% maxnums(A,B,MAX) - returns the max of 2 simple numbers
maxnums(A,B,MAX) :- A >= B, MAX is A.
maxnums(A,B,MAX) :- B > A, MAX is B.

% sum(LST, SUM) - returns the sum of a list of numbers
sum([], 0).
sum([H|T],SUM) :- sum(T,S1), SUM is H+S1.

% sister(SISTER, SIBLING) - exercise 16.2 from textbook
% Sister could have only been:
% sister(SISTER, SIBLING) :- sibling(SISTER, SIBLING), female(SISTER).
% if the directions did not say to use the other structures.
sister(SISTER, SIBLING) :- female(SISTER), female(SIBLING), parent(X, SIBLING), parent(X, SISTER), not(SISTER=SIBLING).
sister(SISTER, SIBLING) :- female(SISTER), male(SIBLING), parent(X, SIBLING), parent(X, SISTER), not(SISTER=SIBLING).

% max(LST, MAX) - exercise 16.3 from textbook
max([H], H). % for a 1 element list
max([H|T], H) :- max(T,M), H>M. % if the lead element is the largest
max([H|T], M) :- max(T,M), M>H.


% partitionable(LST) - determine if list of numbers can be split into 2 lists that sum to the same value


% getCommon(STATE1, STATE2, PLACE) - gets place names that are common to both states
% place(X,Y) - gets place and state
place(X,Y) :- location(_,X,Y,_,_,_).
getCommon(STATE1, STATE2, PLACE) :- place(PLACE, STATE1), place(PLACE, STATE2), not(STATE1=STATE2).
