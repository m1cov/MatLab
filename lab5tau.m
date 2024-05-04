%% Primer 5.1

s = tf('s');
P = 1/(s^2 + 5*s + 15);
    
%pidTuner(P);

Kp = 45.9718;
Ki = 0;
Kd = 7.2406;

PID = pid(Kp, Ki, Kd)
G = feedback(series(PID, P), 1)
step(G)

%% Zadaca 5.1 PI

s = tf('s');
Go = 1/(s^2 + 10 * s + 20);


pidTuner(Go);

Kp = 22.29;
Ki = 53.18;
Kd = 0;

PID = pid(Kp, Ki, Kd)
G = feedback(series(Go, PID), 1)
step(G);

%% Zadaca 5.1 PID


s = tf('s');
Go = 1/(s^2 + 10 * s + 20);


pidTuner(Go);

Kp = 40.42;
Ki = 79.6392;
Kd = 3.9685;

PID = pid(Kp, Ki, Kd)
G = feedback(series(Go, PID), 1)
step(G);

%% Zadaca 5.1 PD

s = tf('s');
Go = 1/(s^2 + 10 * s + 20);

pidTuner(Go);

Kp = 40.42;
Ki = 0;
Kd = 3.9685;

PID = pid(Kp, Ki, Kd)
G = feedback(series(Go, PID), 1)
step(G);

%% Zadaca 5.2

s = tf('s');

K = 0.0274;
J = 3.2284 * 10^-6;
b = 3.5077 * 10^-6;
L = 2.75 * 10^-6;
R = 4;

P = K/(s*((J*s + b)*(L*s + R)+ K^2));

%pidTuner(P);

Kp1 = 15.2337;
Ki1 = 463.9291;
Kd1 = 15.2337;

C = pid(Kp1, Ki1, Kd1);

Gd = P / (1 + P * C);

Gc = feedback(C * P, 1) + Gd
step(Gc);



%% Zadaca 5.3

s = tf('s');
P = 1/(s+1)^3;
%pidTuner(P);
Kpo = 8.235;
Tc = 3.6;
Kp = 0.6 * Kpo;
Ki = Tc/2;
Kd = 8/Tc;
disp(["Vrednostite za Kp, Ki i Kd se", Kp, Ki, Kd]);
PID = pid(Kp, Ki, Kd);
G = series(PID, P);
step(G);
pidTuner(G);
Kp1 = 0.56309;
Ki1 = 0.1316;
Kd1 = 0.34106;
PID1 = pid(Kp1, Ki1, Kd1);
Gf = feedback(series(G, PID1), 1);
step(Gf);






