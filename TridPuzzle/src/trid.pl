:-use_module(library(clpfd)).
:-use_module(library(lists)).

resolveTrid(Lado, Somas, Triangulo):-
  criaTriangulo(Lado,Triangulo),
  defineDominio(Lado,Triangulo),
  dominioDiagonalEsquerda(Triangulo, 0, Lado),
  L is Lado - 1,
  dominioDiagonalDireita(Triangulo, L),
  !,
  dominioSomas(Triangulo, Somas),
  tridLabel(Triangulo).

  

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
  all_distinct(H),
  defineDominioTriangulo(Lado, T).

dominioDiagonalEsquerda(_,_,1).
dominioDiagonalEsquerda(Triangulo,NumeroElemento,NumeroMaxLista):-
  dominioDiagonalEsquerdaAux(Triangulo, Lista, NumeroElemento, NumeroMaxLista),
  all_distinct(Lista),
  NewNumero is NumeroElemento + 1,
  NewMax is NumeroMaxLista - 1,
  dominioDiagonalEsquerda(Triangulo,NewNumero,NewMax).

dominioDiagonalDireita(_,0).
dominioDiagonalDireita(Triangulo, NumeroElemento):-
  dominioDiagonalDireitaAux(Triangulo, Lista, NumeroElemento),
  all_distinct(Lista),
  NewNumero is NumeroElemento - 1,
  dominioDiagonalDireita(Triangulo,NewNumero).

dominioDiagonalDireitaAux(_,[],-1).
dominioDiagonalDireitaAux([L|R], [H|T], NumeroElemento):-
  nth0(NumeroElemento, L, H),
  NewNumero is NumeroElemento - 1,
  dominioDiagonalDireitaAux(R,T,NewNumero).


dominioDiagonalEsquerdaAux(_,[],_,0).
dominioDiagonalEsquerdaAux([L|R], [H|T], NumeroElemento, NumeroMaxLista):-
  nth0(NumeroElemento, L, H),
  NewMax is NumeroMaxLista - 1,
  dominioDiagonalEsquerdaAux(R,T,NumeroElemento, NewMax).

dominioSomas(_, []).
dominioSomas(Triangulo, [Val - H|T]):-
  formaLista(Triangulo, H, Lista),
  !,
  sum(Lista, #=, Val),
  dominioSomas(Triangulo, T).

formaLista(_,[],[]).
formaLista(Triangulo, [C|R], [H|T]):-
  formaListaAux(Triangulo, C, H),
  formaLista(Triangulo, R, T).

formaListaAux([Linha|Resto], Contador, Valor):-
  formaListaAuxLinha(Linha, Resto, Contador, Valor).

formaListaAuxLinha([H|_],_, 1, H).
formaListaAuxLinha([],Resto,Contador,Valor):-formaListaAux(Resto, Contador,Valor).
formaListaAuxLinha([_|T], Resto, Contador,Valor):-
  Cont is Contador - 1,
  formaListaAuxLinha(T, Resto, Cont, Valor).



tridLabel([]).
tridLabel([H|T]):-
  labeling([],H),
  tridLabel(T).
