function [x2,y2] = homographie(H,x1,y1)
    deno = H(3,1)*x1+H(3,2)*y1+H(3,3);
    x2 = floor((H(1,1)*x1+H(1,2)*y1+H(1,3))/deno);
    y2 = floor((H(2,1)*x1+H(2,2)*y1+H(2,3))/deno);
end