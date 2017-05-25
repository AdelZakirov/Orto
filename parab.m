function [xx,yy, a, b, c] = parab(x,y)
    [a,b,c] = par_coef(x,y);
    xx = 1:1:776;
    yy = round(a.*xx.*xx + b.*xx + c);
end