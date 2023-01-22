function [CarlLaplace, f_lu] = LaplaceMatrix(Carl, Nx, dx, f)
    resetMatrix;
    dxx = 1/dx^2;
    NN = Nx^2;
    f_lu = zeros(NN,1);
    for ix = 2:Nx-1
        for iy = 2:Nx-1
                ie = (ix - 1)*Nx + iy;
                ie1 = (ix + 1 - 1)*Nx + iy;
                ie2 = (ix - 1 - 1)*Nx + iy;
                ie3 = (ix - 1)*Nx + iy + 1;
                ie4 = (ix - 1)*Nx + iy - 1;
                M = 5;
                iloc(ind:ind+M-1) = ie*ones(M,1);
                jloc(ind:ind+M-1) = [ie,ie1,ie2,ie3,ie4]';
                vals(ind:ind+M-1) = Carl(ix,iy)*[-4*dxx,dxx,dxx,dxx,dxx]';
                ind = ind + M;
                f_lu(ie) = Carl(ix,iy)*f(ix, iy);
        end
    end
    CarlLaplace = sparse(iloc,jloc,vals,NN,NN);
end