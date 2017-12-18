:-use_module(library(clpfd)).
:-use_module(library(lists)).



resolveTrid(Lado, Triangulo):- criaTriangulo(Lado, Triangulo), defineDominio(Lado, Triangulo), tridLabel(Triangulo).

criaTriangulo(Lado, Triangulo):- geraTriangulo(Lado,Triangulo).

geraTriangulo(0, []).
geraTriangulo(Lado, [H|T]):-
  geraCamada(Lado, H),
  NewLado is Lado - 1,
  geraTriangulo(NewLado, T).

geraCamada(0, [] ).
geraCamada(Lado, [_|T]):- NewLado is Lado - 1, geraCamada(NewLado, T).

defineDominio(Lado, Piramide):-defineDominioTriangulo(Lado,Piramide).

defineDominioTriangulo(_, []).
defineDominioTriangulo(Lado, [H|T]):-
  domain(H, 1, Lado),
  all_different(H),
  defineDominioTriangulo(Lado, T).


tridLabel([]).
tridLabel([H|T]):-
  labeling([],H),
  tridLabel(T).
