clc
clear all
% dy/dt = -0.5y
% y(0) = 1 for 0 <= t <=20
% Exact y(t) = exp(-0.5t)
dt = 1;
t = 0:dt:20;
Exact_y = exp(-0.5*t);
plot(t,Exact_y);
N = length(t);
% Explicit Euler
hold on;
% Initial condition
y_Explicit(1) =1;
% Loop all timesteps
for i = 2:N
 y_Explicit(i) = y_Explicit(i-1)*(1 - 0.5*dt);
end
plot(t,y_Explicit,'g s -');
dt1 = 4.2;
t1 = 0:dt1:20;
N1 = length(t1);
% Explicit Euler
% Initial condition
y1_Explicit(1) =1;
% Loop all timesteps
for j = 2:N1
 y1_Explicit(j) = y1_Explicit(j-1)*(1 - 0.5*dt1);
end
plot(t1,y1_Explicit,'r * -');
xlabel('Time as step size, h')
ylabel('Output as function of time')
legend('Exact','Explicit, h = 1.0','Explicit, h = 4.2')