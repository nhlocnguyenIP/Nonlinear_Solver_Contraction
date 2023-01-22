function [Neu, neu_u_lu] = NeumannMatrix(Nx, dx, u)
    NN = Nx^2; 
    iloc = [];
    jloc = [];
    vals = [];
    ind = 1;        
    neu_u_lu = zeros(NN,1);
    for i = 1:1
        for j = 2:Nx-1
            ie = (i-1)*Nx + j;
            ie1 = (i + 1-1)*Nx + j;
            iloc(ind:ind+1) = [ie, ie];
            jloc(ind:ind+1) = [ie; ie1];
            vals(ind:ind+1) = [1/dx,-1/dx];
            ind = ind+2;    
            neu_u_lu(ie) = (u(i,j) - u(i+1,j))/dx;
        end
    end
    
    for i = Nx:Nx
        for j = 2:Nx-1
            ie = (i-1)*Nx + j;
            ie1 = (i - 1-1)*Nx + j;
            iloc(ind:ind+1) = [ie, ie];
            jloc(ind:ind+1) = [ie; ie1];
            vals(ind:ind+1) = [1/dx,-1/dx];
            ind = ind+2;    
            neu_u_lu(ie) = (u(i,j) - u(i-1,j))/dx;
        end
    end
    
    for i = 3:Nx-2
        for j = 1:1
            ie = (i-1)*Nx + j;
            ie1 = (i -1)*Nx + j+1;
            iloc(ind:ind+1) = [ie, ie];
            jloc(ind:ind+1) = [ie; ie1];
            vals(ind:ind+1) = [1/dx,-1/dx];
            ind = ind+2;    
            neu_u_lu(ie) = (u(i,j) - u(i,j+1))/dx;
        end
    end
    
    for i = 3:Nx-2
        for j = Nx:Nx
            ie = (i-1)*Nx + j;
            ie1 = (i -1)*Nx + j-1;
            iloc(ind:ind+1) = [ie, ie];
            jloc(ind:ind+1) = [ie; ie1];
            vals(ind:ind+1) = [1/dx,-1/dx];
            ind = ind+2;    
            neu_u_lu(ie) = (u(i,j) - u(i,j-1))/dx;
        end
    end
    
    
    Neu = sparse(iloc, jloc, vals, NN, NN);
end