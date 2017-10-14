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

tabuleiro([]).
tabuleiro([X|S]):-tabuleiro(S).

tabuleiro([['_', '_', '_', '_', '_' ,'_' ,'_'] , ['_', '_', '_', '_', '_' ,'_' ,'_'], ['_', '_', '_', '_', '_' ,'_' ,'_'], ['_', '_', '_', '_', '_' ,'_' ,'_'], ['_', '_', '_', '_', '_' ,'_' ,'_'], ['_', '_', '_', '_', '_' ,'_' ,'_'], ['_', '_', '_', '_', '_' ,'_' ,'_']]).

printBoard(Tab):- tabuleiro(Tab), printTabuleiro(Tab).

printTabuleiro([H|T]):- printLinha(H), write('\n'), printTabuleiro(T).
printTabuleiro([]).

printLinha([H|T]):- write(H), write('  '),printLinha(T).
printLinha([]).




