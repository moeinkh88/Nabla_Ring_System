function dydt = coupled_sir_systems(t, y, N, beta, gamma, k)
    vars_per_system = 3; % S, I, R for each system
    
    dydt = zeros(N * vars_per_system, 1);
    
    % Sum all S values to compute the coupling term efficiently
    all_S = y(1:vars_per_system:end);
    
    for i = 1:N
        % Indexes for S, I, R in the i-th system
        idxS = (i-1)*vars_per_system + 1;
        idxI = idxS + 1;
        idxR = idxI + 1;
        
        S = y(idxS);
        I = y(idxI);
        R = y(idxR);
        
        % Calculate the coupling term for S
        S_coupling = k * (sum(all_S) - S - S); % Exclude current S twice: itself and in the sum
        
        % SIR Model equations
        dSdt = -beta * S * I + S_coupling;
        dIdt = beta * S * I - gamma * I;
        dRdt = gamma * I;
        
        % Assign derivatives
        dydt(idxS) = dSdt;
        dydt(idxI) = dIdt;
        dydt(idxR) = dRdt;
    end
end
