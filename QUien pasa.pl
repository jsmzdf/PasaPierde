califica('parcial','quiz','tarea').
peso('parcial',0.25).
peso('parcialf',0.30).
peso('quiz',0.05).
peso('tarea',0.05).
pasa('pasa').
tope_menor(0).
tope_mayor(5).
nota_pasa(3.0).
pocerntaje_t_notas(100).
asiste_PTQ('si','no').
materia('modelos2').
estudiante('mateo_nariño').
inscrito('mateo_nariño','modelos2').
asiste('mateo_nariño','modelos2',70).
nota1('mateo_nariño','parcial',1,'modelos2').
nota2('mateo_nariño','parcial',1,'modelos2').
nota3('mateo_nariño','parcialf',1,'modelos2').
nota1('mateo_nariño','quiz',4,'modelos2').
nota2('mateo_nariño','quiz',4,'modelos2').
nota1('mateo_nariño','tarea',4,'modelos2').
nota2('mateo_nariño','tarea',4,'modelos2').
cancela('mateo_nariño', 'modelos2', 'no').


estudiante('juan_mancera').
inscrito('juan_mancera','modelos2').
asiste('juan_mancera','modelos2',70).
nota1('juan_mancera','parcial',4,'modelos2').
nota2('juan_mancera','parcial',4,'modelos2').
nota3('juan_mancera','parcialf',4,'modelos2').
nota1('juan_mancera','quiz',4,'modelos2').
nota2('juan_mancera','quiz',4,'modelos2').
nota1('juan_mancera','tarea',4,'modelos2').
nota2('juan_mancera','tarea',4,'modelos2').
cancela('juan_mancera', 'modelos2', 'no').

estudiante('sebastian_mrtinez').
inscrito('sebastian_mrtinez','modelos2').
asiste('sebastian_mrtinez','modelos2',70).
nota1('sebastian_mrtinez','parcial',4,'modelos2').
nota2('sebastian_mrtinez','parcial',4,'modelos2').
nota3('sebastian_mrtinez','parcialf',4,'modelos2').
nota1('sebastian_mrtinez','quiz',4,'modelos2').
nota2('sebastian_mrtinez','quiz',4,'modelos2').
nota1('sebastian_mrtinez','tarea',4,'modelos2').
nota2('sebastian_mrtinez','tarea',4,'modelos2').
cancela('sebastian_mrtinez', 'modelos2', 'no').


inscri_mate(A,B) :- inscrito(A,B),estudiante(A),materia(B).
pasa_asist(A,B,V) :- cancela(A,B,D),D =='no', inscri_mate(A,B),asiste(A,B,C),pasa(V),  C >= 70.
not1p_peso(A,B,C) :-peso(Q,P),nota1(A,Q,N,B),Q=='parcial',C is (N*P).
not2p_peso(A,B,C) :-peso(Q,P),nota2(A,Q,N,B),Q=='parcial',C is (N*P).
not3p_peso(A,B,C) :-peso(Q,P),nota3(A,Q,N,B),Q=='parcialf',C is (N*P).
parciales(A,B,Y) :- not1p_peso(A,B,C),not2p_peso(A,B,D),not3p_peso(A,B,E),Y is (C+D+E).
not1q_peso(A,B,C) :-peso(Q,P),nota1(A,Q,N,B),Q=='quiz',C is (N*P).
not2q_peso(A,B,C) :-peso(Q,P),nota2(A,Q,N,B),Q=='quiz',C is (N*P).
quices(A,B,Y) :- not1q_peso(A,B,C),not2q_peso(A,B,D),Y is (C+D).
not1t_peso(A,B,C) :-peso(Q,P),nota1(A,Q,N,B),Q=='tarea',C is (N*P).
not2t_peso(A,B,C) :-peso(Q,P),nota2(A,Q,N,B),Q=='tarea',C is (N*P).
tareas(A,B,Y) :- not1t_peso(A,B,C),not2t_peso(A,B,D),Y is (C+D).
nota_total(A,B,Y) :- tareas(A,B,C),quices(A,B,D),parciales(A,B,E),Y is C+D+E.
estudiantepasa(A,B,V):-nota_total(A,B,X),pasa_asist(A,B,V),X>3.
