rho_o_value = 3 * 10^-9;
a_value = 1;
eps0_value = 8.854 * 10^-12;
%Odreduvanje funkcii na E i phi

syms r rho_o a eps0
syms E1 phi1 E2 phi2
syms C1 C2 C3 C4

% a) Da se odredi E i phi vo sekoja tocka od prostorot

% 0 < r < a
phi1_d = (int(-rho_o * (1 - r^2 / a^2) / eps0 * r^2, r) + C1);
E1 = -phi1_d / r^2;

phi1 = int(E1, r) + C2;

% a < r < inf
phi2_d = (int(0, r) + C3);
E2 = -phi2_d / r^2;

phi2 = int(E2, r) + C4;

% Odreduvanje konstanti

phi2_rinf = subs(phi2, r, inf);
C4_value = solve(phi2_rinf == 0);

phi1_r0  = subs(phi1, C1, 0);  % Bidejki ovdeka ima delenje so 0 -> C1 = 0
phi1 = C2 - (- 10*rho_o*a^2*r^2 + 3*rho_o*r^4)/(60*a^2*eps0);

C1_value = 0;

phi1_a = subs(phi1, r, a);
phi2_a = subs(phi2, r, a);
phi1_r= subs(phi1, r, 0); % phi1_r0 = C2

phi2_a = subs(phi2_a, C4, C4_value);

[C2_value, C3_value] = solve(phi1_a == phi2_a);
%Dodadi za epo0E1 == eps1E2;
E1_a = subs(E1, r, a);
E2_a = subs(E2, r, a);

C2_value = solve(eps0 * E1_a == 3 * eps0 *E2_a);

phi2 = subs(phi2, C4, C4_value);
E1 = subs(E1, C1, C1_value);
C2_value = subs(C2_value, [C1, C3, eps0, a], [C1_value, C3_value, eps0_value, a_value]);  
disp("Vrednostite na phi1 i phi2");
disp([phi1, phi2])
disp("Vrednostite na E1 i E2");
disp([E1, E2]);
disp("Vrednostite na konstantite C1, C2, C3, C4");
disp([C1_value, C2_value, C3_value, C4_value]);

% b) Da se dokaze deka max E pri .75a

dE = diff(E1, r);
d2E = diff(dE, r);
d2E_value = subs(d2E, [rho_o, eps0, r, a], [rho_o_value, eps0_value, 0.75 * a_value, a_value])

% v) Na grafik da se prikaze raspredelbata na potencijalot, intenzitetot na
% vektorot na elektricnotot pole i elektricnata indukcija vo celiot
% prostor. Dali E se zabelezuva na soodvetnoto rastojanie

r1 = 0 : .1 : a_value;
r2 = a_value : .1 : 20;
E1_numeric = double(subs(E1, {rho_o, eps0, r, a}, {rho_o_value, eps0_value, r1, a_value}));
E2_numeric = double(subs(E2, {r, C3}, {r2, C3_value}));

plot(r1, E1_numeric, r2, E2_numeric);
xlabel('r');
ylabel('E');
legend('E1', 'E2');
title('Plot of E1 and E2');

phi1_numeric = subs(phi1, {r, a, C1, C2, rho_o, eps0}, {r1, a_value, C1_value, C2_value, rho_o_value, eps0_value})
phi2_numeric = double(subs(phi2, {rho_o, eps0, r, a, C3}, {rho_o_value, eps0_value, r2, a_value, C3_value}));
plot(r1, phi1_numeric,r2, phi2_numeric);
xlabel('r');
ylabel('phi');
legend('phi2');
title('Plot of phi1 and phi2');
% g) Da se presmeta nv na povrsinata na sferata




