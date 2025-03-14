% Ficha n. 1 ALGAV


% Questao 1
%

iterate(_,0,[]):-!.
iterate([A|B],TAMANHO,[[A|B],LISTADECAMINHOS]):-TAMANHO1 is TAMANHO-1,last(B,C),delete(B,C,D) ,iterate([C,A|D],TAMANHO1,LISTADECAMINHOS).

iterate2(_,0,[]):-!.
iterate2([A|B],TAMANHO,F):-TAMANHO1 is TAMANHO-1,last(B,C),delete(B,C,D),iterate2([C,A|D],TAMANHO1,X),append([A|B],X,F).

continente(africa).
continente(america).
continente(asia).
continente(europa).
continente(oceania).

:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_parameters)).
:- http_handler('/lapr5',responde_ola,[]).
:- http_handler('/create_path', path_creator, []).
responde_ola(_Request) :-
        format('Content-type: text/plain~n~n'),
        format('Ol� Albertino!~n').
server(Port) :-
        http_server(http_dispatch, [port(Port)]).
path_creator(Request):-
  http_parameters(Request,
                    [ truck(TRUCK, []),
                      date(DATE, [between(20220101,20221231)])
                    ]),
  voltamaiscedo(TRUCK,DATE,T,L),
  format('Content-type: text/plain~n~n'),
  format('User registered!~n'),
  format('Truck: ~w~n', [TRUCK]),
  format('Tempo: ~10f~nLista: ~w~n',[T,L]).


voltamaiscedo(TRUCK,DIA,TEMPO_FINAL,LFINAL):-
        format('TRUCK: ~w~n',[TRUCK]),
        carateristicasCam(TRUCK,_,_,BAT_INICIAL,_,_),
        bateriamaxima(TRUCK,BAT_MAX),
        bateriaminima(TRUCK,BAT_MIN),
        pesomaximo(TRUCK,PESO_MAXIMO),
        pesototal(TRUCK,PESOTOTAL),
        calcula_trajetoria([A|LT],DIA),
        trata_lista(A,TEMPO,PESO_MAXIMO,PESOTOTAL,BAT_MAX,BAT_MIN,BAT_INICIAL,TRUCK,DIA),
        itera(DIA,TRUCK,BAT_INICIAL,BAT_MAX,BAT_MIN,PESO_MAXIMO,PESOTOTAL,LT,TEMPO,A,LFINAL),
        !,
        trata_lista(LFINAL,TEMPO_FINAL,PESO_MAXIMO,PESOTOTAL,BAT_MAX,BAT_MIN,BAT_INICIAL,TRUCK,DIA).


save(File_name,Term) :-
    string_concat("PROLOG/",File_name,Path),
    term_to_atom(Term,Atom),
    atom_string(String,Atom),
    (open(Path,write,Stream1),
    write(Stream1,String),
    close(Stream1)),!.
% dadosCam_t_e_ta(<nome_camiao>,<cidade_origem>,<cidade_destino>,<tempo>,<energia>,<tempo_adicional>).
%


dadosCam_t_e_ta(eTruck01,1,2,122,42,0).
dadosCam_t_e_ta(eTruck01,1,3,122,46,0).
dadosCam_t_e_ta(eTruck01,1,4,151,54,25).
dadosCam_t_e_ta(eTruck01,1,5,147,52,25).
dadosCam_t_e_ta(eTruck01,1,6,74,24,0).
dadosCam_t_e_ta(eTruck01,1,7,116,35,0).
dadosCam_t_e_ta(eTruck01,1,8,141,46,0).
dadosCam_t_e_ta(eTruck01,1,9,185,74,53).
dadosCam_t_e_ta(eTruck01,1,10,97,30,0).
dadosCam_t_e_ta(eTruck01,1,11,164,64,40).
dadosCam_t_e_ta(eTruck01,1,12,76,23,0).
dadosCam_t_e_ta(eTruck01,1,13,174,66,45).
dadosCam_t_e_ta(eTruck01,1,14,59,18,0).
dadosCam_t_e_ta(eTruck01,1,15,132,51,24).
dadosCam_t_e_ta(eTruck01,1,16,181,68,45).
dadosCam_t_e_ta(eTruck01,1,17,128,45,0).

dadosCam_t_e_ta(eTruck01,2,1,116,42,0).
dadosCam_t_e_ta(eTruck01,2,3,55,22,0).
dadosCam_t_e_ta(eTruck01,2,4,74,25,0).
dadosCam_t_e_ta(eTruck01,2,5,65,22,0).
dadosCam_t_e_ta(eTruck01,2,6,69,27,0).
dadosCam_t_e_ta(eTruck01,2,7,74,38,0).
dadosCam_t_e_ta(eTruck01,2,8,61,18,0).
dadosCam_t_e_ta(eTruck01,2,9,103,44,0).
dadosCam_t_e_ta(eTruck01,2,10,36,14,0).
dadosCam_t_e_ta(eTruck01,2,11,88,41,0).
dadosCam_t_e_ta(eTruck01,2,12,61,19,0).
dadosCam_t_e_ta(eTruck01,2,13,95,42,0).
dadosCam_t_e_ta(eTruck01,2,14,78,34,0).
dadosCam_t_e_ta(eTruck01,2,15,69,30,0).
dadosCam_t_e_ta(eTruck01,2,16,99,38,0).
dadosCam_t_e_ta(eTruck01,2,17,46,14,0).

dadosCam_t_e_ta(eTruck01,3,1,120,45,0).
dadosCam_t_e_ta(eTruck01,3,2,50,22,0).
dadosCam_t_e_ta(eTruck01,3,4,46,15,0).
dadosCam_t_e_ta(eTruck01,3,5,46,14,0).
dadosCam_t_e_ta(eTruck01,3,6,74,37,0).
dadosCam_t_e_ta(eTruck01,3,7,63,23,0).
dadosCam_t_e_ta(eTruck01,3,8,38,8,0).
dadosCam_t_e_ta(eTruck01,3,9,84,36,0).
dadosCam_t_e_ta(eTruck01,3,10,59,28,0).
dadosCam_t_e_ta(eTruck01,3,11,61,27,0).
dadosCam_t_e_ta(eTruck01,3,12,67,32,0).
dadosCam_t_e_ta(eTruck01,3,13,67,29,0).
dadosCam_t_e_ta(eTruck01,3,14,82,38,0).
dadosCam_t_e_ta(eTruck01,3,15,34,8,0).
dadosCam_t_e_ta(eTruck01,3,16,80,30,0).
dadosCam_t_e_ta(eTruck01,3,17,36,10,0).

