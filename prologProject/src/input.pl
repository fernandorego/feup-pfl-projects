row('A',0).
row('B',1).
row('C',2).
row('D',3).
row('E',4).
row('F',5).
row(_,-1).

col(1,0).
col(2,1).
col(3,2).
col(4,3).
col(5,4).
col(6,5).
col(_,-1).

get_names(P1,P2) :- write('Name of Player 1: '),get_name(P1),nl,write('Name of Player 2: '), get_name(P2).

get_name(P) :- read_string(P).

get_move(Row,Col) :- get_row(Row), get_col(Col).

get_row(RN) :- write('Row: '), read_string([Row|T]), length([Row|T],Len), Len =:= 1, char_code(Char, Row), row(Char,RN), RN =\= -1.
get_row(RN) :- write('ERROR: Invalid Input'),nl,get_row(RN).

get_col(CN) :- write('Column: '), read_number(Col), col(Col,CN), CN =\= -1.
get_col(CN) :- write('ERROR: Invalid Input'), nl, get_col(CN).

read_string(X) :- read_string(X,[]).
read_string(X,X) :- peek_code(10),!,skip_line.
read_string(X,Acc) :-   get_code(Char),
                        append(Acc,[Char],Next),
                        read_string(X,Next).

read_number(X) :-   read_number(X,0).
read_number(X,X) :- peek_code(10), !, skip_line.
read_number(X,Acc) :-   get_code(Char),
                        char_code('0',Zero),
                        N is Char - Zero,
                        Next is Acc * 10 + N,
                        read_number(X,Next).

wait_for_input :- skip_line.
