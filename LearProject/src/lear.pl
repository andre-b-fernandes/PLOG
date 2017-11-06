

tabuleiroVazio(Tab):- Tab = [['e', 'e', 'e', 'e', 'e' ,'e' ,'e'] , ['e', 'e', 'e', 'e', 'e' ,'e' ,'e'], ['e', 'e', 'e', 'e', 'e' ,'e' ,'e'], ['e', 'e', 'e', 'e', 'e' ,'e' ,'e'], ['e', 'e', 'e', 'e', 'e' ,'e' ,'e'], ['e', 'e', 'e', 'e', 'e' ,'e' ,'e'], ['e', 'e', 'e', 'e', 'e' ,'e' ,'e']].

/*
tabuleiro([['X', 'X', 'O', 'O', 'O' ,'X' ,'X'] , ['X', 'X', 'X', 'O', 'O' ,'X' ,'X'], ['X', 'O', 'O', 'O', 'X' ,'X' ,'O'], ['O', 'O', 'O', 'X', 'X' ,'X' ,'X'], ['O', 'O', 'O', 'X', 'X' ,'O' ,'X'], ['X', 'O', 'X', 'O', 'O' ,'O' ,'O'], ['O', 'O', 'O', 'X', 'X' ,'O' ,'X']]).

tabuleiro([['.', '.', '.', '.', '.' ,'.' ,'.'] , ['.', '.', '.', '.', 'X' ,'X' ,'.'], ['.', '.', '.', 'O', '.' ,'.' ,'O'], ['.', '.', '.', 'X', '.' ,'O' ,'.'], ['.', '.', '.', '.', '.' ,'.' ,'.'], ['.', '.', '.', '.', '.' ,'.' ,'.'], ['.', '.', '.', '.', '.' ,'.' ,'.']]).
*/

printBoard(Tab):- printTabuleiro(Tab).

printTabuleiro([H|T]):- write('         '), printLinha(H), write('\n'), printTabuleiro(T).
printTabuleiro([]).

printLinha([H|T]):- write(' '), write(H), write('  '),printLinha(T).
printLinha([]).
