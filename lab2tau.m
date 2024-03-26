%% zadaca 2-1a Tr, Ts, Td, Tc = ?

syms s t T10 T90 Ts Td Tc

Y = 1/s;
G = 10 / (s^2 + 2*s + 8);
X = Y * G;

x(t) = ilaplace(X);
x_stat = limit(x(t), t, inf);

x10 = 0.1 * x_stat;
x90 = 0.9 *  x_stat;

T10 = vpa(solve(x(T10) == x10),5);
T90 = vpa(solve(x(T90) == x90), 5);
Tr = T90 - T10

x98 = 0.98 * x_stat;
Ts = vpa(solve(x(Ts) == x98),5)

x50 = .5 * x_stat;
Td = vpa(solve(x(Td) == x50), 5)

x63 = .63 * x_stat;
Tc = vpa(solve(x(Tc)== x63))

% Mp i Tp ne moze da se aproksimira 



%% Zadaca 2-1b 

syms s

Y = 1/s;
G = 10 / (s^2 + 2*s + 8);

w = sqrt(8);
z = 2/(2*w);

% Tr i Td ne moze da se odredi

Ts = vpa(4/(z*w),5)
Tc = vpa(1/(z*w),5)

Mp = 100 * exp((-z*pi)/sqrt(1-z^2))
Tp = pi/(w * sqrt(1-z^2))



%% Zadaca 2-2

syms s

s = tf('s');

G1 = 5/(s+5);
G2 = 20/(s+20);

step(G1, G2)



%% Zadaca 2-3

R = 1.8;
C = .79;
G = .703/(s+703);

step(G)

Tc = R * C

a = 1/Tc;
Ts = 4/a

%% Zadaca 2-4

s = tf('s');

G1 =(s^2 + 2 * s + 2)/(s^4+ 6*s^3 + 4*s^2 + 7*s + 2);
G2 = G1/ (s-5);

step(G1, G2)
% Ednas se pravi so step(G1) vtoriot pat so step(G2)


%% Zadaca 2-5 x_stat

syms s

A = [8 -3 1; -3 2 0; 5 7 -9];
B = [-4; -3; 4];
C = [2 8 -3];
D = 0;

sys = ss(A, B,C, D);
[num, den] = ss2tf(A, B, C, D);
Y = 1/s;
X = Y * [num, den];

x(t) = ilaplace(X);

x_stat = limit(x(t), t, inf)

step(sys);

%% Zadaca 2-6
clc
clear

syms s K z 

Gp = 20 / (s^2 + 5 * s + 10);
Gd = K * (s+ z);

G = Gd*20 / (1+Gp * Gd);
[b, a] = numden(G);

Mp = 12;
Tp = .8;
C  = - log(Mp/100)/(sqrt(pi^2+log(Mp/100)^2));
w = pi/(Tp * sqrt(1-C^2));
as = s^2 + 2*C*w*s + w^2;
[K, z] = solve(coeffs(a, s, 'ALL') == coeffs(as, s, 'ALL'), [K, z]);
s = tf('s');
z = double(z);
K = double(K);

Gp = 20 / (s^2 + 5 * s + 10);
Gd = K * (s + z);
G = (Gd*20) / (1+Gp * Gd);
step(G)
