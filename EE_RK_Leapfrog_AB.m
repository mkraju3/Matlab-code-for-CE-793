% dy/dt = iy
% y(0) = 1 for 0 <= t <=20
% Exact y(t) = exp(it)
dt = 0.1;
t = 0:dt:20;
Exact_y = exp(1j*t);
plot(t,Exact_y,'k');
N = length(t);
hold on;
% Explicit Euler
% Initial condition
y_Explicit(1) =1;
% Loop all timesteps
for i = 2:N
 y_Explicit(i) = y_Explicit(i-1)*(1 - 1j*dt);
end
plot(t,y_Explicit,'r --');
% Runge-Kutta second-order RK2
% Initial condition
y_RK2(1) = 1;
for i = 2:N
 %Step -1 
 w_tildle = y_RK2(i-1) + dt *(1j*y_RK2(i-1));
 % Step - 2
 y_RK2(i) = y_RK2(i-1) + dt *(0.5*(1j*y_RK2(i-1)) + 0.5*(1j*w_tildle));
end
plot(t,y_RK2,'g --');
% Runge-Kutta fourth-order RK4
% Initial condition
y_RK4(1) = 1;
for i = 2:N
 %Step -1 
 k1 = dt*(1j*y_RK4(i-1));
 %Step -2 
 k2 = dt*(1j*y_RK2(i-1) + k1/2);
 %Step -3 
 k3 = dt*(1j*y_RK2(i-1) + k2/2);
 %Step -4 
 k4 = dt*(1j*y_RK2(i-1) + k3);
 y_RK4(i) = y_RK4(i-1) + k1/6 + (k2 + k3)/3 + k4/6;
end
plot(t,y_RK4,'c --');
% Leapfrog scheme
% Initial condition
y_LF(1) = 1;
% Supply the solution from Runge-Kutta 2nd order
y_LF(2) = y_RK2(2);
for i=3:N
 y_LF(i) = y_LF(i-2) + 2*dt*(1j*y_LF(i-1));
end
plot(t,y_LF,'m --');
%Adams-Bashforth scheme
y_AB(1) = 1;
%Supply the solution from Runge-Kutta 2nd order
y_AB(2) = y_RK2(2);
for i=3:N
 y_AB(i) = y_AB(i-1) + (3/2)*dt * (1j * y_AB(i-1)) - (1/2)*dt * (1j * y_AB(i-2));
end
plot(t,y_AB,'y --');
xlabel('Time as step size, h')
ylabel('Output as function of time')
legend('Exact','Explicit Euler','RK-2','RK-4','Leapfrog','Adams-Bashforth')