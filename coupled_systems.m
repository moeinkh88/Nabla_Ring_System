function dydt = coupled_systems(t, y, N)
    % Define the number of variables per system
    vars_per_system = 5;
    
    % Initialize dydt
    dydt = zeros(N * vars_per_system, 1);
    
    % Calculate derivatives for each system
    for i = 1:N
        % Extract the variables for the i-th system
        idx_start = (i-1)*vars_per_system + 1;
        idx_end = i*vars_per_system;
        current_vars = y(idx_start:idx_end);
        
        % Differential equations for the current system
        for j = 1:vars_per_system
            if j == 1 % Special case for the first variable with coupling
                coupling_term = 0;
                for k = 1:N
                    if k ~= i
                        % Add coupling from all other systems
                        coupling_term = coupling_term + (y((k-1)*vars_per_system + 1) - current_vars(1));
                    end
                end
                dydt(idx_start) = current_vars(2) - current_vars(1) + coupling_term; % Example dynamics for x1
            else
                % Example dynamics for other variables
                dydt(idx_start + j - 1) = current_vars(j) - current_vars(j-1);
            end
        end
    end
end
