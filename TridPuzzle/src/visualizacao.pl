:-use_module(library(lists)).

displayLogo:-write('        TRID \n').

naoHaSolucoes:-write('      Nao se encontraram solucoes!\n\n\n\n').

displayInputInicial:- write('       Nome do ficheiro a resolver(s para sair): ').

tempoDeExecucao(ExecutionTime):-  write('Execution took '), write(ExecutionTime), write(' ms.'), nl.

mostraTrid(Triangulo):-
  write('\n'),
  length(Triangulo, Tam),
  Tamanho is Tam + 10,
  reverse(Triangulo, TrianguloAux),
  mostraTridAux(TrianguloAux, Tamanho).

mostraTridAux([],_).
mostraTridAux([H|T], Tamanho):-
  mostraEspaco(Tamanho),
  mostraLinha(H),
  NewTam is Tamanho - 1,
  mostraTridAux(T, NewTam).

mostraLinha([]):- write('\n').
mostraLinha([H|T]):-
  write(H),
  write('   '),
  mostraLinha(T).

mostraEspaco(1).
mostraEspaco(Tamanho):-
  write('  '),
  NewTam is Tamanho - 1,
  mostraEspaco(NewTam).
