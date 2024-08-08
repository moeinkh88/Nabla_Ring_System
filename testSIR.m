N = 3; % Number of systems
beta = 0.5; % Infection rate
gamma = 0.3; % Recovery rate
k = 0.1; % Coupling constant

vars_per_system = 3;
initial_conditions = zeros(N * vars_per_system, 1);
% Assume some initial infected and susceptible individuals
initial_conditions(1:vars_per_system:end) = rand(vars_per_system,1)*1000; % Initial susceptibles
initial_conditions(2:vars_per_system:end) = rand(vars_per_system,1)*10;   % Initial infected

tspan = [0 100]; % Time span

% Solve the ODE
[t, sol] = ode45(@(t, y) coupled_sir_systems(t, y, N, beta, gamma, k), tspan, initial_conditions);

% Plot the solution for each variable in all systems
figure;
hold on;
colors = ['b', 'r', 'g', 'c', 'm', 'y', 'k'];
for i = 1:N
    plot(t, sol(:,:), 'Color', colors(i), 'DisplayName', sprintf('S%d', i));
end
legend show;
title('Dynamics of Susceptible Populations Across Systems');
xlabel('Time');
ylabel('Susceptible individuals');
