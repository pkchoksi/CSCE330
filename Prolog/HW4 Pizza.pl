solution(Steak, Chicken, Lasagna, Pizza, Coke, Milk, Coffee, Water) :-
	uniq(Steak, Chicken, Lasagna, Pizza),
	uniq(Coke, Milk, Coffee, Water),

	\+  doreen = Steak,  %Doreen sat beside person who ordered steak
	beside(doreen, X),
	X=Steak,
	Chicken = Coke,	     %Chicken came with Coke
	across(Y,Z),         %Person w/ lasagna sat across from person w/ milk
	Y=Lasagna,
	Z=Milk,
	\+ Lasagna = Milk,
	\+ david = Coffee,   %David never drinks coffee
	donna = Water,       %Donna only drinks water
	\+ danny = Steak,    %Danny can't afford steak
	print(Pizza).

uniq(A,B,C,D) :- person(A), person(B), person(C), person(D),
		 \+ A=B, \+ A=C, \+ A=D, \+ B=C, \+ B=D, \+ C=D.

print(Pizza) :- write(Pizza), write(' ordered pizza.'), nl.

person(donna). person(danny).
person(david). person(doreen).

beside(donna, danny).
beside(donna, david).
beside(doreen, danny).
beside(doreen, david).

across(danny, david).
across(david, danny).
across(donna, doreen).
across(doreen, donna).
