:- use_module(library(lists)).

/*MANIPULAR O TABULEIRO*/


getPeca(NLinha, NColuna, Tabuleiro, Peca):- getPecaLinha(NLinha,Tabuleiro,Linha), getPecaColuna(NColuna, Linha, Peca).

getPecaLinha(NLinha, [_|T], Linha):- Previous is NLinha-1, getPecaLinha(Previous, T, Linha).
getPecaLinha(1, [H|_], H).

getPecaColuna(NColuna, [_|T], Peca):- Previous is NColuna-1, getPecaColuna(Previous, T, Peca).
getPecaColuna(1, [H|_], H).

setPeca(NLinha, NColuna, Peca,TabIn, TabOut):- setPecaLinha(NLinha, NColuna,TabIn, Peca, TabOut).

setPecaLinha(NLinha, NColuna, [H|T], Peca, [H|R]):- Previous is NLinha-1, setPecaLinha(Previous, NColuna, T, Peca, R).

setPecaLinha(1, NColuna, [H|T], Peca, [I|T]) :- setPecaColuna(NColuna,H,Peca,I).

setPecaColuna(NColuna,[P|Resto],Peca,[P|Mais]) :- Previous is NColuna-1, setPecaColuna(Previous, Resto,Peca,Mais).

setPecaColuna(1,[_| Resto],Peca,[Peca|Resto]).

/*LINHA*/

viraPecasLinha([],_,[]).
viraPecasLinha(['e'|R],Peca,['e'|T]):-viraPecasLinha(R,Peca,T), !.
viraPecasLinha([_|R],Peca,[Peca|T]):-viraPecasLinha(R,Peca,T), !.

verificaViraPecasLinha(Linha, NColuna,Peca):-
  contaPecasLinha(Linha, Peca, C),
  C == 2,
  verificaEspacosLinha(Linha,NColuna,Peca).


/*posicoesPeca(Linha, Peca, Pos, Po):- posicaoPeca(Linha, )

posicaoPeca([Peca|_], Peca, 1).
posicaoPeca([_|T], Peca, Pos):- posicaoPeca(T, Peca, NewPos), Pos is NewPos + 1.*/


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

avancaLinha([_|Resto],NColuna,LinhaAvancada):-
  Nc is NColuna-1,
  avancaLinha(Resto,Nc,LinhaAvancada).

verificaAtras([Peca|_],2,Peca).

verificaAtras([Peca|Resto], NColuna, Peca):-
  Nc is NColuna-1,
  verificaAtrasPeca(Resto, Nc).

verificaAtras([_|Resto], NColuna, Peca):-
  Nc is NColuna-1,
  verificaAtras(Resto, Nc,Peca).

verificaAtrasPeca([_|_], 1).

verificaAtrasPeca([P|Resto], NColuna):-
  P \= 'e',
  Nc is NColuna-1,
  verificaAtrasPeca(Resto,Nc).

verificaFrente([Peca|_],_,Peca).

verificaFrente([P|Resto],NColuna,Peca):-
  P\='e',
  Nc is NColuna+1,
  Nc =< 7,
  verificaFrente(Resto,Nc,Peca).


/*COLUNAS*/
contaPecasColuna([],_,_,0).
contaPecasColuna([Linha|Mais], Coluna, Peca, N):-
  nth1(Coluna, Linha, Peca),
  contaPecasColuna(Mais, Coluna, Peca, Alguns),
  N is Alguns + 1.
contaPecasColuna([_|Mais], Coluna,Peca,N):-contaPecasColuna(Mais, Coluna, Peca, N).

verificaFrenteColuna([Linha|_],_, NColuna, Peca):-nth1(NColuna,Linha,Peca).
verificaFrenteColuna([Linha|Resto], NLinha, NColuna, Peca):-
   nth1(NColuna, Linha,X),
   X \= 'e',
   Nl is NLinha + 1,
   Nl =< 7,
   verificaFrenteColuna(Resto,Nl, NColuna, Peca).


verificaAtrasColuna([Linha|_],2,NColuna,Peca):- nth1(NColuna,Linha,Peca).
verificaAtrasColuna([Linha|Resto], NLinha, NColuna, Peca):-
  nth1(NColuna,Linha, Peca),
  Nl is NLinha -1,
  verificaAtrasColunaPeca(Resto,Nl, NColuna).
verificaAtrasColuna([_|Resto], NLinha, NColuna, Peca):-
  Nl is NLinha - 1,
  verificaAtrasColuna(Resto, Nl, NColuna, Peca).

verificaAtrasColunaPeca([_|_], 1, _).
verificaAtrasColunaPeca([Linha|Resto], NLinha, NColuna):-
   nth1(NColuna, Linha, X),
   X \= 'e',
   Nl is NLinha -1,
   verificaAtrasColunaPeca(Resto, Nl, NColuna).


verificaEspacosColuna(Tabuleiro, NLinha, NColuna, Peca):-
  verificaAtrasColuna(Tabuleiro, NLinha, NColuna, Peca);
  avancaLinha(Tabuleiro, NLinha, RestoTab),
  verificaFrenteColuna(RestoTab, NLinha, NColuna, Peca).

verificaViraPecasColuna(Tabuleiro, NLinha, NColuna, Peca):-
  contaPecasColuna(Tabuleiro, NColuna, Peca, C),
  !,
  C == 2,
  verificaEspacosColuna(Tabuleiro, NLinha, NColuna, Peca).

viraPecasColuna([], _,_,[]).
viraPecasColuna([Linha|T], Peca, NColuna, [L|R]):- alteraPecaColuna(Linha, NColuna, Peca, L), viraPecasColuna(T, Peca, NColuna,R).

alteraPecaColuna(['e'|T], 1,_,['e'|T]).
alteraPecaColuna([_|T], 1, Peca,[Peca|T]).
alteraPecaColuna([P|T], NColuna, Peca, [P|R]):-Nc is NColuna - 1, alteraPecaColuna(T, Nc, Peca, R).


verificaFimDoJogo([]).
verificaFimDoJogo([Linha|T]):-verificaFimDoJogoLinha(Linha), verificaFimDoJogo(T).

verificaFimDoJogoLinha([]).
verificaFimDoJogoLinha([P|T]):- P\='e', verificaFimDoJogoLinha(T).












/*lel*/
