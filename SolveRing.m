N = 4; % Number of systems
a=.1;
k=.1;
sigma=.1;
eta=.1;
D = 0.1; % Coupling constant

vars_per_system = 6;
initial_conditions = rand(N * vars_per_system, 1);

tspan = [0 4]; % Time span

% Solve the ODE
[t, sol] = ode45(@(t, y) Ring_system(t, y, N, a,k,sigma,eta,D), tspan, initial_conditions);

% Plot the solution for variables of all systems
figure;
hold on;
plot(t, sol);
xlabel('Time');
ylabel('var');
