getPeca(NLinha, NColuna, Tabuleiro, Peca):- getPecaLinha(NLinha,Tabuleiro,Linha), getPecaColuna(NColuna, Linha, Peca).

getPecaLinha(NLinha, [H|T], Linha):- Previous is NLinha-1, getPecaLinha(Previous, T, Linha).
getPecaLinha(1, [H|T], H).

getPecaColuna(NColuna, [H|T], Peca):- Previous is NColuna-1, getPecaColuna(Previous, T, Peca).
getPecaColuna(1, [H|T], H).

setPeca(NLinha, NColuna, Peca,TabIn, TabOut):- setPecaLinha(NLinha, NColuna,TabIn, Peca, TabOut), tabuleiro(TabOut), printTabuleiro(TabOut).

setPecaLinha(NLinha, NColuna, [H|T], Peca, [H|R]):- Previous is NLinha-1, setPecaLinha(Previous, NColuna, T, Peca, R).

setPecaLinha(1, NColuna, [H|T], Peca, [I|T]) :- setPecaColuna(NColuna,H,Peca,I).

setPecaColuna(NColuna,[P|Resto],Peca,[P|Mais]) :- Previous is NColuna-1, setPecaColuna(Previous, Resto,Peca,Mais).

setPecaColuna(1,[_| Resto],Peca,[Peca|Resto]).

contaPecas([],_,0).
contaPecas([P|R], Peca, N):- P\=Peca, contaPecas(R, Peca, N).
contaPecas([Peca|Resto], Peca,N):-contaPecas(Resto, Peca, Na), N is Na+1.


tabuleiro([]).
tabuleiro([X|S]):- tabuleiro(S).


tabuleiro([['.', '.', '.', '.', '.' ,'.' ,'.'] , ['.', '.', '.', '.', '.' ,'.' ,'.'], ['.', '.', '.', '.', '.' ,'.' ,'.'], ['.', '.', '.', '.', '.' ,'.' ,'.'], ['.', '.', '.', '.', '.' ,'.' ,'.'], ['.', '.', '.', '.', '.' ,'.' ,'.'], ['.', '.', '.', '.', '.' ,'.' ,'.']]).

tabuleiro([['X', 'X', 'O', 'O', 'O' ,'X' ,'X'] , ['X', 'X', 'X', 'O', 'O' ,'X' ,'X'], ['X', 'O', 'O', 'O', 'X' ,'X' ,'O'], ['O', 'O', 'O', 'X', 'X' ,'X' ,'X'], ['O', 'O', 'O', 'X', 'X' ,'O' ,'X'], ['X', 'O', 'X', 'O', 'O' ,'O' ,'O'], ['O', 'O', 'O', 'X', 'X' ,'O' ,'X']]).

tabuleiro([['.', '.', '.', '.', '.' ,'.' ,'.'] , ['.', '.', '.', '.', 'X' ,'X' ,'.'], ['.', '.', '.', 'O', '.' ,'.' ,'O'], ['.', '.', '.', 'X', '.' ,'O' ,'.'], ['.', '.', '.', '.', '.' ,'.' ,'.'], ['.', '.', '.', '.', '.' ,'.' ,'.'], ['.', '.', '.', '.', '.' ,'.' ,'.']]).

printBoard(Tab):- tabuleiro(Tab), printTabuleiro(Tab).

printTabuleiro([H|T]):- write('         '), printLinha(H), write('\n'), printTabuleiro(T).
printTabuleiro([]).

printLinha([H|T]):- write(' '), write(H), write('  '),printLinha(T).
printLinha([]).
