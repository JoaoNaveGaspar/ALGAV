liga(a,b).
liga(a,c).
liga(c,g).
liga(b,e).
liga(b,f).
liga(c,f).
liga(d,g).
liga(d,h).
liga(h,d).
liga(d,i).
liga(h,l).
liga(e,j).
liga(f,j).
liga(f,k).
liga(d,a).
liga(g,f).
liga(h,l).
liga(i,l).
liga(l,p).
liga(j,m).
liga(j,n).
liga(k,n).
liga(k,p).
liga(g,o).

dfs(Orig,Dest,Cam):-!,
dfs(Orig,Dest,[Orig],Cam).
dfs(Dest,Dest,LA,Cam):-
reverse(LA,Cam).
dfs(Act,Dest,LA,Cam):-
write(LA),nl,
liga(Act,X),
\+ member(X,LA),
dfs(X,Dest,[X|LA],Cam).

listacaminhos(Orig,Dest,B):- dfs(Orig,Dest,Cam)=>true,listacaminhos(Orig,Dest,[B|Cam]).
listacaminhos(_,_,_).

listacaminhos2(Orig,Dest,B,L):-!,findall([Orig,Dest,B],dfs(Orig,Dest,B),L).
dfs2(Orig,Dest,Cam):-!,
dfs2(Orig,Dest,[Orig],Cam).
dfs2(Dest,Dest,LA,Cam):-
reverse(LA,Cam).
dfs2(Act,Dest,LA,Cam):-
write(LA),nl,
voo(_,Act,X),
\+ member(X,LA),
dfs(X,Dest,[X|LA],Cam).


pertenceaum([],_,[]).
pertenceaum([A|B],D,R):-member(A,D),pertenceaum(B,D,R).
pertenceaum([A|B],D,[A|R]):-pertenceaum(B,D,R).
pertenceaoutro(A,B,RES):-pertenceaum(A,B,X),pertenceaum(B,A,Y),append(X,Y,RES).

dfsvoo(Orig,Dest,Cam,T):-!,
dfsvoo(Orig,Dest,[Orig],Cam,T).
dfsvoo(Dest,Dest,LA,Cam,[]):-
reverse(LA,Cam).
dfsvoo(Act,Dest,LA,Cam,[T|LT]):-
%write(LA),nl,
voo(_,Act,X,PARTIDA,_),T is PARTIDA-60,
\+ member(X,LA),
dfsvoo(X,Dest,[X|LA],Cam,LT).
connect(X,Y):-liga(X,Y,_,_);liga(Y,X,_,_).
findallvoo(O,D,T,LL):-findall(L,dfsvoo(O,D,L,T),LL).

voo(fr5483,porto,madrid,500,620).
voo(fr131,porto,colonia,505,690).
voo(fr8862,porto,malaga,505,635).
voo(fr9135,porto,paris,550,720).
voo(fr8348,porto,londres,1085,1210).
%...
voo(fr1225,madrid,colonia,725,860).
voo(fr5995,madrid,londres,785,870).
voo(fr5493,madrid,milao,810,950).
%...
voo(fr2508,colonia,barcelona,885,995).
voo(fr8518,colonia,milao,940,1005).
voo(fr2817,colonia,londres,1015,1015).
%...
voo(fr4195,milao,londres,1070,1120).

encontra_voos(ORIGEM,DESTINO,TEMPO,LISTACAMINHOS):-auxilia(ORIGEM,DESTINO,TEMPO,LISTACAMINHOS).
auxilia(ORIGEM,DESTINO,TEMPO,ID):-voo(ID,ORIGEM,DESTINO,PARTIDAVOO,_),TEMPO is PARTIDAVOO-60.
auxilia(ORIGEM,DESTINO,[TNESTEAERO|TPROXAERO],[ID,CAMINHO]):-voo(ID,ORIGEM,INTERMEDIO,PARTIDAVOO,_),TNESTEAERO is PARTIDAVOO-60,auxilia(INTERMEDIO,DESTINO,TPROXAERO,CAMINHO).
todasaleternativaspossiveis(ORIGEM,DESTINO,TEMPO,LL):-findall(L,encontra_voos(ORIGEM,DESTINO,TEMPO,L),LL).
usainbolt(O,D,T,L):-todasaleternativaspossiveis(O,D,T,LISTACAMINHOS),findall(ID,voo(ID,_,_,_,_),TODOSVOOS),length(TODOSVOOS,TAMANHOTODOSVOOS),helper(LISTACAMINHOS,TAMANHOTODOSVOOS,L).
helper([A|_],_,1):-atomic(A).
helper([A|B],TAMANHOATUAL,L):-(is_list(A),length(A,TAMANHO),(TAMANHO<TAMANHOATUAL,T1 is TAMANHO;T1 is TAMANHOATUAL),helper(B,T1,L);L is 1).
helper([],L,L).
chega_mais_cedo(O,D,T,L):-todasaleternativaspossiveis(O,D,T,LISTA),mairapido(LISTA,L,10000000).
mairapido([A|B],L,R):-is_list(A),devolvetempolista(A,TEMPOA),(TEMPOA<R,mairapido(B,L,TEMPOA);mairapido(B,L,R)).