dadosCam_t_e_ta(eTruck01,4,1,149,54,25).
dadosCam_t_e_ta(eTruck01,4,2,65,24,0).
dadosCam_t_e_ta(eTruck01,4,3,46,16,0).
dadosCam_t_e_ta(eTruck01,4,5,27,10,0).
dadosCam_t_e_ta(eTruck01,4,6,103,47,0).
dadosCam_t_e_ta(eTruck01,4,7,55,27,0).
dadosCam_t_e_ta(eTruck01,4,8,36,10,0).
dadosCam_t_e_ta(eTruck01,4,9,50,26,0).
dadosCam_t_e_ta(eTruck01,4,10,78,34,0).
dadosCam_t_e_ta(eTruck01,4,11,42,19,0).
dadosCam_t_e_ta(eTruck01,4,12,97,42,0).
dadosCam_t_e_ta(eTruck01,4,13,44,11,0).
dadosCam_t_e_ta(eTruck01,4,14,111,48,0).
dadosCam_t_e_ta(eTruck01,4,15,32,13,0).
dadosCam_t_e_ta(eTruck01,4,16,53,14,0).
dadosCam_t_e_ta(eTruck01,4,17,38,11,0).

dadosCam_t_e_ta(eTruck01,5,1,141,51,24).
dadosCam_t_e_ta(eTruck01,5,2,55,20,0).
dadosCam_t_e_ta(eTruck01,5,3,48,14,0).
dadosCam_t_e_ta(eTruck01,5,4,25,9,0).
dadosCam_t_e_ta(eTruck01,5,6,97,44,0).
dadosCam_t_e_ta(eTruck01,5,7,55,28,0).
dadosCam_t_e_ta(eTruck01,5,8,29,7,0).
dadosCam_t_e_ta(eTruck01,5,9,48,24,0).
dadosCam_t_e_ta(eTruck01,5,10,69,30,0).
dadosCam_t_e_ta(eTruck01,5,11,53,26,0).
dadosCam_t_e_ta(eTruck01,5,12,95,36,0).
dadosCam_t_e_ta(eTruck01,5,13,63,20,0).
dadosCam_t_e_ta(eTruck01,5,14,105,45,0).
dadosCam_t_e_ta(eTruck01,5,15,34,14,0).
dadosCam_t_e_ta(eTruck01,5,16,46,18,0).
dadosCam_t_e_ta(eTruck01,5,17,27,7,0).

dadosCam_t_e_ta(eTruck01,6,1,69,23,0).
dadosCam_t_e_ta(eTruck01,6,2,71,27,0).
dadosCam_t_e_ta(eTruck01,6,3,74,38,0).
dadosCam_t_e_ta(eTruck01,6,4,103,46,0).
dadosCam_t_e_ta(eTruck01,6,5,99,44,0).
dadosCam_t_e_ta(eTruck01,6,7,88,48,0).
dadosCam_t_e_ta(eTruck01,6,8,92,38,0).
dadosCam_t_e_ta(eTruck01,6,9,134,66,45).
dadosCam_t_e_ta(eTruck01,6,10,42,14,0).
dadosCam_t_e_ta(eTruck01,6,11,116,56,30).
dadosCam_t_e_ta(eTruck01,6,12,23,9,0).
dadosCam_t_e_ta(eTruck01,6,13,126,58,33).
dadosCam_t_e_ta(eTruck01,6,14,25,9,0).
dadosCam_t_e_ta(eTruck01,6,15,84,44,0).
dadosCam_t_e_ta(eTruck01,6,16,132,60,35).
dadosCam_t_e_ta(eTruck01,6,17,80,38,0).

dadosCam_t_e_ta(eTruck01,7,1,116,36,0).
dadosCam_t_e_ta(eTruck01,7,2,71,38,0).
dadosCam_t_e_ta(eTruck01,7,3,61,22,0).
dadosCam_t_e_ta(eTruck01,7,4,53,26,0).
dadosCam_t_e_ta(eTruck01,7,5,53,28,0).
dadosCam_t_e_ta(eTruck01,7,6,88,48,0).
dadosCam_t_e_ta(eTruck01,7,8,59,26,0).
dadosCam_t_e_ta(eTruck01,7,9,88,48,0).
dadosCam_t_e_ta(eTruck01,7,10,84,44,0).
dadosCam_t_e_ta(eTruck01,7,11,74,22,0).
dadosCam_t_e_ta(eTruck01,7,12,82,42,0).
dadosCam_t_e_ta(eTruck01,7,13,76,31,0).
dadosCam_t_e_ta(eTruck01,7,14,97,49,21).
dadosCam_t_e_ta(eTruck01,7,15,29,16,0).
dadosCam_t_e_ta(eTruck01,7,16,84,42,0).
dadosCam_t_e_ta(eTruck01,7,17,69,30,0).

dadosCam_t_e_ta(eTruck01,8,1,134,46,0).
dadosCam_t_e_ta(eTruck01,8,2,59,18,0).
dadosCam_t_e_ta(eTruck01,8,3,32,6,0).
dadosCam_t_e_ta(eTruck01,8,4,34,10,0).
dadosCam_t_e_ta(eTruck01,8,5,32,7,0).
dadosCam_t_e_ta(eTruck01,8,6,88,38,0).
dadosCam_t_e_ta(eTruck01,8,7,57,26,0).
dadosCam_t_e_ta(eTruck01,8,9,69,30,0).
dadosCam_t_e_ta(eTruck01,8,10,65,26,0).
dadosCam_t_e_ta(eTruck01,8,11,53,22,0).
dadosCam_t_e_ta(eTruck01,8,12,82,34,0).
dadosCam_t_e_ta(eTruck01,8,13,61,24,0).
dadosCam_t_e_ta(eTruck01,8,14,97,40,0).
dadosCam_t_e_ta(eTruck01,8,15,36,12,0).
dadosCam_t_e_ta(eTruck01,8,16,65,23,0).
dadosCam_t_e_ta(eTruck01,8,17,32,6,0).

dadosCam_t_e_ta(eTruck01,9,1,181,72,50).
dadosCam_t_e_ta(eTruck01,9,2,95,41,0).
dadosCam_t_e_ta(eTruck01,9,3,86,35,0).
dadosCam_t_e_ta(eTruck01,9,4,55,24,0).
dadosCam_t_e_ta(eTruck01,9,5,48,23,0).
dadosCam_t_e_ta(eTruck01,9,6,134,65,42).
dadosCam_t_e_ta(eTruck01,9,7,95,47,0).
dadosCam_t_e_ta(eTruck01,9,8,69,28,0).
dadosCam_t_e_ta(eTruck01,9,10,109,51,24).
dadosCam_t_e_ta(eTruck01,9,11,61,29,0).
dadosCam_t_e_ta(eTruck01,9,12,132,57,31).
dadosCam_t_e_ta(eTruck01,9,13,67,19,0).
dadosCam_t_e_ta(eTruck01,9,14,143,66,45).
dadosCam_t_e_ta(eTruck01,9,15,71,34,0).
dadosCam_t_e_ta(eTruck01,9,16,15,3,0).
dadosCam_t_e_ta(eTruck01,9,17,67,28,0).

