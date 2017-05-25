%%
figure
imagesc(up)
[xx,yy,a,b,c] = parab(x,y);
hold on
plot(xx,yy)
%%
im = [];
ind = 1;
for i = 1:length(xx);
    [nx,ny] = normal2(a,b,xx(i),yy(i));
    if(sum(ny>size(up,1))==0 && sum(ny<0)==0)
        xlims = unique([round(nx(1)-1), round(nx), round(nx(end)+1)]);
        ylims = unique([round(ny(1)-1), round(ny), round(ny(end)+1)]);
        crop = interp2(xlims, ylims, single(up(ylims,xlims)), nx, ny);
%         im{ind} = crop';
        im = [im, crop'];
        ind = ind+1;
%         im = [im, up(ny,nx)];
        plot(nx,ny)
    end
%     plot(nx,ny)
end