devolvetempolista([A|B],TEMPO):-voo(A,_,_,P,C),devolvetempolista(B,T2),T1 is C-P,TEMPO is T1+T2.


devolvetempolista([],0).






caminhos(ORIGEM,DESTINO,CAMINHO):-busca(ORIGEM,DESTINO,CAMINHO).
busca(ORIGEM,DESTINO,[ORIGEM,DESTINO]):-liga(ORIGEM,DESTINO,_,_).%ou connect se for bilateral
busca(ORIGEM,DESTINO,[ORIGEM|CAMINHO]):-liga(ORIGEM,INTERMEDIO,_,_),busca(INTERMEDIO,DESTINO,CAMINHO).
listacaminhos2(Orig,Dest,B,L):-!,findall([Orig,Dest,B],dfs2(Orig,Dest,B),L).
dfs2(Orig,Dest,Cam):-!,
dfs2(Orig,Dest,[Orig],Cam).
dfs2(Dest,Dest,LA,Cam):-
reverse(LA,Cam).
dfs2(Act,Dest,LA,Cam):-
write(LA),nl,
voo(_,Act,X),
\+ member(X,LA),
dfs(X,Dest,[X|LA],Cam).

encontra_voos2(Destino,Destino,_, _,[]):-!.
encontra_voos2(Origem,Destino,L, T,[ID|RPercurso]):-
                                 voo(ID,Origem,X,TP,TC),
                                 Taux is T+60, TP >= Taux,
                                 not(member(X,L)),
                                 encontra_voos2(X,Destino,[X|L], TC, RPercurso).
todas_alternativas_voo(O,D,T,LL):-findall(L,encontra_voos(O,D,T,L),LL).


liga(hall,corredor,90,190).
liga(hall,sala,160,190).
liga(sala,cozinha,90,190).
liga(cozinha,corredor,100,200).
liga(cozinha,lavandaria,80,180).
liga(cozinha,arrumos,80,180).
liga(corredor,wc,90,200).
liga(corredor,quarto1,95,200).
liga(corredor,quarto2,95,200).
liga(corredor,quarto_suite,120,200).
liga(quarto_suite,wc_suite,90,200).
liga(quarto_suite,terraço,200,200).
liga(sala,terraço,240,200).

ppp(X,Y,Z,LP,AP,T):-normal(X,Y,Z,LP,AP,T);xperp(X,Y,Z,LP,AP,T);yperp(X,Y,Z,LP,AP,T).
normal(X,Y,Z,LP,AP,n):-X<LP,Z<AP;Z<AP,Y<LP.
xperp(X,Y,Z,LP,AP,x):-Z<LP,X<AP;X<AP,Y<LP.
yperp(X,Y,Z,LP,AP,y):-Y<AP,Z<LP;Y<AP,X<LP.


ppp2(X,Y,Z,LP,AP,T):-normal2(X,Y,Z,LP,AP,T);xperp2(X,Y,Z,LP,AP,T);yperp2(X,Y,Z,LP,AP,T).
normal2(X,Y,Z,LP,AP,0):-X<LP,Z<AP;Z<AP,Y<LP.
xperp2(X,Y,Z,LP,AP,1):-Z<LP,X<AP;X<AP,Y<LP.
yperp2(X,Y,Z,LP,AP,1):-Y<AP,Z<LP;Y<AP,X<LP.

contauns(A,C):-aux(A,0,C).
aux([A|B],D,C):-(A>0,D1 is D+1;D1 is D),aux(B,D1,C).
aux([],C,C).

contaunsbacktracking(A,C):-aux1(A,C).
aux1([A|B],C1):-aux1(B,C),(A>0,C1 is C+1;C1 is C).
aux1([],0).

