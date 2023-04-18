% Parámetros del circuito
R = 120; % ohmios
L = 4e-3; % henrios
C = 0.1e-6; % faradios
V = 12; % voltios
f = 500; % Hz
T = 0.01; % segundos
t = 0:1e-6:T; % vector de tiempo en segundos
u = square(2*pi*f*t); % señal de entrada (tren de impulsos)

% Ecuación en espacio de estados
A = [0 1; -1/(L*C) -R/L];
B = [0; V/(L*C)];
C = [1 0];
D = 0;

% Solución de la ecuación en espacio de estados
sys = ss(A,B,C,D);
[y,t,x] = lsim(sys,u,t);

% Gráfica de la respuesta en el tiempo
figure;
plot(t,y);
grid on;
xlabel('Tiempo (s)');
ylabel('Voltaje (V)');
title('Respuesta del circuito RLC a un tren de impulsos');