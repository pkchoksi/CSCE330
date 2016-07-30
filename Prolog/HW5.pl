% Part a
exactly_3(X) :- X=[_,_,_].

% Part b
at_least_3(X) :- X=[_,_,_|_].

% Part c
at_most_3(X) :- append([], [], X).          % Empty List
at_most_3(X) :- append([_|[]], [], X).	    % 1 element
at_most_3(X) :- append([_|[]], [_|[]], X).  % 2 elements
at_most_3(X) :- exactly_3(X).		    % 3 elements

% Part d
intersect(X,Y) :- member(N, X), member(N, Y).

% Part e
all_intersect(Z,Y):- Z = [X|W], intersect(X,Y), all_intersect(W,Y).
all_intersect(Z,_):- Z = [].