caminho(X,Y,Z,Div_Parida,Div_Chegada,CAMINHO,N):-buscacaminho(X,Y,Z,Div_Parida,Div_Chegada,CAMINHO,N);buscacaminho2(X,Y,Z,Div_Parida,Div_Chegada,CAMINHO,N).
buscacaminho(X,Y,Z,A,B,[A|B],N):-liga(A,B,LP,AP),ppp2(X,Y,Z,LP,AP,T),(T>0,N is 0;N is 1).
buscacaminho2(X,Y,Z,A,B,[D|C],N1):-liga(A,D,LP,AP),ppp2(X,Y,Z,LP,AP,T),(T>0,N1 is N+1,buscacaminho2(X,Y,Z,D,B,C,N);buscacaminho2(X,Y,Z,D,B,C,N1)).
buscacaminho2(X,Y,Z,A,B,[A|B],N):-liga(A,B,LP,AP),ppp2(X,Y,Z,LP,AP,T),(T>0, N is 1;N is 0).

connect(X,Y):-liga(X,Y,_,_);liga(Y,X,_,_).
caminhos(ORIGEM,DESTINO,CAMINHO):-busca(ORIGEM,DESTINO,CAMINHO).
busca(ORIGEM,DESTINO,[ORIGEM,DESTINO]):-liga(ORIGEM,DESTINO,_,_).%ou connect se for bilateral
busca(ORIGEM,DESTINO,[ORIGEM|CAMINHO]):-liga(ORIGEM,INTERMEDIO,_,_),busca(INTERMEDIO,DESTINO,CAMINHO).


connect(X,Y):-liga(X,Y,_,_);liga(Y,X,_,_).

caminhos2(X,Y,Z,ORIGEM,DESTINO,CAMINHO,N):-busca2(X,Y,Z,ORIGEM,DESTINO,CAMINHO,N),!.
busca2(X,Y,Z,ORIGEM,DESTINO,[ORIGEM,DESTINO],T):-liga(ORIGEM,DESTINO,LP,AP),ppp2(X,Y,Z,LP,AP,T).
busca2(X,Y,Z,ORIGEM,DESTINO,[ORIGEM|CAMINHO],T1):-liga(ORIGEM,INTERMEDIO,LP,AP),ppp2(X,Y,Z,LP,AP,T),busca2(X,Y,Z,INTERMEDIO,DESTINO,CAMINHO,R),T1 is T+R.

todos_caminhos(X,Y,Z,Div_Partida,Div_Chegada,LL):-findall(p(N,CAMINHO),caminhos2(X,Y,Z,Div_Partida,Div_Chegada,CAMINHO,N),LL).

menosdivtomb(X,Y,Z,ORIG,DEST,LISTAMENOR):-todascaminhos(X,Y,Z,ORIG,DEST,LISTACAMINHOS),tratalistas(LISTACAMINHOS,LISTAMENOR).
tratalistas([A,B|LISTACAMINHOS],A):-length(B,X),length(A,Y),(Y>X,tratalistas([B,LISTACAMINHOS],B);tratalistas([B,LISTACAMINHOS],A)).

menosdivtomb2(X,Y,Z,Div_Partida,Div_Chegada,Lista_Divisoes):-
findall( (ND,NT,LD),
(caminhos2(X,Y,Z,Div_Partida,Div_Chegada,LD,NT),length(LD,ND)),
Lista_Divisoes).

bnb(Orig,Dest,Cam,Custo):- bnb2(Dest,[(0,[Orig])],Cam,Custo).
%condicao final: destino = nó à cabeça do caminho actual
bnb2(Dest,[(Custo,[Dest|T])|_],Cam,Custo):-
%caminho actual está invertido
reverse([Dest|T],Cam).
bnb2(Dest,[(Ca,LA)|Outros],Cam,Custo):-
LA=[Act|_],
findall((CaX,[X|LA]),
(Dest\==Act,edge(Act,X,CustoX),\+ member(X,LA),CaX is CustoX + Ca),Novos),
append(Outros,Novos,Todos),
sort(Todos,TodosOrd),
bnb2(Dest,TodosOrd,Cam,Custo).

dfs(Orig,Dest,Cam):-!,
dfs(Orig,Dest,[Orig],Cam).
dfs(Dest,Dest,LA,Cam):-
reverse(LA,Cam).
dfs(Act,Dest,LA,Cam):-
write(LA),nl,
liga(Act,X),
\+ member(X,LA),
dfs(X,Dest,[X|LA],Cam).

