% Copyright Yerlan Karakulov

implement main
    open core,stdio

class predicates
    fact2: (integer,real,integer,real) anyflow.


clauses
        fact2(N,F,N,F):-!.
        fact2(NS,FS,N,F):-NS1=NS+1,FS1=FS*NS1,fact2(NS1,FS1,N,F).

run() :-
        stdio::write("\n"),
        fact2(0,1,4,F),
        stdio::writef("res=%",F),fail;
        _=stdio::readLine().

end implement main

goal
    console::runUtf8(main::run).