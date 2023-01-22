function u = SolveLinearEqn(X, Y, f_true, Dir, Neu, data_lu, neu_u_lu)
    % We solve the equation \Delta u = f_true, with Dir 2 layers
    lambd = 3;
    x0 = 0;
    y0 = -9;
    r = sqrt((X-x0).^2 + (Y - y0).^2).^(-10);
    Carl = exp(lambd*r);
    dx = X(2,2) - X(1,1);
    Nx = size(X,1);
    [CarlLaplace, f_lu] = LaplaceMatrix(Carl, Nx, dx, f_true);    
    LHS = [CarlLaplace; Dir;Neu];
    RHS = [f_lu; data_lu;neu_u_lu];
    [Deye, Dx, Dy, Laplace1] = ReguMatrix(X);
    reg = Deye + Dx'*Dx + Dy'*Dy + Laplace1'*Laplace1;
    ep = 10^(-6);

    %u_lu = (LHS'*LHS + ep*reg)\LHS'*RHS;
    u_lu = lsqlin(CarlLaplace'*CarlLaplace, CarlLaplace'*f_lu,[],[],...
        [Dir;Neu],[data_lu;neu_u_lu]);
    u = LineUpInverse(u_lu);
end

% imagesc(u0);