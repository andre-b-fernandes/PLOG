leOpcao(XMin,XMax, X) :- pedeOpcao, read(X), X >= XMin, X =< XMax,!.
leOpcao(XMin, XMax, X):- mostraMensagemDeErro(XMin, XMax), leOpcao(XMin, XMax, X),!.


opcaoMenuInicial(1):- jogadorContraJogador.
opcaoMenuInicial(4):- abort.
/*opcaoMenuInicial(1):-
opcaoMenuInicial(1):-*/
