function [img_src,m,b] = imb(img_src)
[h1,w1,z1] = size(img_src);
m = ones(h1,w1);
b = [1,1;w1,h1];
end

