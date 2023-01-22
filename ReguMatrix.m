function [Deye, Dx, Dy, Laplace1] = ReguMatrix(X)

Nx = size(X,1);
dx = X(2,2) - X(1,1);
NN = Nx^2;

resetMatrix;

for ix = 2:Nx-1
    for iy = 2:Nx-1
            ie = (ix - 1)*Nx + iy;
            ie1 = (ix + 1 - 1)*Nx + iy;
            iloc(ind) = ie;
            jloc(ind) = ie1;
            vals(ind) = 1;
            ind = ind + 1;
    end
end

Deye = sparse(iloc,jloc,vals,NN,NN);
resetMatrix;

for ix = 2:Nx-1
    for iy = 2:Nx-1
            ie = (ix - 1)*Nx + iy;
            ie1 = (ix + 1 - 1)*Nx + iy;
            iloc(ind:ind+1) = [ie;ie];
            jloc(ind:ind+1) = [ie;ie1];
            vals(ind:ind+1) = [-1/dx,1/dx];
            ind = ind + 2;
    end
end
Dx = sparse(iloc,jloc,vals,NN,NN);

resetMatrix;

for ix = 2:Nx-1
    for iy = 2:Nx-1
            ie = (ix - 1)*Nx + iy;
            ie1 = (ix - 1)*Nx + iy + 1;
            iloc(ind:ind+1) = [ie;ie];
            jloc(ind:ind+1) = [ie;ie1];
            vals(ind:ind+1) = [-1/dx,1/dx];
            ind = ind + 2;
    end
end
Dy = sparse(iloc,jloc,vals,NN,NN);

resetMatrix;

for ix = 2:Nx-1
    for iy = 2:Nx-1
            ie = (ix - 1)*Nx + iy;
            ie1 = (ix  - 1)*Nx + iy + 1;
            ie2 = (ix  - 1)*Nx + iy - 1;
            ie3 = (ix +1 - 1)*Nx + iy;
            ie4 = (ix -1 - 1)*Nx + iy;
            iloc(ind:ind+4) = [ie;ie;ie;ie;ie];
            jloc(ind:ind+4) = [ie;ie1;ie2;ie3;ie4];
            vals(ind:ind+4) = [-4/dx^2;1/dx^2;1/dx^2;1/dx^2;1/dx^2];
            ind = ind + 5;
    end
end

Laplace1 = sparse(iloc,jloc,vals,NN,NN);
end
