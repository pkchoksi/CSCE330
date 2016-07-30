dig(0). dig(1). dig(2). dig(3). dig(4).
dig(5). dig(6). dig(7). dig(8). dig(9).

uniq_digits(C,R,O,S,A,D,N,G,E) :-
   dig(C), dig(R), dig(O), dig(S), dig(A), dig(D), dig(N), dig(G), dig(E),
   \+ C=R, \+ C=O, \+ C=S, \+ C=A, \+ C=D, \+ C=N, \+ C=G, \+ C=E,
	   \+ R=O, \+ R=S, \+ R=A, \+ R=D, \+ R=N, \+ R=G, \+ R=E,
		   \+ O=S, \+ O=A, \+ O=D, \+ O=N, \+ O=G, \+ O=E,
			   \+ S=A, \+ S=D, \+ S=N, \+ S=G, \+ S=E,
			           \+ A=D, \+ A=N, \+ A=G, \+ A=E,
					   \+ D=N, \+ D=G, \+ D=E,
					           \+ N=G, \+ N=E,
							   \+ G=E.

%C# for carry digit
solution(C,R,O,S,A,D,N,G,E) :-
	dig(S),
	R is (S+S) mod 10, C1 is (S+S) // 10,
	dig(D), D>0,
	E is (S+D+C1) mod 10, C10 is (S+D+C1) // 10,
	dig(O), dig(A),
	G is (O+A+C10) mod 10, C100 is (O+A+C10) // 10,
	dig(R), R>0,
	N is (R+O+C100) mod 10, C1000 is (R+O+C100) // 10,
	dig(C), C>0,
	A is (C+R+C1000) mod 10, D is (C+R+C1000) // 10,
	uniq_digits(C,R,O,S,A,D,N,G,E).
