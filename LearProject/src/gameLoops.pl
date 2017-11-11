:- use_module(library(random)).

menu:- mostraLogo, mostraOpcoesMenuInicial, leOpcao(1,4,X), opcaoMenuInicial(X), menu.


/*JOGADOR VS JOGADOR*/
jogadorContraJogador:-
  tabuleiroVazio(X),
  printBoard(X),
  pecaJogadorUm(A),
  pecaJogadorDois(B),
  jogaJogadorContraJogador(X,A,B).

jogaJogadorContraJogador(Tabuleiro, PecaJogadorUm, PecaJogadorDois):-
  sinalizaJogadorUm,
  jogaJogador(PecaJogadorUm, Tabuleiro, TabuleiroOut),
  printBoard(TabuleiroOut),
  \+verificaFim(TabuleiroOut),
  sinalizaJogadorDois,
  jogaJogador(PecaJogadorDois, TabuleiroOut, TabuleiroOut2),
  printBoard(TabuleiroOut2),
  \+verificaFim(TabuleiroOut2),
  jogaJogadorContraJogador(TabuleiroOut2,PecaJogadorUm,PecaJogadorDois).

jogaJogadorContraJogador(_,_,_).

jogaJogador(Peca, Tabuleiro, TabOut):-
  pedeLinha,
  leOpcao(1,7,NLinha),
  pedeColuna,
  leOpcao(1,7,NColuna),
  validaJogada(Tabuleiro, NColuna,NLinha),
  setPeca(NLinha, NColuna, Peca,Tabuleiro, TabOut2),
  verificaJogada(TabOut2, NLinha, NColuna, Peca,  TabOut),!.

jogaJogador(Peca,Tabuleiro,TabOut):- mostraMensagemJogadaInvalida, jogaJogador(Peca,Tabuleiro,TabOut).


/*PC VS PC*/
jogaPC(Peca,Tabuleiro,TabOut):-
  random_between(1,7,NLinha),
  random_between(1,7,NColuna),
  jogadaPC(NLinha,NColuna),
  validaJogada(Tabuleiro, NColuna,NLinha),
  setPeca(NLinha, NColuna, Peca,Tabuleiro, TabOut2),
  verificaJogada(TabOut2, NLinha, NColuna, Peca,  TabOut),!.

jogaPC(Peca,Tabuleiro,TabOut):- mostraMensagemJogadaInvalida, jogaPC(Peca,Tabuleiro,TabOut).
