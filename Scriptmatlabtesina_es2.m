%creo due vettori che rappresentano numeratore e denominatore della G(s)
N = [5, 10];
D = [-1, 2];

%creo G(s) a partire dai coefficienti del numeratore e denominatore
G_temp = tf(N, D);

%converto G(s) in forma di evans
 G = zpk(G_temp);
%creo il controllore C(s) con la condizione di errore nullo per y0 = 1(t)
 s = tf('s');
 C = -3.5*(1/s)*(1 + s/5)/(1 + s/10);

%creo il sistema W

 H = C*G;
 W = feedback(H,1);

 %risposta al gradino di W
 step(W);


