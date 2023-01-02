% processo da controllare
G = tf(100,[1,20,100]);

% w di attraversamento
wa = 1;
% guadagno statico
Kb = 20;

% nuovo processo che soddisfa specifiche statiche (errore a rampa < 0.1)
s = tf('s');
W = (Kb/s)*(100/(s+10)^2);



% scelgo rete a sella per controllore
% paramenttri s e Ta e Tb

temp = abs(evalfr(W,1i));
tempDB = mag2db(temp);
r = 10^(tempDB/20);
Tr = (1/wa)*100;


% controllore
C_tilda = ((1+s*Tr)/(1+s*r*Tr));

C = C_tilda * Kb / s;

% funzione catena aperta
CA = C * G;
%margin(CA);

% funzione trasferminato catena chiusa
H = CA/(1+CA);

figure(1);
margin(CA);

figure(2);
step(H);

sisotool(G,C);

