:-use_module(library(clpfd)).
:-use_module(library(lists)).


criaTriangulo(Lado, Triangulo):- geraTriangulo(Lado,Triangulo).

geraTriangulo(0, []).
geraTriangulo(Lado, [H|T]):-
  geraCamada(Lado, H),
  NewLado is Lado - 1,
  geraTriangulo(NewLado, T).

geraCamada(0, [] ).
geraCamada(Lado, [_|T]):- NewLado is Lado - 1, geraCamada(NewLado, T).

defineDominio(Lado, Piramide):-defineDominioTriangulo(Lado,Piramide).

defineDominioTriangulo(Lado, [H|T]):-
  all_different(H),
  defineDominioLinha(Lado, H),
  defineDominioTriangulo(Lado, T).
