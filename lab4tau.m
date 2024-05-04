%% Zadaca 4.1

s = tf('s');

G1 = (s+9)/(s*(s+6)*(s+12)*(s+14));
G2 = (6*(s+9)*(s+17))/((s+12)*(s+32)*(s+68));
G3 = 1/(s+7);

G2c = feedback(G2, 1);
G12 = series(G2c, G1);

Go = feedback(G12, G3)

Kp = dcgain(Go)
Kv = dcgain(s*Go)
Ka = dcgain(s^2 * Go)

ea = 1/(1+Kp) % pri y=h(t)
eb = 1/Kv % pri y = th(t)
ec = 1/Ka % pri y   = .5t^2 * h(t)

%% Zadaca 4.2

  s = tf('s');

  G11 = (10 * (s+1) * (s+2))/(s^2 * (s+4) * (s+5) * (s+6));
  G12 = (10^6 * (s+1) * (s+2))/(s^2 * (s+4) * (s+5) * (s+6));
  H = (s+6) / ((s+8) * (s+9))-1;

  G01 = feedback(G11, H);
  G02 = feedback(G12, H);

  Kp1 = dcgain(G01)
  Kv1 = dcgain(s * G01)
  Ka1 = dcgain(s^2 * G01)

ea1 = 1/(1+Kp1)
eb1 = 1/Kv1 
ec1 = 1/Ka1 

  Kp2 = dcgain(G01)
  Kv2 = dcgain(s * G02)
  Ka2 = dcgain(s^2 * G02)

ea2 = 1/(1+Kp2)
eb2 = 1/Kv2 
ec2 = 1/Ka2 
  

