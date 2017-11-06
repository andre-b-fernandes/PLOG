:- ensure_loaded('gameLogic.pl').
:- ensure_loaded('lear.pl').


start:-tabuleiroVazio(Tab),joga(Tab).

joga(Tab):- write('Linha: '),read(L), write('Coluna: '), read(C),setPeca(L,C,'x',Tab,TabOut),printTabuleiro(TabOut),joga(TabOut).