dadosCam_t_e_ta(eTruck01,10,1,97,30,0).
dadosCam_t_e_ta(eTruck01,10,2,34,14,0).
dadosCam_t_e_ta(eTruck01,10,3,59,27,0).
dadosCam_t_e_ta(eTruck01,10,4,78,33,0).
dadosCam_t_e_ta(eTruck01,10,5,71,30,0).
dadosCam_t_e_ta(eTruck01,10,6,40,14,0).
dadosCam_t_e_ta(eTruck01,10,7,82,42,0).
dadosCam_t_e_ta(eTruck01,10,8,65,24,0).
dadosCam_t_e_ta(eTruck01,10,9,109,52,25).
dadosCam_t_e_ta(eTruck01,10,11,92,46,0).
dadosCam_t_e_ta(eTruck01,10,12,32,6,0).
dadosCam_t_e_ta(eTruck01,10,13,99,46,0).
dadosCam_t_e_ta(eTruck01,10,14,63,17,0).
dadosCam_t_e_ta(eTruck01,10,15,74,34,0).
dadosCam_t_e_ta(eTruck01,10,16,105,46,0).
dadosCam_t_e_ta(eTruck01,10,17,53,23,0).

dadosCam_t_e_ta(eTruck01,11,1,164,65,42).
dadosCam_t_e_ta(eTruck01,11,2,88,41,0).
dadosCam_t_e_ta(eTruck01,11,3,65,28,0).
dadosCam_t_e_ta(eTruck01,11,4,42,18,0).
dadosCam_t_e_ta(eTruck01,11,5,55,25,0).
dadosCam_t_e_ta(eTruck01,11,6,118,57,31).
dadosCam_t_e_ta(eTruck01,11,7,74,23,0).
dadosCam_t_e_ta(eTruck01,11,8,59,23,0).
dadosCam_t_e_ta(eTruck01,11,9,63,28,0).
dadosCam_t_e_ta(eTruck01,11,10,97,46,0).
dadosCam_t_e_ta(eTruck01,11,12,111,52,25).
dadosCam_t_e_ta(eTruck01,11,13,25,7,0).
dadosCam_t_e_ta(eTruck01,11,14,126,58,33).
dadosCam_t_e_ta(eTruck01,11,15,53,25,0).
dadosCam_t_e_ta(eTruck01,11,16,59,27,0).
dadosCam_t_e_ta(eTruck01,11,17,67,27,0).

dadosCam_t_e_ta(eTruck01,12,1,76,23,0).
dadosCam_t_e_ta(eTruck01,12,2,61,19,0).
dadosCam_t_e_ta(eTruck01,12,3,67,32,0).
dadosCam_t_e_ta(eTruck01,12,4,97,41,0).
dadosCam_t_e_ta(eTruck01,12,5,92,38,0).
dadosCam_t_e_ta(eTruck01,12,6,19,8,0).
dadosCam_t_e_ta(eTruck01,12,7,82,42,0).
dadosCam_t_e_ta(eTruck01,12,8,86,33,0).
dadosCam_t_e_ta(eTruck01,12,9,128,61,37).
dadosCam_t_e_ta(eTruck01,12,10,32,6,0).
dadosCam_t_e_ta(eTruck01,12,11,109,50,23).
dadosCam_t_e_ta(eTruck01,12,13,120,53,26).
dadosCam_t_e_ta(eTruck01,12,14,40,10,0).
dadosCam_t_e_ta(eTruck01,12,15,78,38,0).
dadosCam_t_e_ta(eTruck01,12,16,126,54,28).
dadosCam_t_e_ta(eTruck01,12,17,74,32,0).

dadosCam_t_e_ta(eTruck01,13,1,174,65,42).
dadosCam_t_e_ta(eTruck01,13,2,107,35,0).
dadosCam_t_e_ta(eTruck01,13,3,74,29,0).
dadosCam_t_e_ta(eTruck01,13,4,46,11,0).
dadosCam_t_e_ta(eTruck01,13,5,67,20,0).
dadosCam_t_e_ta(eTruck01,13,6,128,57,31).
dadosCam_t_e_ta(eTruck01,13,7,80,30,0).
dadosCam_t_e_ta(eTruck01,13,8,76,20,0).
dadosCam_t_e_ta(eTruck01,13,9,67,20,0).
dadosCam_t_e_ta(eTruck01,13,10,105,47,0).
dadosCam_t_e_ta(eTruck01,13,11,27,7,0).
dadosCam_t_e_ta(eTruck01,13,12,122,52,25).
dadosCam_t_e_ta(eTruck01,13,14,137,58,33).
dadosCam_t_e_ta(eTruck01,13,15,67,17,0).
dadosCam_t_e_ta(eTruck01,13,16,59,15,0).
dadosCam_t_e_ta(eTruck01,13,17,78,22,0).

dadosCam_t_e_ta(eTruck01,14,1,59,18,0).
dadosCam_t_e_ta(eTruck01,14,2,80,35,0).
dadosCam_t_e_ta(eTruck01,14,3,80,38,0).
dadosCam_t_e_ta(eTruck01,14,4,109,46,0).
dadosCam_t_e_ta(eTruck01,14,5,105,45,0).
dadosCam_t_e_ta(eTruck01,14,6,27,9,0).
dadosCam_t_e_ta(eTruck01,14,7,97,48,0).
dadosCam_t_e_ta(eTruck01,14,8,99,38,0).
dadosCam_t_e_ta(eTruck01,14,9,143,66,45).
dadosCam_t_e_ta(eTruck01,14,10,61,17,0).
dadosCam_t_e_ta(eTruck01,14,11,122,57,31).
dadosCam_t_e_ta(eTruck01,14,12,42,10,0).
dadosCam_t_e_ta(eTruck01,14,13,132,58,35).
dadosCam_t_e_ta(eTruck01,14,15,90,44,0).
dadosCam_t_e_ta(eTruck01,14,16,139,61,37).
dadosCam_t_e_ta(eTruck01,14,17,86,38,0).

