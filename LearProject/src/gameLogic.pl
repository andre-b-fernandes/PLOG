contaPecasLinha([],_,0).
contaPecasLinha([P|R], Peca, N):- P\=Peca, contaPecasLinha(R, Peca, N).
contaPecasLinha([Peca|Resto], Peca,N):-contaPecasLinha(Resto, Peca, Na), N is Na+1.


verificaEspacoAtras([P|R], NColuna):- Na is NColuna - 1, verificaEspacoAtras(R, Na).
verificaEspacoAtras([P|Resto], 2):- P \='.' .

verificaEspacoFrente([P|R],NColuna):- Na is NColuna - 1, verificaEspacoFrente(R,Na).
verificaEspacoFrente([P|R],1):- verificaFrente(R, 1).

verificaFrente([P|R], 7):- P\= '.'.
verificaFrente([P|R], Posicao):- P \= '.' , Pos is Posicao + 1, verificaFrente(R,Pos).
