function [f, F, u] = TheSourceF(X, Y, caseid)
    if (caseid == 1)
        temp = pi*(X+Y);
        u = sin(temp);
        ux = pi*cos(temp);
        uy = pi*cos(temp);
        Lu = -2*pi^2*sin(temp);
        F = TheFunctionF(u, ux, uy, caseid);
        f = (Lu + F);
    end
    
    if (caseid == 2)
        u = X.^2 - 2*Y.^2;
        ux = 2*X;
        uy = -4*Y;
        Lu = -2;
        F = TheFunctionF(u, ux, uy, caseid);
        f = (Lu + F);
    end
    
    if (caseid == 3)
        temp = pi*(X.^2 + Y.^2);
        u = sin(temp);
        ux = 2*pi*X.*cos(temp);
        uy = 2*pi*Y.*cos(temp);
        Lu = -4*pi*(temp.*sin(temp) - cos(temp));
        F = TheFunctionF(u, ux, uy, caseid);
        f = (Lu + F);
    end
    if (caseid == 4)
 %        temp = 2*pi*((X-0.5).^2 + (Y+0.5).^2);
%         u = sin(temp);
%         ux = 2*2*pi*(X-0.5).*cos(temp);
%         uy = 2*2*pi*(Y+0.5).*cos(temp);
%         Lu = 2*(-4*pi*(temp.*sin(temp) - cos(temp)));
%         F = TheFunctionF(u, ux, uy, caseid);
%         f = (Lu + F);
        temp  = 4*pi*X - 2*pi*Y.^2;
        u = sin(temp) + Y ;
        ux = 4*pi*cos(temp);
        uy = -4*pi*Y.*cos(temp) + 1;
        Lu = -16*pi*(pi*(Y.^2 + 1).*sin(temp)+cos(temp)/4);
        F = TheFunctionF(u, ux, uy, caseid);
        f = (Lu + F);
    end
end