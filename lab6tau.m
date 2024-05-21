%% Zadaca 6.1

s  = tf('s');
Go = 26 / (s*(s+2));
margin(Go);

Kv = 459;
e = 1/Kv;

%% Zadaca 6.2

s = tf('s');

Gd = (s+3)/(s+30);
Gi = 3/30 * (s+30)/(s+3);

margin(Gd);
hold on
margin(Gi);
hold off

Go = 1/(s^2 + 0.8*s +1);    
margin(Go);
hold on
margin(Go + Gi + Gd)
