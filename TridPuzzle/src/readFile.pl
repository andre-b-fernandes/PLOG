
readFileTrid(Name, N, Clues):-
  open(Name, read, Stream),
  readSize(Stream, N),
  readClues(Clues,Stream),
  close(Stream).

  readSize(Stream, N):-
    read(Stream, N).

  readClues([],Stream):-at_end_of_stream(Stream).
  readClues([H|T], Stream):-
    read(Stream, H),
    H \= end_of_file,
    readClues(T, Stream).

  readClues(H,Stream):-readClues(H,Stream).