dadosCam_t_e_ta(eTruck01,15,1,132,51,24).
dadosCam_t_e_ta(eTruck01,15,2,74,30,0).
dadosCam_t_e_ta(eTruck01,15,3,34,8,0).
dadosCam_t_e_ta(eTruck01,15,4,36,12,0).
dadosCam_t_e_ta(eTruck01,15,5,36,14,0).
dadosCam_t_e_ta(eTruck01,15,6,86,44,0).
dadosCam_t_e_ta(eTruck01,15,7,34,16,0).
dadosCam_t_e_ta(eTruck01,15,8,42,13,0).
dadosCam_t_e_ta(eTruck01,15,9,71,35,0).
dadosCam_t_e_ta(eTruck01,15,10,82,36,0).
dadosCam_t_e_ta(eTruck01,15,11,53,25,0).
dadosCam_t_e_ta(eTruck01,15,12,80,38,0).
dadosCam_t_e_ta(eTruck01,15,13,69,18,0).
dadosCam_t_e_ta(eTruck01,15,14,95,45,0).
dadosCam_t_e_ta(eTruck01,15,16,69,29,0).
dadosCam_t_e_ta(eTruck01,15,17,53,17,0).

dadosCam_t_e_ta(eTruck01,16,1,179,68,45).
dadosCam_t_e_ta(eTruck01,16,2,92,37,0).
dadosCam_t_e_ta(eTruck01,16,3,84,31,0).
dadosCam_t_e_ta(eTruck01,16,4,57,16,0).
dadosCam_t_e_ta(eTruck01,16,5,46,18,0).
dadosCam_t_e_ta(eTruck01,16,6,132,60,35).
dadosCam_t_e_ta(eTruck01,16,7,92,42,0).
dadosCam_t_e_ta(eTruck01,16,8,67,23,0).
dadosCam_t_e_ta(eTruck01,16,9,15,3,0).
dadosCam_t_e_ta(eTruck01,16,10,105,46,0).
dadosCam_t_e_ta(eTruck01,16,11,57,28,0).
dadosCam_t_e_ta(eTruck01,16,12,130,52,25).
dadosCam_t_e_ta(eTruck01,16,13,61,15,0).
dadosCam_t_e_ta(eTruck01,16,14,141,61,37).
dadosCam_t_e_ta(eTruck01,16,15,69,29,0).
dadosCam_t_e_ta(eTruck01,16,17,65,24,0).

dadosCam_t_e_ta(eTruck01,17,1,128,46,0).
dadosCam_t_e_ta(eTruck01,17,2,42,14,0).
dadosCam_t_e_ta(eTruck01,17,3,40,11,0).
dadosCam_t_e_ta(eTruck01,17,4,42,13,0).
dadosCam_t_e_ta(eTruck01,17,5,34,10,0).
dadosCam_t_e_ta(eTruck01,17,6,82,38,0).
dadosCam_t_e_ta(eTruck01,17,7,74,30,0).
dadosCam_t_e_ta(eTruck01,17,8,29,6,0).
dadosCam_t_e_ta(eTruck01,17,9,69,31,0).
dadosCam_t_e_ta(eTruck01,17,10,55,24,0).
dadosCam_t_e_ta(eTruck01,17,11,69,29,0).
dadosCam_t_e_ta(eTruck01,17,12,80,30,0).
dadosCam_t_e_ta(eTruck01,17,13,82,23,0).
dadosCam_t_e_ta(eTruck01,17,14,90,38,0).
dadosCam_t_e_ta(eTruck01,17,15,53,18,0).
dadosCam_t_e_ta(eTruck01,17,16,67,25,0).

%entrega(<idEntrega>,<data>,<massaEntrefa>,<armazemEntrega>,<tempoColoc>,<tempoRet>)

entrega(4400, 20221205, 200, 1,8,10).
entrega(4438, 20221205, 150, 9, 7, 9).
entrega(4445, 20221205, 100, 3, 5, 7).
entrega(4443, 20221205, 120, 8, 6, 8).
%entrega(4449, 20221205, 300, 11, 15, 20).
%entrega(4398, 20221205, 310, 17, 16, 20).
%entrega(4432, 20221205, 270, 14, 14, 18).


listaentregas(E,DIA):-findall(A,entrega(_,DIA,_,A,_,_),E).

metodo([],_,[]).
metodo([H|T],M,[H2|F]):-append([M|H], [M], H2), metodo(T,M,F).

calcula_trajetoria(LT,DIA):-partida_chegada(PC),listaentregas(LA,DIA), findall(LAC, permutation(LA, LAC), LT2), metodo(LT2, PC, LT).

partida_chegada(5).

% agrega os predicados, recebendo todas as
% trajetorias possiveis para os caminhos dados, devolve o caminho mais
% rapido e o respetivo tempo
voltamaiscedo(TRUCK,DIA,TEMPOFINAL,LFINAL):-carateristicasCam(TRUCK,_,_,BATINICIAL,_,_),bateriamaxima(TRUCK,BATMAX),bateriaminima(TRUCK,BATMIN),pesomaximo(TRUCK,PESOMAXIMO),pesototal(TRUCK,PESOTOTAL),calcula_trajetoria([A|LT],DIA),trata_lista(A,TEMPO,PESOMAXIMO,PESOTOTAL,BATMAX,BATMIN,BATINICIAL,TRUCK,DIA),itera(DIA,TRUCK,BATINICIAL,BATMAX,BATMIN,PESOMAXIMO,PESOTOTAL,LT,TEMPO,A,LFINAL),!,trata_lista(LFINAL,TEMPOFINAL,PESOMAXIMO,PESOTOTAL,BATMAX,BATMIN,BATINICIAL,TRUCK,DIA).

% itera � o metodo que trata de todos os caminhos poss�veis, e envia
% cada caminho ao trata_lista que lhe retorna o tempo de cada caminho,
% sendo o itera responsavel por devolver o caminho que demora menos
% tempo

itera(DIA,TRUCK,BATINICIAL,BATMAX,BATMIN,PESOMAXIMO, PESOTOTAL,[A|B], TMP, CAMINHO,AS):-is_list(A), trata_lista(A,TEMPOA,PESOMAXIMO,PESOTOTAL,BATMAX,BATMIN,BATINICIAL,TRUCK,DIA), (TMP>TEMPOA,itera(DIA,TRUCK,BATINICIAL,BATMAX,BATMIN,PESOMAXIMO,PESOTOTAL,B,TEMPOA,A,AS));itera(DIA,TRUCK,BATINICIAL,BATMAX,BATMIN,PESOMAXIMO,PESOTOTAL,B,TMP,CAMINHO,AS).
itera(_,_,_,_,_,_,_,[],_,T,T).

