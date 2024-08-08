function dydt = Ring_system(t, y, N, a,k,sigma,eta,D)
    vars_per_system = 6; % x1, x2, y1, y2,ph1, ph2 for each system
    
    dydt = zeros(N * vars_per_system, 1);
    
    % Sum all x1 values to compute the coupling term efficiently
    all_x1 = y(1:vars_per_system:end);
    
    for i = 1:N
        % Indexes for x1, x2, y1, y2,ph1, ph2 in the i-th system
        idxX1 = (i-1)*vars_per_system + 1;
        idxY1 = idxX1 + 1;
        idxX2 = idxY1 + 1;
        idxY2 = idxX2 + 1;
        idxPh1 = idxY2 + 1;
        idxPh2 = idxPh1 + 1;
        
        x1 = y(idxX1);
        y1 = y(idxY1);
        x2 = y(idxX2);
        y2 = y(idxY2);
        ph1 = y(idxPh1);
        ph2 = y(idxPh2);
        
        % Calculate the coupling term for x1
        x1_coupling = D/2 * (sum(all_x1) - x1 - x1); % Exclude current x1 twice: itself and in the sum
        
        % FMHNN Model equations
        dx1dt = a/(1+x1^2) +y1 + k*ph1*(x1-x2) -x1 + x1_coupling;
        dy1dt = -eta*(x1 - sigma) +k* ph2*(y1 - y2);
        dx2dt = a/(1+x2^2) + y2 - k*ph1*(x1-x2) -x2;
        dy2dt = -eta*(x2 - sigma) - k* ph2*(y1 - y2);
        dph1dt = x1-x2;
        dph2dt = y1-y2;

        
        % Assign derivatives
        dydt(idxX1) = dx1dt;
        dydt(idxY1) = dy1dt;
        dydt(idxX2) = dx2dt;
        dydt(idxY2) = dy2dt;
        dydt(idxPh1) = dph1dt;
        dydt(idxPh2) = dph2dt;
    end
end
