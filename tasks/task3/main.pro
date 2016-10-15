% Copyright Yerlan Karakulov

implement main
    open core, stdio

class predicates
    isZero : (integer) determ.
    check: (integer,integer,integer,integer) nondeterm anyflow.
    nod: (integer,integer,integer) nondeterm anyflow.
clauses
    isZero(0).
    check(N,B,A,R):- K=B mod N, isZero(K), T=A mod N, isZero(T),R=N.
    check(N,B,A,R):- K=B mod N, isZero(K), T=A mod N, T<>0,check(N-1,B,A,R1), R=R1.
    check(N,B,A,R):- K=B mod N, K<>0,check(N-1,B,A,R1), R=R1.
    nod(A,B,R):-A==B,R=A.
    nod(A,B,R):-B>A, nod(B,A,R1),R=R1.
    nod(A,B,R):-A>B,K =A mod B,isZero(K),R=B.
    nod(A,B,R):-A>B,K =A mod B, K<>0, N=B div 2, check(N,B,A,R1),R=R1.
run():-
        stdio::write("\n"),
        nod(18,18,F),
        stdio::writef("res=%",F),fail;
        _=stdio::readLine().

end implement main

goal
    console::runUtf8(main::run).