%% zadaca 1-6a

syms s a t w

num1 = double(solve(s^2 + 37*s + 74 == 0));
num2 = double(solve(s^3 + 28*s^2 + 32*s + 16 == 0));

dem1 = double(solve((s^2 + 2*s + 100) * (s^3 + 27*s^2 + 18*s + 15) == 0));

zeros = [-34.8783, -2.1217, -0.5852 - 0.5038i, -0.5852 + 0.5038i, -26.8295];
poles = [-39, -47, -1 - 9.9499i,-1 + 9.9499i, -0.3309 - 0.6782i,-0.3309 + 0.6782i, -26.3382];
gain = 45;

G = zpk(zeros, poles, gain);

num = collect((s^2 + 37*s + 74)*45*(s^3 + 28*s^2 + 32*s + 16),s);
den = collect((s^2 + 2*s + 100) * (s^3 + 27*s^2 + 18*s + 15)*(s+39)*(s+47),s);

numerator = [0, 0, 45, 2925, 51390, 147240, 133200, 53280];
denominator = [1, 115, 4499, 70700, 553692, 5201463, 3483390, 2749500];

G1 = tf(numerator, denominator);

simplify(G)
simplify(G1)

%% zadaca 1-6b

syms s a t w

num1 = double(solve((s^3 + 49*s^2 + 62 * s + 53)== 0));

dem1 = double(solve((s^2 + 88*s + 33) * (s^3 + 81*s^2 + 76*s + 65) * (s^2 + 56*s + 77) == 0));

zeros = [-14,   -0.6379 - 0.8388i, -0.6379 + 0.8388i, -47.7241];
poles = [-54.5895, -87.6234, -1.4105, -0.3766, -0.4696 - 0.7690i, -0.4696 + 0.7690i, -80.0609];
gain = 56;

G = zpk(zeros, poles, gain);

num = collect((s^3 + 49*s^2 + 62 * s + 53)*(s+14)*56 ,s);
den = collect((s^2 + 88*s + 33) * (s^3 + 81*s^2 + 76*s + 65) * (s^2 + 56*s + 77),s);

numerator = [0, 0, 0, 56, 3528, 41888, 51576, 41552];
denominator = [1, 225, 16778, 427711, 1093333, 1188715, 753676, 165165];

G1 = tf(numerator, denominator);

simplify(G)
simplify(G1)

clc
%% zadaca 1-7

den = [1, 5, 1, 5, 13];
num = [0, 0, 0, 8 ,10];

[A, B, C, D] = tf2ss(num, den);

den1 = [1, 9, 13, 8, 0, 0];
num1 = [0, 1, 2, 12, 7, 6];

[A1, B1, C1, D1] = tf2ss(num1, den1)

%% zadaca 1-8a

syms s

A = [0 1 5 0; 0 0 1 0; 0 0 0 1; -7 -9 -2 -3];
B = [0; 5; 8; 2];
C = [1 3 6 6];
D = [0];

I = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];

G = simplify(C*(s*I - A)^-1 * B + D)


clc
%% zadaca 1-8b

syms s

A = [3 1 0 4 -2; -3 5 -5 2 -1; 0 1 -1 2 8; -7 6 -3 -4 0; -6 0 4 -3 1];
B = [2; 7; 8; 5; 4];
C = [1 -2 -9 7 6];
D = [0];

I = [1 0 0 0 0; 0 1 0 0 0; 0 0 1 0  0; 0 0 0 1 0; 0 0 0 0 1];

G = simplify(C*(s*I - A)^-1 * B + D)

clc

%% zadaca 1-9a

A = [0 1 5 0; 0 0 1 0; 0 0 0 1; -7 -9 -2 -3];
B = [0; 5; 8; 2];
C = [1 3 6 6];
D = [0];

[num, den] = ss2tf(A, B, C, D);

G = tf(num, den)

%% zadaca 1-9b

syms s

A = [3 1 0 4 -2; -3 5 -5 2 -1; 0 1 -1 2 8; -7 6 -3 -4 0; -6 0 4 -3 1];
B = [2; 7; 8; 5; 4];
C = [1 -2 -9 7 6];
D = [0];

[num, den] = ss2tf(A, B, C, D);

G = tf(num, den)


%% zadaca 1-10

A=[0 1 0 0 0 0; -1 -1 0 1 0 0; 0 0 0 1 0 0; 0 1 -1 -1 1 0; 0 0 0 0 0 1; 0 0 1 0 -1 -1];
B= [0; 1; 0; 0; 0; 0];
C1 = [0 0 0 0 1 0];
C2 = [0 0 1 0 0 0];
D=[0];

[num1, den1] = ss2tf(A, B, C1, D);

G1 = tf(num1, den1)

[num2, den2] = ss2tf(A, B, C2, D);

G2 =tf(num2, den2)