% trata_lista � o somat�rio do tempo demorado, recebendo uma lista de
% armazens, calcula o tempo demorado do ponto 1 ao 2, do 2 ao 3, etc...
trata_lista([A,B|C],TEMPO,PESOMAXIMO,PESOCAMIAO,BATMAX,BATMIN,BATATUAL,TRUCK,DIA):-dadosCam_t_e_ta(_,A,B,T,E,_),
(entrega(_,DIA,MASSAENTREGA,B,_,TEMPORET);MASSAENTREGA is 0, TEMPORET is 0),
PESODESCARGA is PESOCAMIAO-MASSAENTREGA,tempoouenergiautil(PESOCAMIAO,PESOMAXIMO,E,ENERGIAUTIL),(BATATUAL-ENERGIAUTIL>BATMIN,
BATAPOSVIAJ is BATATUAL-ENERGIAUTIL;BATAPOSVIAJ is BATMIN),
(member(NEXTSTOP,C),dadosCam_t_e_ta(_,B,NEXTSTOP,_,BATNEC,TA),tempoouenergiautil(PESODESCARGA,PESOMAXIMO,BATNEC,BATUTNEC),
(BATAPOSVIAJ-BATMIN>BATUTNEC,TEMPOACONSIDERAR is TEMPORET,NOVABAT is BATAPOSVIAJ,TEMPOADICIONAL is 0;(BATUTNEC<BATMAX-BATMIN,TEMPOADICIONAL is 0;TEMPOADICIONAL is TA),temporecarregamentoparcial(TRUCK,BATAPOSVIAJ,TEMPORECARREGAR,NEXTSTOP,BATUTNEC),
tempoaconsiderar(TEMPORECARREGAR,TEMPORET,TEMPOACONSIDERAR),NOVABAT is BATMAX);TEMPOACONSIDERAR is TEMPORET,TEMPOADICIONAL is 0),
trata_lista([B|C],D1,PESOMAXIMO,PESODESCARGA,BATMAX,BATMIN,NOVABAT,TRUCK,DIA),!,
tempoouenergiautil(PESOCAMIAO,PESOMAXIMO,T,TEMPOUTIL),TEMPO is D1+TEMPOUTIL+TEMPOACONSIDERAR+TEMPOADICIONAL.
trata_lista([_],0,_,_,_,_,_,_,_).

pesomaximo(TRUCK,PESOMAXIMO):-carateristicasCam(TRUCK,A,B,_,_,_),PESOMAXIMO is A+B.

pesototal(TRUCK,PESOTOTAL):-findall(A,entrega(_,_,A,_,_,_),E),sumlist(E,P), carateristicasCam(TRUCK,O,_,_,_,_),PESOTOTAL is P+O.

tempoouenergiautil(PESOCAMIAO,PESOMAXIMO,TOE,TOEUTIL):-TOEUTIL is TOE*PESOCAMIAO/PESOMAXIMO.

tempoaconsiderar(TEMPOCARREGARCAMIAO,TEMPODESCARGAENCOMENDAS,TEMPOACONSIDERAR):-TEMPOCARREGARCAMIAO>TEMPODESCARGAENCOMENDAS,!,TEMPOACONSIDERAR is TEMPOCARREGARCAMIAO;TEMPOACONSIDERAR is TEMPODESCARGAENCOMENDAS.

