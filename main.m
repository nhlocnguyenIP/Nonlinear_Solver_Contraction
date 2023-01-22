clear all;
close all;
R = 1;
Nx = 150;
dx = 2*R/(Nx-1);
x = -R:dx:R;
[X,Y] = meshgrid(x);

caseid = 4; %We want to solve the equation \Delta u + F(u, ux, uy) = f(x,y);
[f_true, F_true, u_true] = TheSourceF(X, Y, caseid);
Boundarydata = u_true;
Boundarydata(3:Nx-2,3:Nx-2) = 0;
nois = 10;
% ra = -1 + 2*rand(size(u_true));
%Boundarydata = Boundarydata.*(1 + nois/100*ra);

tic

initf = zeros(size(f_true));
[Dir, data_lu] = DirichletMatrix(Nx, Boundarydata);
[Neu, neu_u_lu] = NeumannMatrix(Nx, dx, Boundarydata);
ra = -1 + 2*rand(size(data_lu));
data_lu = data_lu.*(1 + nois/100*ra);
ra = -1 + 2*rand(size(data_lu));
neu_u_lu = neu_u_lu.*(1 + nois/100*ra);
u = SolveLinearEqn(X,Y, initf, Dir, Neu, data_lu, neu_u_lu);

% figure
% imagesc(u);
% colorbar;
err = [];
ii = 1;
kappa = 10^-3;
e = 1;
while (e > kappa && ii <= 10)
    u0 = u;
    [uy, ux] = Gradient(u,dx);
    F = TheFunctionF(u, ux, uy, caseid);
    f = f_true - F;
    %u = SolveLinearEqn(X, f, u_true,nois);
    u = SolveLinearEqn(X,Y, f, Dir, Neu, data_lu, neu_u_lu);
    e = max(max(abs(u0 - u)));
    err(ii) = e;
%     if (ii == 1)
%         fig = figure;
%         imagesc(u0');
%         colorbar;
%         set(gca,'fontsize',20,'ydir','normal');
%         st = sprintf('Pic/u_init%d,noise%d',caseid,nois);
%         saveas(fig,st,'jpg');
%     end
    ii = ii + 1;
end

toc
if (nois==0 || nois==10)
    pic;
end


temp = abs(u_true - u);
Linf = max(max(temp))/max(max(abs(u_true)))
I = 3:Nx;
L2 = (sum((u_true - u).^2,'all')/sum(u_true.^2,'all'))^(0.5)
[ux, uy] = Gradient(u,dx);
[u_truex, u_truey] = Gradient(u_true,dx);
temp1 = (u_true - u).^2 + (u_truex - ux).^2 + (u_truey - uy).^2;
temp2 = u_true.^2 + u_truex.^2 + u_truey.^2;
%H1 = (sum(temp1(I,I),'all')/sum(temp2(I,I),'all'))^0.5



% st = sprintf('Data/data%d_noise%d',caseid,nois);
% save(st);