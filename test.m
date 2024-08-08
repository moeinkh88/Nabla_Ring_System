N = 3; % Number of systems
vars_per_system = 5;
initial_conditions = rand(N * vars_per_system, 1); % Random initial conditions

% Time span
tspan = [0, 10];

% Solve the ODE
[t, sol] = ode45(@(t, y) coupled_systems(t, y, N), tspan, initial_conditions);

% Plot the solution for each variable in the first system
figure;
hold on;
for i = 1:vars_per_system
    plot(t, sol(:, i), 'DisplayName', sprintf('x%d', i));
end
legend show;
title('Dynamics of the first system');
xlabel('Time');
ylabel('State variables');
