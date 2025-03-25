% Base de conocimientos sobre carreras
carrera(ingenieria_sistemas, [matematicas, tecnologia, analitico]).
carrera(medicina, [biologia, salud, empatico]).
carrera(derecho, [argumentacion, justicia, critico]).
carrera(psicologia, [comunicacion, salud, empatico]).
carrera(administracion, [liderazgo, negocios, extrovertido]).

% Preguntar al usuario y almacenar respuestas
preguntar(Pregunta, Hecho, Respuestas, [Hecho | Respuestas]) :-
    write(Pregunta), write(" (si/no): "),
    read(Respuesta),
    (Respuesta == si -> true ; Respuestas = Respuestas).

recopilar_informacion(RespuestasFinal) :-
    preguntar("¿Te gustan las matemáticas?", matematicas, [], R1),
    preguntar("¿Te interesa la tecnología?", tecnologia, R1, R2),
    preguntar("¿Eres analítico?", analitico, R2, R3),
    preguntar("¿Te interesa la salud?", salud, R3, R4),
    preguntar("¿Tienes habilidades en comunicación?", comunicacion, R4, R5),
    preguntar("¿Te gusta el liderazgo?", liderazgo, R5, R6),
    preguntar("¿Te interesa la justicia y el derecho?", justicia, R6, R7),
    preguntar("¿Eres una persona extrovertida?", extrovertido, R7, RespuestasFinal),
    write("Respuestas recolectadas: "), write(RespuestasFinal), nl.

% Contar coincidencias entre respuestas y requisitos
contar_coincidencias([], _, 0).
contar_coincidencias([H | T], Respuestas, Coincidencias) :-
    contar_coincidencias(T, Respuestas, Temp),
    (member(H, Respuestas) -> Coincidencias is Temp + 1 ; Coincidencias = Temp).

% Encontrar la mejor carrera
mejor_carrera :-
    recopilar_informacion(RespuestasUsuario),
    write("Respuestas procesadas: "), write(RespuestasUsuario), nl,
    findall((Carrera, Coincidencias), 
            (carrera(Carrera, Requisitos), contar_coincidencias(Requisitos, RespuestasUsuario, Coincidencias)), 
            Resultados),
    write("Resultados de coincidencias: "), write(Resultados), nl,
    max_member((MejorCarrera, MaxCoincidencias), Resultados),
    write("La mejor carrera es: "), write(MejorCarrera), write(" con "), write(MaxCoincidencias), write(" coincidencias."), nl.
