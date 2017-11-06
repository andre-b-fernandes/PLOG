/*MANIPULAR O TABULEIRO*/

getPeca(NLinha, NColuna, Tabuleiro, Peca):- getPecaLinha(NLinha,Tabuleiro,Linha), getPecaColuna(NColuna, Linha, Peca).

getPecaLinha(NLinha, [H|T], Linha):- Previous is NLinha-1, getPecaLinha(Previous, T, Linha).
getPecaLinha(1, [H|T], H).

getPecaColuna(NColuna, [H|T], Peca):- Previous is NColuna-1, getPecaColuna(Previous, T, Peca).
getPecaColuna(1, [H|T], H).

setPeca(NLinha, NColuna, Peca,TabIn, TabOut):- setPecaLinha(NLinha, NColuna,TabIn, Peca, TabOut).

setPecaLinha(NLinha, NColuna, [H|T], Peca, [H|R]):- Previous is NLinha-1, setPecaLinha(Previous, NColuna, T, Peca, R).

setPecaLinha(1, NColuna, [H|T], Peca, [I|T]) :- setPecaColuna(NColuna,H,Peca,I).

setPecaColuna(NColuna,[P|Resto],Peca,[P|Mais]) :- Previous is NColuna-1, setPecaColuna(Previous, Resto,Peca,Mais).

setPecaColuna(1,[_| Resto],Peca,[Peca|Resto]).

/*LINHA*/

viraPecasLinha([],Peca,[]).
viraPecasLinha([Peca|R],Peca,[Peca|T]):-viraPecasLinha(R,Peca,T).
viraPecasLinha(['e'|R],Peca,['e'|T]):-viraPecasLinha(R,Peca,T).
viraPecasLinha([P|R],Peca,[Peca|T]):-viraPecasLinha(R,Peca,T).

verificaViraPecasLinha(Linha, NColuna,Peca):-
  contaPecasLinha(Linha, Peca, C),
  C == 2,
  verificaEspacosLinha(Linha,NColuna,Peca).


contaPecasLinha([],_,0).

contaPecasLinha([P|R], Peca, N):-
  P\=Peca,
  contaPecasLinha(R, Peca, N).

contaPecasLinha([Peca|Resto], Peca,N):-
  contaPecasLinha(Resto, Peca, Na),
  N is Na+1.

verificaEspacosLinha(Linha,NColuna,Peca):-
  verificaAtras(Linha,NColuna,Peca);
  avancaLinha(Linha,NColuna,NovaLinha),
  verificaFrente(NovaLinha,NColuna,Peca).

avancaLinha([P|Resto],0,[P|Resto]).

avancaLinha([P|Resto],NColuna,LinhaAvancada):-
  Nc is NColuna-1,
  avancaLinha(Resto,Nc,LinhaAvancada).

verificaAtras([Peca|Resto],2,Peca).

verificaAtras([Peca|Resto], NColuna, Peca):-
  Nc is NColuna-1,
  verificaAtrasPeca(Resto, Nc).

verificaAtras([P|Resto], NColuna, Peca):-
  Nc is NColuna-1,
  verificaAtras(Resto, Nc,Peca).

verificaAtrasPeca([P|Resto], 1).

verificaAtrasPeca([P|Resto], NColuna):-
  P \= 'e',
  Nc is NColuna-1,
  verificaAtrasPeca(Resto,Nc).

verificaFrente([Peca|Resto],NColuna,Peca).

verificaFrente([P|Resto],NColuna,Peca):-
  P\='e',
  Nc is NColuna+1,
  Nc =< 7,
  verificaFrente(Resto,Nc,Peca).


/*COLUNAS*/

contaPecasColuna([],_,_,0).
contaPecasColuna([L|T], NColuna, Peca,Contagem):- contaPecasColuna(T,NColuna,Peca,NovaContagem), contaLinha(L, NColuna, Peca),Contagem is NovaContagem + 1.

contaLinha([Peca|T],1,Peca).
contaLinha([P|T],NColuna,Peca):-Nc is NColuna-1, contaLinha(T,Nc,Peca).
