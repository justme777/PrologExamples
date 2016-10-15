% Copyright Yerlan Karakulov

implement main
    open core, stdio

class predicates
    fact: (integer, real) nondeterm anyflow.

clauses
        fact(N,F):- N<0,!,fail.
        fact(0,1).
        fact(N,F):-N1=N-1,fact(N1,F1),F=F1*N.

run():-
        stdio::write("\n"),
        fact(4,F),
        stdio::writef("res=%",F),fail;
        _=stdio::readLine().

end implement main

goal
    console::runUtf8(main::run).