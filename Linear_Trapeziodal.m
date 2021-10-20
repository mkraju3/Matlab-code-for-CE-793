clc
clear all
% dy/dt = y(y-1)
% y(0) = 1/2 for 0 <= t <=1
% Exact y(t) = 1/(1-exp(t))
dt1 = [1 0.1 0.1 0.01 0.001 0.0001 0.00001];
for i = 1:length(dt1)
    dt = dt1(i);   
    t = 0:dt:1;
    N = length(t);
    Exact_y = 1./(1-exp(t));
    plot(t,Exact_y);
    hold on
    % Initial condition
    LT_y(1) = 1/2;
    % Loop all timesteps
    for j = 2:N
        LT_y(j) = LT_y(j-1) + dt.*LT_y(j-1)*(LT_y(j-1) - 1)/(1-dt.*(LT_y(j-1) - 1/2));
    end
    plot(t,LT_y,'--');
    hold on
end
xlabel('Time as step size, h')
ylabel('Output as function of time')
legend('Exact h=1','LT h=1','Exact h=0.1','LT h=0.1','Exact h=0.01','LT h=0.01','Exact h=0.001','LT h=0.001','Exact h=0.0001','LT h=0.0001','Exact h=0.00001','LT h=0.00001')
axes('position',[0.25 0.25 0.25 0.25]);
box on
index1 = 0<t & t<0.0001;
plot(t(index1),Exact_y(index1),t(index1),LT_y(index1));
axis tight