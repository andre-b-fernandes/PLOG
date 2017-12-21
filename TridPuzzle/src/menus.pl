
menu:-
  displayLogo,
  displayInputInicial,
  leFicheiro(S),
  S \= 's',
  readFileTrid(S, Lado, Clues),
  statistics(walltime, [Start|_]),
  !,
  resolveTrid(Lado,Clues,Triangulo),
  statistics(walltime, [Stop|_]),
  ExecutionTime is  Stop - Start,
  tempoDeExecucao(ExecutionTime),
  mostraTrid(Triangulo),
  menu.

menu.

leFicheiro(S):-read(S).
