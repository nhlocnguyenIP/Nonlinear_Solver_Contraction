fig = figure;
imagesc(x,x,u');
colorbar;
set(gca,'fontsize',20,'ydir','normal');
st = sprintf('Pic/u_comp%d_noise%d',caseid,nois);
saveas(fig,st,'jpg');

fig = figure;
imagesc(x,x,u_true');
colorbar;
set(gca,'fontsize',20,'ydir','normal');
st = sprintf('Pic/u_true%d',caseid);
saveas(fig,st,'jpg');

temp = abs(u_true - u)/max(max(abs(u_true)));
%fig = figure;
imagesc(x,x,temp');
colorbar;
set(gca,'fontsize',20,'ydir','normal');
st = sprintf('Pic/u_diff%d_noise%d',caseid,nois);
saveas(fig,st,'jpg');

if (nois == 0)
    fig = figure;
    plot(err,'linewidth',4);
    set(gca,'fontsize',20,'ydir','normal');
    st = sprintf('Pic/err%d_noise%d',caseid,nois);
    saveas(fig,st,'jpg');
end

clear fig;

