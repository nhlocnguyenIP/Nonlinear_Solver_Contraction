function u = LineUpInverse(u_lu)
    Nx = sqrt(length(u_lu));    
    u = zeros(Nx, Nx);
    for i = 1:Nx
        for j = 1:Nx
            ie = (i-1)*Nx + j;
            u(i, j) = u_lu(ie);
        end
    end
end