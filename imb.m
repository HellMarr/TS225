function triplet = imb(img_src)
    triplet = struct('img',[],'mask',[],'boite',[]);
    [h1,w1,z1] = size(img_src);
    m = ones(h1,w1);
    b = [1,1;w1,h1];
    triplet.img = img_src;
    triplet.mask = m;
    triplet.boite = b;
end

