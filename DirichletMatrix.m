function [Dir, u_lu] = DirichletMatrix(Nx, u)
    NN = Nx^2;
 
    iloc = [];
    jloc = [];
    vals = [];
    ind = 1;        
    u_lu = zeros(NN,1);
    for i = [1,Nx]
        for j = 1:Nx
            ie = (i-1)*Nx + j;
            iloc(ind) = ie;
            jloc(ind) = ie;
            vals(ind) = 1;
            ind = ind+1;    
            u_lu(ie) = u(i,j);
        end
    end
    for i = 2:Nx-1
        for j = [1,Nx]
            ie = (i-1)*Nx + j;
            iloc(ind) = ie;
            jloc(ind) = ie;
            vals(ind) = 1;
            ind = ind+1;       
            u_lu(ie) = u(i,j);
        end
    end
    
    Dir = sparse(iloc, jloc, vals, NN, NN);
end