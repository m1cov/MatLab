%% Zadaca 7.1

s = tf('s');

G0 = (s+3)/(s*(s+0.5)*(s+2));
rlocus(G0);
K = 0.04;

G = feedback(K * G0, 1)

roots([1 2.5 1.04 0.12])

%% Zadaca 7.2

s = tf('s');

G0 = (s+2)^2 / (s * (s+1) * (s^2 + s + 4.25));
rlocus(G0);

K = 0.5;

G = feedback(K * G0, 1)

roots([1 2 5.29 4.41 0.16])
    



