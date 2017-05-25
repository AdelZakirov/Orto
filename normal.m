function [normx1, normy1] = normal(a,b,x0,y0)
    d0 = 50;
    normx = (x0-1000):0.1:(x0+1000);
    ydirx0 = 2*a*x0+b;
    normy = y0 - (normx - x0)./ydirx0;
    if (ydirx0 == 0)
        normx = ones(1,length(normx))*x0;
        normy = (y0-1000):0.1:(y0+1000);
    end
    rightx = normx(round(end/2)+1:end);
    righty = normy(round(end/2)+1:end);
    leftx = normx(1:round(end/2));
    lefty = normy(1:round(end/2));
    d = sqrt( (rightx -x0).^2 + (righty -y0).^2 );
    [mindr,rind] = min(abs(d-d0));
    d = sqrt( (leftx -x0).^2 + (lefty -y0).^2 );
    [mindl,lind] = min(abs(d-d0));
    normx1 = normx(lind:round(length(normx)/2)+rind);
    normy1 = normy(lind:round(length(normx)/2)+rind);
end