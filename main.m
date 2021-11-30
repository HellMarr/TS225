close all
clc
clear

img_src = double(imread('./Img/portrait'));
[h_src,w_src,z_src] = size(img_src);
img_dest = double(imread('./Img/avenue'));
[h_dest,w_dest,z_dest] = size(img_dest);

H = find_H(img_dest,img_src);

img_finale = img_dest;
for i=1:w_dest
    for j=1:h_dest
        [x,y] = homographie(H,i,j);
        if x > 0 && x <= h_src && y > 0 && y <= w_src
            img_finale(j,i,:) = img_src(x,y,:);
        end
    end
end

figure,
imagesc(uint8(img_finale));



    