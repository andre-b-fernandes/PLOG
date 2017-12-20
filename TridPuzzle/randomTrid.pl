

  geraClues(Triangulo, N, Lado, Clues):-
    formaPossibilidades(Lado,1, Lista),
    L1 is Lado - 2,
    L2 is Lado - 1,
    Max is L1 + L2 + Lado,
    geraCluesAux(Triangulo, N,Max,Lista, Clues).

  formaPossibilidades(1, Lado, Lado).
  formaPossibilidades(Lado, Lado, [Lado|R]):-
    NewLado is Lado -1,
    NewContador is Lado + 1,
    formaPossibilidades(NewLado, NewContador, R).

  formaPossibilidades(Lado,Contador,[Contador|R]):-
    NewCont is Contador + 1,
    formaPossibilidades(Lado, NewCont, R).

  geraCluesAux(_, 0, _, _, []).
  geraCluesAux(Triangulo, N, Max, Lista, [Clue|Resto]):-
    geraClue(Triangulo, Max, Lista, ListaOut, Clue),
    New is N - 1,
    geraCluesAux(Triangulo, New, Max, ListaOut, Resto).


  geraClue(Triangulo, Max, Lista, ListaOut, Valor - [Primeiro,Segundo,Terceiro]):-
    random(6, Max, Valor),
    MaxLista is length(Lista),
    random(1, MaxLista, PrimeiroAux),
    retornaPrimeiro(Triangulo, PrimeiroAux, Lista, Primeiro),
    geraSegundo(Triangulo, Primeiro, Segundo),
    geraTerceiro(Triangulo,Primeiro, Terceiro),
    alteraPossibilidades(Primeiro, ListaOut).


  retornaPrimeiro(Triangulo, 1,[Primeiro|_], Primeiro).
  retornaPrimeiro(Triangulo, PrimeiroAux,[H|T],Primeiro):-
    NewPrimeiro is PrimeiroAux - 1,
    retornaPrimeiro(PrimeiroAux, T, Primeiro).