compra(1,[leite,cha,bolo]).
compra(2,[ovos,cha,refrigerante]).
compra(3,[leite,ovos,cha,refrigerante]).
compra(4,[ovos,refrigerante]).
compra(5,[sumo]).

todos_produtos(LTP):-findall(L,compra(_,L),LCR),juntanumalista(LCR,LTR),tirarepetidos(LTR,LTP).
juntanumalista([A|B],X):-juntanumalista(B,LISTAFINAL),append(A,LISTAFINAL,X).
juntanumalista([],[]).
tirarepetidos([A|B],C):-member(A,B),tirarepetidos(B,C).
tirarepetidos([A|B],[A|C]):-tirarepetidos(B,C).
tirarepetidos([],[]).

nivel_suporte(LTPNS):-todos_produtos(LTP),checkquantidades(LTP,LTPNS).
checkquantidades([P|B],[p(P,Q)|L]):-findall(P,compra(_,L),member(P,L),LP),length(LP,Q),checkquantidades(B,L).
checkquantidades([],[]).



cortainferioresN1([p(PRODUTO,QT)|LTPNS],N1,[PRODUTO|LP]):-QT>=N1,cortainferioresN1(LTPNS,N1,LP).
cortainferioresN1([_|B],N1,LP):-cortainferioresN1(B,N1,LP).
cortainferioresN1([],_,[]).

escolheN(N,LP,LPC):-combinacoes(0,N,LP,LPC).
combinacoes(N,N,_,[]).
combinacoes(NATUAL,NFINAL,[A|B],[A|LISTAFINAL]):-N1 is NATUAL+1,combinacoes(N1,NFINAL,B,LISTAFINAL).
combinacoes(NATUAL,NFINAL,[_|B],LISTAFINAL):- combinacoes(NATUAL,NFINAL,B,LISTAFINAL).

escolheN2(0,_,[]):-!.
escolheN2(N,[X|L],[X|L1]):- N1 is N-1,escolheN2(N1,L,L1).
escolheN2(N,[_|L],L1):- escolheN2(N,L,L1).

q(V):-d(V),c(z).
q(V):-p(V).
d(x).
d(y).
c(z).
p(V):-p(V).
liga(hall,corredor,90,190).
liga(hall,sala,160,190).
liga(sala,cozinha,90,190).
liga(cozinha,corredor,100,200).
liga(cozinha,lavandaria,80,180).
liga(cozinha,arrumos,80,180).
liga(corredor,wc,90,200).
liga(corredor,quarto1,95,200).
liga(corredor,quarto2,95,200).
liga(corredor,quarto_suite,120,200).
liga(quarto_suite,wc_suite,90,200).
liga(quarto_suite,terraco,200,200).
liga(sala,terraco,240,200).
caminho4(X,Y,Z,Div_Partida,Div_Chegada,Lista_Divisoes,N):-
	caminho4(X,Y,Z,Div_Chegada,[Div_Partida],Lista_Divisoes,0,N).

caminho4(_,_,_,Dest,[Dest|T],[Dest|T],N,N).
caminho4(X,Y,Z,Dest,[H|T],LD,NT,N):-
	%evitar backtracking
	H\==Dest,
	%liga��o bi-direccional
	(liga(H,NDiv,LP,AP);liga(NDiv,H,LP,AP)),
	%evitar caminhos circulares
	\+ member(NDiv,[H|T]),
	%a porta permite passagem
	%testar tipo de tombo para actualizar coordenadas e contar tombos
	ppp(X,Y,Z,LP,AP,Tombo),
	(
		(Tombo==n,
		 caminho4(X,Y,Z,Dest,[NDiv,H|T],LD,NT,N));
		(Tombo==x,
		 NT1 is NT+1,
		 caminho4(Z,Y,X,Dest,[NDiv,H|T],LD,NT1,N));
		(Tombo==y,
		 NT1 is NT+1,
		 caminho4(X,Z,Y,Dest,[NDiv,H|T],LD,NT1,N))
	).
menosdivtomb3(X,Y,Z,Div_Partida,Div_Chegada,LLista_Divisoes):-
findall( (ND,NT,LD),
(caminho4(X,Y,Z,Div_Partida,Div_Chegada,LD,NT),length(LD,ND)),
LLista_Divisoes).
