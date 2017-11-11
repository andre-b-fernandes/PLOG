menu:- mostraLogo, mostraOpcoesMenuInicial, leOpcao(1,4,X), opcaoMenuInicial(X), menu.


jogadorContraJogador:- tabuleiroVazio(X), printBoard(X), jogaJogadorContraJogador(X).

jogaJogadorContraJogador(Tabuleiro):-
  sinalizaJogadorUm,
  jogaJogador('x', Tabuleiro, TabuleiroOut),
  printBoard(TabuleiroOut),
  sinalizaJogadorDois,
  jogaJogador('o', TabuleiroOut, TabuleiroOut2),
  printBoard(TabuleiroOut2),
  ((verificaFimDoJogo(TabuleiroOut2) -> ! );
   jogaJogadorContraJogador(TabuleiroOut2)).

jogaJogador(Peca, Tabuleiro, TabOut):-
  pedeLinha,
  leOpcao(1,7,NLinha),
  pedeColuna,
  leOpcao(1,7,NColuna),
  validaJogada(Tabuleiro, NLinha,NColuna),
  setPeca(NLinha, NColuna, Peca,Tabuleiro, TabOut2),
  verificaJogada(TabOut2, NLinha, NColuna, Peca,  TabOut).

jogaJogador(Peca,Tabuleiro,TabOut):- mostraMensagemJogadaInvalida, jogaJogador(Peca,Tabuleiro,TabOut). 
