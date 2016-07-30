%Gen 1
child(samuel, joseph).
child(samuel, abigail).
child(chistoph, joseph).
child(chistoph, abigail).
child(tiff, joseph).
child(tiff, baymax).
child(mars, juan).
child(andy, olaf).
%Gen 2
child(joseph, david).
child(joseph, desiah).
child(abigail, nathaniel).
child(abigail, jane).
child(juan, david).
child(olaf, hiro).
child(baymax, jane).
%Gen 3
child(david, nelson).
child(david, mercy).
child(desiah, william).
child(desiah, mary).
child(nathaniel, enoch).
child(nathaniel, rebecca).
child(jane, steve).
child(jane, lucerna).
child(hiro, mercy).
child(hiro, steve).
%Gen 4
child(nelson, simeon).
child(nelson, patience).
child(mercy, john).
child(mercy, ellena).
child(william, louie).
child(william, desire).
child(mary, timmy).
child(mary, lydia).
child(enoch, que).
child(enoch, hannah).
child(rebecca, chris).
child(rebecca, saturn).
child(steve, ephraim).
child(steve, chloe).
child(lucerna, bob).
%Gen 5
child(simeon, zeek).
child(patience, hope).
child(john, matthew).
child(ellena, sully).
child(louie, lamp).
child(desire, want).
child(timmy, limmy).
child(lydia, skyrim).
child(hannah, montana).
child(chris, starlord).
child(saturn, starlord).
child(ephraim, starlord).
child(chloe, starlord).
child(bob, rob).

male(samuel). male(joseph). male(david). male(nathaniel).
male(nelson). male(william). male(enoch). male(steve).
male(simeon). male(seek). male(john). male(matthew). male(sully).
male(louie). male(lamp). male(timmy). male(limmy). male(skyrim).
male(chris). male(starlord). male(saturn). male(uranus).
male(ephraim). male(bob). male(rob). male(chistoph). male(mars).
male(juan). male(olaf). male(hiro). male(baymax).

female(abigail). female(desiah). female(jane). female(mercy).
female(mary). female(rebecca). female(lucerna). female(patience).
female(hope). female(ellena). female(desire). female(want).
female(lydia). female(hannah). female(montana). female(asenath).
female(chloe). female(faith). female(tiff).

parent(Y,X) :- child(X,Y).
father(Y,X) :- child(X,Y), male(Y).
grand_father(Z,X) :- child(X,Y), child(Y,Z), male(Z).

%Question 1
mother(Y,X) :- child(X,Y), female(Y).
grand_parent(Z,X) :- child(X,Y), child(Y,Z).
great_grand_mother(Q,X) :- child(X,Y), child(Y,Z), child(Z,Q), female(Q).

%Question 2
sibling(X,Y) :- child(X,Z), child(Y,Z), not(X=Y).
brother(X,Y) :- sibling(X,Y), male(X).
sister(X,Y) :- sibling(X,Y), female(X).

%Question 3
half_sibling(X,Y) :- sibling(X,Y), parent(Z,X), parent(Z,Y), parent(A,X), parent(B,Y), not(Z=A), not(Z=B), not(A=B).
full_sibling(X,Y) :- sibling(X,Y), parent(Z,X), parent(Z,Y), parent(A,X), parent(A,Y), not(Z=A).

%Question 4
first_cousin(X,Y) :- parent(A,X), parent(B,Y), sibling(A,B).
second_cousin(X,Y) :- parent(A,X), parent(B,Y), first_cousin(A,B).

%Question 5
half_first_cousin(X,Y) :- parent(A,X), parent(B,Y), half_sibling(A,B).
double_first_cousin(X,Y) :- parent(A,X), parent(B,X), parent(C,Y), parent(D,Y), not(A=B), not(C=D), sibling(A,C), sibling(B,D).

%Qestion 6
first_cousin_twice_removed(X,Y) :- child(X,A), child(A,B), first_cousin(B,Y).

%Question 7
descendant(X,Y) :- child(X,Y).
descendant(X,Y) :- child(X,Z), descendant(Z,Y).
ancestor(X,Y) :- descendant(Y,X).

%Question 8
cousin(X,Y) :- parent(A,X), parent(B,Y), sibling(A,B).
cousin(X,Y) :- parent(A,X), parent(B,Y), cousin(A,B).

%Question 9
closest_common_ancestor(X,Y,Z) :- ancestor(X,Y), ancestor(X,Z),  child(A,X), not(ancestor(A,Y)), not(ancestor(A,Z)), not(Y=Z).

%Question 10
write_child(X,Y) :- write(X), write(' is a child of '), write(Y), nl.
write_descendant_chain(X,Y) :- child(X,Y), write_child(X,Y).
write_descendant_chain(X,Y) :- child(X,Z), write_descendant_chain(Z,Y), write_child(X,Z).






















