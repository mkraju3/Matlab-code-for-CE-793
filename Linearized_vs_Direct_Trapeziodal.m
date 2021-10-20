clc
clear all
% dy/dt = y(y-1)
% y(0) = 1/2 for 0 <= t <=1
% Exact y(t) = 1/(1-exp(t))
dt = 0.1;
t = 0:dt:1;
N = length(t);
Exact_y = 1./(1-exp(t));
plot(t,Exact_y,'o --');
hold on
% Initial condition
LT_y(1) = 1/2;
DT_y(1) = 1/2;
% Loop all timesteps
for j = 2:N
    LT_y(j) = LT_y(j-1) + dt.*LT_y(j-1)*(LT_y(j-1) - 1)/(1-dt*(LT_y(j-1) - 1/2));
    DT_y(j) = ((1+2/dt)-abs(sqrt((1+2/dt)^2 - 4*((2*DT_y(j-1)/dt) + (DT_y(j-1)*(DT_y(j-1) - 1)))))/2);
end
plot(t,LT_y,'r * --');
plot(t,DT_y,'g s --');
xlabel('Time as step size, h')
ylabel('Output as function of time')
legend('Exact','Linearized Trapeziodal','Direct Trapeziodal')