temporecarregamentototal(TRUCK,TEMPO):-carateristicasCam(TRUCK,_,_,_,_,TEMPO),!.
% Se o pen�ltimo argumento for 5, significa que o tempo de
% recarregamento necessita apenas de ser o estritamente necess�rio para
% completar a viagem at� ao armaz�m seguinte (ou seja, chegar a este com
% a bateria a 16%
temporecarregamentoparcial(TRUCK,BATATUAL,TEMPO,5,BATUTNEC):-bateriaminima(TRUCK,BATMIN),B is BATATUAL-BATUTNEC, A is BATMIN-B,amplitudemaxima(TRUCK,AMPLITUDEMAX),temporecarregamentototal(TRUCK,TEMPOMAXIMO), TEMPO is TEMPOMAXIMO*A/AMPLITUDEMAX.
temporecarregamentoparcial(TRUCK,BATATUAL,TEMPO,_,_):- bateriamaxima(TRUCK,BATMAX),temporecarregamentototal(TRUCK,TEMPOMAXIMO),amplitudemaxima(TRUCK,AMPLITUDEMAX),AMPLITUDEATUAL is BATMAX-BATATUAL, TEMPO is AMPLITUDEATUAL*TEMPOMAXIMO/AMPLITUDEMAX.

%para um dado camiao, calcula a bateria maxima e minima (80%,20%).
bateriamaxima(TRUCK,B):-carateristicasCam(TRUCK,_,_,C,_,_), B is C*8/10.
bateriaminima(TRUCK,B):-carateristicasCam(TRUCK,_,_,C,_,_), B is C*2/10.
amplitudemaxima(TRUCK,AMPLITUDEMAXIMA):-bateriamaxima(TRUCK,A),bateriaminima(TRUCK,B),AMPLITUDEMAXIMA is A-B.
%carateristicasCam(<nome_camiao>,<tara>,<capacidade_carga>,<carga_total_baterias>,<autonomia>,<t_recarr_bat_20a80>).
carateristicasCam(eTruck01,7500,4300,80,100,60).

%entrega(<idEntrega>,<data>,<massaEntrefa>,<armazemEntrega>,<tempoColoc>,<tempoRet>)

subtracao(A,B,C):-C is A-B.
porto(PORT):-PORT is 4200.
iniciarserver(PORT):-http_server(http_dispatch, [port(PORT)]).
pais(argentina, america, 44.3).
pais(bolivia, america, 11.1).
pais(brasil, america, 209.3).
pais(chile, america, 18.1).
pais(colombia, america, 49.1).
pais(equador, america, 17.4).
pais(guiana, america, 0.8).
pais(guianafrancesa, america, 0.3).
pais(paraguai, america, 6.8).
pais(peru, america, 32.2).
pais(suriname, america, 0.6).
pais(venezuela, america, 32).
pais(cuba, america, 11.5).
pais(uruguai, america, 3.5).
pais(mexico,america,129.2).
pais(estadosunidos,america,327.2).
pais(canada,america,37.1).
pais(albania, europa, 2.9).
pais(alemanha, europa, 82.8).
pais(armenia, europa, 2.9).
pais(austria, europa, 8.8).
pais(belgica, europa, 11.4).
pais(bielorussia, europa, 9.5).
pais(bosnia, europa, 3.5).
pais(bulgaria, europa, 7.1).
pais(chipre, europa, 0.9).
pais(croacia, europa, 4.2).
pais(dinamarca, europa, 5.7).
pais(eslovaquia, europa, 5.4).
pais(eslovenia, europa, 2.1).
pais(espanha, europa, 46.7).
pais(estonia, europa, 1.3).
pais(finlandia, europa, 5.5).
pais(franca, europa, 67).
pais(georgia, europa, 3.7).
pais(grecia, europa, 10.8).
pais(holanda, europa, 17.1).
pais(hungria, europa, 9.8).
pais(irlanda, europa, 4.8).
pais(islandia, europa, 0.3).
pais(italia, europa, 60.6).
pais(kosovo, europa, 1.8).
pais(letonia, europa, 2).
pais(liechtenstein, europa, 0.04).
pais(lituania, europa, 2.8).
pais(luxemburgo, europa, 0.6).
pais(macedonia, europa, 2.1).
pais(malta, europa, 0.5).
pais(moldavia, europa, 3.6).
pais(monaco, europa, 0.04).
pais(montenegro, europa, 0.6).
pais(noruega, europa, 5.3).
pais(polonia, europa, 38.4).
pais(portugal, europa, 10.2).
pais(reinounido, europa, 66).
pais(republicacheca, europa, 10.6).
pais(romenia, europa, 19.6).
pais(russia, europa, 144.5).
pais(servia, europa, 7).
pais(suecia, europa, 10).
pais(suica, europa, 8.4).
pais(turquia, europa, 79.8).
pais(ucrania, europa, 44.8).



fronteira(argentina, bolivia).
fronteira(argentina, brasil).
fronteira(argentina, chile).
fronteira(argentina, paraguai).
fronteira(argentina, uruguai).

fronteira(bolivia, brasil).
fronteira(bolivia, chile).
fronteira(bolivia, paraguai).
fronteira(bolivia, peru).

fronteira(brasil, colombia).
fronteira(brasil, guiana).
fronteira(brasil, guianafrancesa).
fronteira(brasil, paraguai).
fronteira(brasil, peru).
fronteira(brasil, suriname).
fronteira(brasil, uruguai).
fronteira(brasil, venezuela).

fronteira(chile, peru).

fronteira(colombia, equador).
fronteira(colombia, peru).
fronteira(colombia, venezuela).

fronteira(equador, peru).

fronteira(guiana, suriname).
fronteira(guiana, venezuela).

fronteira(guianafrancesa, suriname).

fronteira(albania, grecia).
fronteira(albania, macedonia).
fronteira(albania, montenegro).
fronteira(albania, kosovo).

fronteira(alemanha, austria).
fronteira(alemanha, belgica).
fronteira(alemanha, dinamarca).
fronteira(alemanha, franca).
fronteira(alemanha, holanda).
fronteira(alemanha, luxemburgo).
fronteira(alemanha, polonia).
fronteira(alemanha, republicacheca).
fronteira(alemanha, suica).

fronteira(armenia, georgia).
fronteira(armenia, turquia).

fronteira(austria, eslovaquia).
fronteira(austria, eslovenia).
fronteira(austria, hungria).
fronteira(austria, italia).
fronteira(austria, liechtenstein).
fronteira(austria, republicacheca).
fronteira(austria, suica).

fronteira(belgica, franca).
fronteira(belgica, holanda).
fronteira(belgica, luxemburgo).

fronteira(bielorussia, letonia).
fronteira(bielorussia, lituania).
fronteira(bielorussia, polonia).
fronteira(bielorussia, russia).
fronteira(bielorussia, ucrania).

fronteira(bosnia, croacia).
fronteira(bosnia, montenegro).
fronteira(bosnia, servia).

fronteira(bulgaria, grecia).
fronteira(bulgaria, macedonia).
fronteira(bulgaria, romenia).
fronteira(bulgaria, servia).
fronteira(bulgaria, turquia).

fronteira(croacia, eslovenia).
fronteira(croacia, hungria).
fronteira(croacia, montenegro).
fronteira(croacia, servia).

fronteira(eslovaquia, hungria).
fronteira(eslovaquia, polonia).
fronteira(eslovaquia, republicacheca).
fronteira(eslovaquia, ucrania).

fronteira(eslovenia, hungria).
fronteira(eslovenia, italia).

fronteira(espanha, franca).
fronteira(espanha, portugal).

fronteira(estonia, letonia).
fronteira(estonia, russia).

fronteira(finlandia, noruega).
fronteira(finlandia, russia).
fronteira(finlandia, suecia).

fronteira(franca, italia).
fronteira(franca, luxemburgo).
fronteira(franca, monaco).
fronteira(franca, suica).

fronteira(georgia, russia).
fronteira(georgia, turquia).

fronteira(grecia, macedonia).
fronteira(grecia, turquia).

fronteira(hungria, romenia).
fronteira(hungria, servia).
fronteira(hungria, ucrania).

fronteira(irlanda, reinounido).

fronteira(italia, suica).

fronteira(kosovo, macedonia).
fronteira(kosovo, montenegro).
fronteira(kosovo, servia).

fronteira(letonia, lituania).
fronteira(letonia, russia).

fronteira(liechtenstein, suica).

fronteira(lituania, polonia).
fronteira(lituania, russia).

fronteira(macedonia, servia).

fronteira(moldavia, romenia).
fronteira(moldavia, ucrania).

fronteira(noruega, suecia).
fronteira(noruega, russia).

fronteira(montenegro, servia).

fronteira(polonia, republicacheca).
fronteira(polonia, russia).
fronteira(polonia, ucrania).

fronteira(romenia, servia).
fronteira(romenia, ucrania).

fronteira(russia, ucrania).


vizinho(X,Y):-fronteira(X,Y);fronteira(Y,X).


semVizinhos(L):-pais(L,_,_), not(vizinho(_,L)).

factorial(0,1):-!. /* a fun��o do ! ser� explicada posteriormente */
factorial(N,F):-N1 is N-1,factorial(N1,F1),F is N*F1.


chegolafacil(X,Y):-vizinho(X,Y);(vizinho(X,Z),vizinho(Z,Y));(vizinho(Z,X),vizinho(Y,Z)).

contSemPaises(C):-continente(C), not(pais(_,C,_)).

potencia(_,0,1):-!.
potencia(X,N,P):-N1 is N-1,potencia(X,N1,P1),P is X*P1.

somatorio(K,K,K):-!.
somatorio(J,K,L):-J1 is J+1,somatorio(J1,K,L1),L is L1+J.


div(N,D,Q,R):-R is N mod D, Q is N//D.

average(L,A):-sum(L,S),length(L,Length),A is S/Length.
sum([], 0).
sum([H|T], Sum) :-
   sum_list(T, Rest),
   Sum is H + Rest.


min_in_list([Min],Min):-!.

min_in_list([H,K|T],M) :-
    H =< K,
    min_in_list([H|T],M).

min_in_list([H,K|T],M) :-
    H > K,
    min_in_list([K|T],M).

mintofront(A,[C|B]):-min_in_list(A,C),apaga(C,A,B).


min_frente([H|K],T):-(T<K,T<H)->write(T).

min_frente([H,K|T]) :-
    H =< K,
    min_frente([K,H|T]).

min_frente([H,K|T]) :-
    H > K,
    min_frente([H,K|T]).

pares([],0):-!.

pares([H|K],M):-  pares(K,M1),R is H mod 2,(R==0->M is M1+1;M is M1).

impares([],0):-!.

impares([H|K],M):-  impares(K,M1),R is H mod 2,(R>0->M is M1+1;M is M1).

pimp([],0,0):-!.
pimp([H|K],P,I):-pimp(K,P1,I1),R is H mod 2,(R==0->P is P1+1,I is I1;P is P1,I is I1+1).



pares2([],0):-!.
pares2([A|T],C):- pares2(T,N), A1 is A mod 2, A1 = 0, N is C+1.

concatena([],L,L).
concatena([A|B],C,[A|D]):-concatena(B,C,D).

inverte(L,LI):-inverte1(L,[ ],LI).
inverte1([ ],L,L).
inverte1([X|L],L2,L3):- write('[X|L2]='),
write([X|L2]),nl,
inverte1(L,[X|L2],L3).

apaga(_,[ ],[ ]).
apaga(X,[X|L],M):-!,apaga(X,L,M).
apaga(X,[Y|L],[Y|M]):-apaga(X,L,M).

replace(_, _, [], []).
replace(O, R, [O|T], [R|T2]) :- replace(O, R, T, T2).
replace(O, R, [H|T], [H|T2]) :- replace(O, R, T, T2).

roberto(_,_,[],[]).
roberto(A,B,[A|C],[B|L]):-roberto(A,B,C,L).
roberto(A,B,[C|D],[C|L]):-roberto(A,B,D,L).

insere(X,1,B,[X|B]).
insere(X,Y,[A|B],[A|L]):-Y1 is Y-1,insere(X,Y1,B,L).


membro(X,[X|_]).
membro(X,[_|L]):-membro(X,L).

uni�o([ ],L,L).
uni�o([X|L1],L2,LU):-membro(X,L2),!,uni�o(L1,L2,LU).
uni�o([X|L1],L2,[X|LU]):-uni�o(L1,L2,LU).

onion([],_,[]).
onion([A|B],C,D):-membro(A,C),!,onion(B,C,D).
onion([A|B],C,[A|D]):-onion(B,C,D).

intersec��o([],L,L).
intersec��o([X|L1],L2,[X|LI]):-membro(X,L2),!,intersec��o(L1,L2,LI).
intersec��o([_|L1],L2, LI):- intersec��o(L1,L2,LI).


diff([A|B],D,E):-membro(A,D),!,diff(B,D,E).
diff([A|B],D,[A|E]):-diff(B,D,E).
diff([],_,[]).

diff2(L1,L2,LA):-diff(L1,L2,LC),diff(L2,L1,LB),concatena(LC,LB,LA).

poucaterra([],_).
poucaterra([[]|L],L).
poucaterra([X|A],[X|B]):-atomic(X),poucaterra(A,B).
poucaterra([X|C],I):-poucaterra(X,B),poucaterra(C,P),concatena(B,P,I).

combinacao(0,_,[]).
combinacao(A,[B|D],[B|C]):- A>0,A1 is A-1, combinacao(A1,D,C).
combinacao(A,[_|D],C):-A>0,combinacao(A,D,C).

permuta([],[]).
permuta([A|B],[A|L]):-permuta(B,L).
permuta([_|A],L):-permuta(A,L).


appen([],[]).
appen([A|B],[A|C]):-atomic(A),!,appen(B,C).
appen([A|B],C):-appen(A,D),appen(B,E),concatena(D,E,C).

ite(_,_,_,[]):-!,false.
ite(A,_,C,[C|_]):-!,(A==0->!,false;true).
ite(A,B,C,[B|E]):-A1 is A+1,ite(A1,B,C,E).
ite(A,B,C,[_|E]):-ite(A,B,C,E).
ordem(A,B,C):-ite(0,A,B,C).

p(_,[],[],[]).
p(N,[X|L],L1,[X|L2]):-X<N,p(N,L,L1,L2).
p(N,[Y|L],[Y|L1],L2):-p(N,L,L1,L2).


rem([],[]):-!.
rem([A,B|C],[A|L]):-rem([B|C],L).
rem([_|B],L):-rem(B,L).

rm([],[]).
rm([A|B],L):-membro(A,B),!,rm(B,L).
rm([A|B],[A|L]):-rm(B,L).

abs([],[],[]).
abs([A|B],[C|D],[E|F]):-G is A-C, (G>0,E is G;E is -G), abs(B,D,F).

totobola([],[]).
totobola([A|B],[C|D]):-is_list(A),!,member(C,A),totobola(B,D).
totobola([A|B],[A|C]):-totobola(B,C).

itera([A|_],A).
itera([_|B],C):-itera(B,C).

gertrudes([],[]).
gertrudes([A|B],C):-member(A,B),albertina([A|B],C).
gertrudes([A|B],[A|C]):-gertrudes(B,C).
albertina([A,A|B],C):-next([A,A|B],C).
albertina([A|B],[A|C]):-gertrudes(B,C).
next([_|C],B):-gertrudes(C,B).

combs(0,_,[]):-!.
combs(C,[A|B],[A|D]):-C1 is C-1,combs(C1,B,D).
combs(C,[_|B],D):-combs(C,B,D).
bots(0,_,[]):-!.
bots(X,[A|B],[A|C]):-X1 is X-1,bots(X1,B,C).
bots(X,[_|B],C):-bots(X,B,C).

reg(A,B,C):-regula1(A,B,D),regula1(B,A,E),concatena(D,E,C).
regula1([],_,[]).
regula1([A|B],C,D):-member(A,C),!,regula1(B,C,D).
regula1([A|B],C,[A|D]):-regula1(B,C,D).

flatten1([],[]).
flatten1([[H|T]|L], LF):- !, append([H|T],L,L1), flatten1(L1,LF).
flatten1([X|L],[X|LF]):- flatten1(L,LF).

ttb([],[]).
ttb([A|B],[D|C]):-is_list(A),!,member(D,A),ttb(B,C).
ttb([A|B],[A|C]):-ttb(B,C).

d(A,B,C):-router(0,A,B,C).
router(X,_,B,[B|_]):-(X==0->!,false;!,true).
router(X,A,B,[A|C]):-X1 is X+1,router(X1,A,B,C).
router(X,A,B,[_|D]):-router(X,A,B,D).

p(0,L,L1,L1,L):-!.
p(N,[X|L],[Y|L1],[X|L2],[Y|L3]):-N1 is N-1,p(N1,L,L1,L2,L3).

ris([],[]).
ris([A|B],L):-member(A,B),trata([A|B],L).
ris([A|B],[A|L]):-ris(B,L).
trata([A,A|B],L):-avanca([A,A|B],L).
trata([A,B|C],[A|L]):-avanca([A,B|C],L).
avanca([_|B],L):-ris(B,L).

obs([],[],[]).
obs([A|B],[C|D],[E|F]):-X is A-C, (X<0->E is -X;E is X),obs(B,D,F).

olista(A,B,C):-contador(0,A,B,C).
contador(X,_,B,[B|_]):-(X==0->false;true).
contador(X,A,B,[A|C]):-X1 is X+1,contador(X1,A,B,C).
contador(X,A,B,[_|D]):-contador(X,A,B,D).

alfredo([],[]).
alfredo([A|B],[R|C]):-A>3,R is A/2,alfredo(B,C).
alfredo([A|B],[A|C]):-alfredo(B,C).

primeiro([A|B],X):-primeiro1(A,B,X).
primeiro([_|B],X):-primeiro(B,X).
primeiro1(A,[B|C],X1):-X1 is X+B, primeiro1(A,C,X).
primeiro1(_,[],0).

maior([],L,L).
maior([A|B],L,L):-(A>L,maior(B,A,L);maior(B,L,L)).


% dia = soma dia=LC[p,b,g] dia+LC=LLC[[p,2,3],[b,1,7],[g,5,4]] LLC
somafinal(DIA,MAJ1_MIN2, S):-
    listaCidades(DIA,LLC),
    fatiaDeLLC(DIA,MAJ1_MIN2, LLC,LLTRsC),
    (MAJ1_MIN2 is 2 ->listaMin(LLTRsC, LM); listaMaj(LLTRsC, LM)),
     list_sum(LM,S).
%([20,30],[10,70],[50,40])--->([20,10,40])
listaMin([],[]).
listaMin([B|C], [M|LM]):- list_min(B,M), listaMin(C,LM).
list_min([L|Ls], Min) :- list_min(Ls, L, Min).
list_min([], Min, Min).
list_min([L|Ls], Min0, Min) :-Min1 is min(L, Min0), list_min(Ls, Min1, Min).

listaMaj([],[]).
listaMaj([B|C], [M|LM]):- list_max(B,M), listaMaj(C,LM).
list_max([P|T], O) :- list_max(T, P, O).
list_max([], P, P).
list_max([H|T], P, O):-( H>P -> list_max(T, H, O);list_max(T, P, O)).

list_sum([],0).
list_sum([Head | Tail], TotalSum) :- list_sum(Tail, Sum1),TotalSum is Head+Sum1.
%dia=LC[p,b,g], todas as cidades para 1 dia
%(20221205)--->([p,b,g])
listaCidades(DIA, LLC):- findall(CD,entrega(_,DIA,_,CD,_,_),LC),length(LC, TAMANHO), metodoLCpLLC(LC, TAMANHO,LLC).
%metodoLCpLLC(_,0,[]).
% metodoLCpLLC([H|T], S, [LLC|LLC2]):- append([LLC], [T|H], LLC2), S1 is
% (S-1), metodoLCpLLC([T|H], S1, LLC2).
metodoLCpLLC(_,0,[]):-!.
metodoLCpLLC([A|B],TAMANHO,[[A|B],LISTADECAMINHOS]):-TAMANHO1 is TAMANHO-1,last(B,C),delete(B,C,D) ,metodoLCpLLC([C,A|D],TAMANHO1,LISTADECAMINHOS).

%[b,c,a],[c,a,b],[a,b,c].
fatiaDeLLC(_,_,[],_).
fatiaDeLLC(DIA,MAJ1_MIN2,[LC|LLC], LLTRsC):- listaCompleta(DIA,MAJ1_MIN2, LC,LTRsC), fatiaDeLLC(DIA,MAJ1_MIN2,LLC, [LLTRsC|LTRsC]).

% dia+LC[p,b,g]= definimos LTGoGo[2,3]. transformamos GoGo em Real.
% Acrescentamos a lista de tempos reais a LLTsC (Lista de listas de
% tempos sem cidades).
% (20221205, [p,b,g])--->([20,30],[10,70],[50,40])
listaCompleta(_,_,[],[]).
listaCompleta(DIA,MAJ1_MIN2, [C|LC],[LLTRsC|LTReal]):-
    findall(T,dadosCam_t_e_ta(_,_,C,T,_,_), LTGoGo),
    listaTempos(C,DIA,10,MAJ1_MIN2 ,LTGoGo,  LTReal),
    listaCompleta(DIA,MAJ1_MIN2, LC,LLTRsC).
% recebemos cidade, dia e LTGoGo. Transformamos cada elemento da LTGoGo
% em Tempos reais sabendo o dia e a cidade. Metodo recursivo.
% (p, 20221205, [2,3])--->([20,30])
listaTempos(_,_,_,_,[],[]).
listaTempos(C,DIA,TA,MAJ1_MIN2, [X|Y], [Z|LTR]):-
    contas(MAJ1_MIN2, TA, C, DIA, X, Z),
    listaTempos(C, DIA,TA,MAJ1_MIN2, Y,LTR) .
% recebemos cidade, dia e X(tempo de trajeto). acedemos �  massa(M) e ao
% tempo de descarga(T) de mercadoria. calculamos o Z (tempo real).
% (p, 20221205, 2)--->(20)
contas(MAJ1_MIN2,TA,C,DIA,X,Z):-

    (MAJ1_MIN2 is 2 ->
    (findall(M,entrega(_,DIA,M,C,_,_),ME),
    findall(T,entrega(_,DIA,_,C,_,T),TR),
     (length(ME,TM),TM=0,M is 0,A is 0;M is ME,A is TR),
    Z is (A+((X*(7500+M))/11800))

    );

    %MAJ1_MIN2 is 1, para o majorante
    (   findall(M,entrega(_,DIA,M,C,_,_),ME),
    findall(T,entrega(_,DIA,_,C,_,T),TR),
        (length(ME,TM),TM=0,M is 0,A is 0;M is ME,A is TR),
%!
    Z is (A+((X*(7500+(4300-M)))/11800)+TA)
    )
    ).
