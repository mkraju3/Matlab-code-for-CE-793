clc
clear all
LI(1) = -1;
dt = 0.2;
tall = 0:dt:1;
Exact = -log(exp(-LI(1)) + exp(-tall) - 1);
plot(tall,Exact,'g * --')
hold on
N = length(tall);
for i = 2:N
    t = tall(i);
    LI(i) = (LI(i-1)*(1-dt*exp(LI(i-1)-t)) + dt*exp(LI(i-1)-t))/(1-dt*exp(LI(i-1)-t));
end
plot(tall,LI,'r o --')
xlabel('\Deltax spacing')
ylabel('Output as function of time')
legend('Exact','Linear implicit, y(0) = -1')