function F = TheFunctionF(u, ux, uy, caseid)
    if (caseid == 1)
        F = u + sqrt(ux.^2 + uy.^2 + 1);
    end
    if (caseid == 2)
        F =  (ux - uy.^2);
    end
     if (caseid == 3)
        F =  abs(ux) - abs(uy);
     end
    if (caseid == 4)
        F =  u.^2   - exp(uy);
        I = find(exp(uy) > 30);
        F(I) = 0;
    end
end