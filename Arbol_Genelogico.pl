:- discontiguous padre/2.
:- discontiguous madre/2.

% Hechos
% Padres
padre(luis, rolando).
padre(luis, jose).
padre(jose_materno, irene).
padre(ceferino, luis).
padre(juan, florencia).
padre(ricardo, jose_materno).
padre(pedro, ceferino).

madre(irene, rolando).
madre(irene, jose).
madre(florencia, irene).
madre(maria, luis).
madre(ana, florencia).
madre(carmen, jose_materno).
madre(elena, ceferino).

% Hermanos
hermano(rolando, jose).
hermano(jose, rolando).

% Tíos maternos
hermana(juana, irene).
hermana(luisa, irene).

% Tíos paternos
hermana(maria_angela, luis).

% Hijos de Juana
madre(juana, maria).
madre(juana, jesus).
madre(juana, genaro).

% Hijos de primos
madre(maria, daniela).
padre(jesus, ricardo).

% Reglas
hijo(X, Y) :- padre(Y, X).
hijo(X, Y) :- madre(Y, X).

abuelo(X, Y) :- padre(X, P), padre(P, Y).
abuelo(X, Y) :- padre(X, P), madre(P, Y).

abuela(X, Y) :- madre(X, P), madre(P, Y).
abuela(X, Y) :- madre(X, P), padre(P, Y).

tio(X, Y) :- hermano(X, P), padre(P, Y).
tio(X, Y) :- hermano(X, M), madre(M, Y).

tia(X, Y) :- hermana(X, P), padre(P, Y).
tia(X, Y) :- hermana(X, M), madre(M, Y).

primo(X, Y) :- padre(PX, X), padre(PY, Y), hermano(PX, PY).
primo(X, Y) :- madre(MX, X), madre(MY, Y), hermana(MX, MY).

prima(X, Y) :- padre(PX, X), padre(PY, Y), hermano(PX, PY).
prima(X, Y) :- madre(MX, X), madre(MY, Y), hermana(MX, MY).
