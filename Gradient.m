function [ux, uy] = Gradient(u,dx)
    ux = zeros(size(u));
    ux(2:end-1,:) = (u(3:end, :) - u(1:end-2,:))/(2*dx);
    ux(1,:) = 2*ux(2,:) - ux(3,:);
    ux(end,:) = 2*ux(end-1,:) - ux(end-2,:);
    
    uy = zeros(size(u));
    uy(:,2:end-1) = (u(:,3:end) - u(:,1:end-2))/(2*dx);
    uy(:,1) = 2*uy(:,2) - uy(:,3);
    uy(:,end) = 2*uy(:,end-1) - uy(:,end-2);
end