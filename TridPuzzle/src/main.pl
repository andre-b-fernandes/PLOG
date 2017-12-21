:-ensure_loaded('trid.pl').
:-ensure_loaded('menus.pl').
:-ensure_loaded('readFile.pl').
:-ensure_loaded('visualizacao.pl').


start:-menu.
start:- naoHaSolucoes, menu.
