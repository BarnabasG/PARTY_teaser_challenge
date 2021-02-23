main
	:-	partys(X), write(X).

/* The predicate tests that the input number meets all relevant
 * criteria to make it a 'PAR'. */
par(A)  :-
        digits_flip(A, [W,X,Y,Z]),		        % Convert to a list of digits
    	unique([W,X,Y,Z]),				% Ensure each digit is unique
        \+ (member(0,[W,X,Y,Z])),	                % Ensure there are no zeros
    	B1 is W * 10 + X,				% Ensure the first two digits
    	B2 is Y * 10 + Z,				% are a multiple of the last two
    	0 =:= mod(B1,B2).				% Ensure B1 is a multiple of B2

/* This predicate is use to convert the 4 digit input number to a
 * list of 4 single digits using div and mod. */
digits(A, [])	:-				        % Base case - All digits found
        A =:= 0.
digits(A, [H|T])    :-
        A > 0,
    	A1 is mod(A, 10),				% End digit
    	A2 is div(A, 10),				% Remaining digits
    	H is A1,
    	digits(A2, T).

/* The output of 'digits' is the numbers digits in reverse order. This
 * predicate is used to put the numbers in the correct order. */
digits_flip(A, R)   :-
        digits(A, B),
    	reverse(B, R).
    	
/* Determine whether all the values in a list are unique */
unique([]).
unique([_,[]]).
unique([H|T])   :-
        \+ (memberchk(H,T)),
    	unique(T).

/* Find all instances where the test passes and store them as a list in
 * variable X.*/
pars(X) :-
        findall(P,test(P),X).

/* Sets out the test for pars. Between 1234 (lowest posible number to test
 * for par) and 9876 (highest), test each number and see if they are a PAR */
test(P) :-
        between(1234,9876,P),
    	par(P).

/* Find the missing number between one and nine from 2 pars */
missing(C, X)   :-
        between(1,9,P),
    	\+ (memberchk(P,C)),
    	X is P.

/* Ascertains whether a pair of pars qualify as a party. */
party(A, B) :-
        par(A),				        % Ensure A and B are both pars individually
    	par(B),
    	digits_flip(A, A1),	                % Convert each par to a list of digits
    	digits_flip(B, B1),
    	append(A1, B1, C),	                % C is the list of both pars
        unique(C),			        % Ensure C has no repeated digits
    	missing(C, D),		                % Find the one positive digit mising from C
    	0 is mod(A, D),		                % Ensure both A and B are multiples of this digit
    	0 is mod(B, D).

/* Finds all pairs of pars which qualify as a party.
 * 'findall' finds all instances of [C,D], a pair of pars, where both
 * pars qualify together as a party, checking each pair of pars from
 * the list of pars, A. */
partys(X)   :-
        pars(A),			        % A is the list of pars
    	findall([C,D], (append(_, [C|R], A), member(D, R), party(C,D)), X).
		
