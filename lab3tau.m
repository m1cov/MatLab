%% Zadaca 3.1

s = tf('s');

G1 = 1/s^2;
G2 = 50/(s+1);
H1 = 2/s;
G3 = s;
G4 = -2;

G2h = feedback(G2, H1);
G34 = parallel(G3, G4);

G13 = series(G1, G2h);
G134 = series(G13, G4);



G = feedback(G134, 1)

pole(G)

step(G)


%% Zadaca 3.2

s = tf('s');

G = -6/(s^6+s^5-6*s^4+s^2+s-6);

pole(G)

%% Zadaca 3.3

s = tf('s');

Go = 240/((s+1)*(s+2)*(s+3)*(s+4));
    
G = feedback(Go, 1);

pole(G)
step(G)

%% Zadaca 3.4

s = tf('s');

Go = 8/(s*(s^6 - 2*s^5 - s^4 + 2*s^3 + 4*s^2 - 8*s - 4));

G = feedback(Go, 1);

pole(Go)
pole(G)

%% Zadaca 3.5

s = tf('s');

Go = 507/(s^4 + 3*s^3 + 10*s^2 + 30*s + 169);
H1 = 1/s;

G = feedback(Go, H1);

pole(G)
pzmap(G)






