clc
clear all
LI(1) = -1*10^-5;
dt = 0.2;
tall = 0:dt:1;
for i = 2:length(tall)
    t = tall(i);
    LI(i) = (LI(i-1)*(1-dt*exp(LI(i-1)-t)) + dt*exp(LI(i-1)-t))/(1-dt*exp(LI(i-1)-t));
    Exact(i) = -log(exp(-LI(1)) + exp(-t) - 1);
    Error(i) = abs(LI(i) - Exact(i));
end
loglog(tall,Error,'r o --')
grid on
hold on
LI(1) = -1;
dt = 0.2;
tall = 0:dt:1;
for i = 2:length(tall)
    t = tall(i);
    LI(i) = (LI(i-1)*(1-dt*exp(LI(i-1)-t)) + dt*exp(LI(i-1)-t))/(1-dt*exp(LI(i-1)-t));
    Exact(i) = -log(exp(-LI(1)) + exp(-t) - 1);
    Error(i) = abs(LI(i) - Exact(i));
end
loglog(tall,Error,'g o --')
xlabel('\Deltax spacing')
ylabel('Error in log scale')
legend('y(0) = -1E-5','y(0) = -1')