close all
clc
clear

img_src = double(imread('./Img/bo.jpg'));
[h_src,w_src,z_src] = size(img_src);
img_dest = double(imread('./Img/avenue'));
[h_dest,w_dest,z_dest] = size(img_dest);

nb_projection = 2;  %Paramètres si on veut faire plus de 1 projection

img_finale = img_dest;
for k=1:nb_projection
    [H,coo] = find_H(img_dest,img_src); 
    max_x = max(coo(:,1));
    max_y = max(coo(:,2));
    min_x = min(coo(:,1));
    min_y = min(coo(:,2));
    for i=min_x:max_x
        for j=min_y:max_y
            [x,y] = homographie(H,i,j);
            if x > 0 && x <= w_src && y > 0 && y <= h_src
                img_finale(j,i,:) = img_src(y,x,:);
            end
        end
    end
end

figure,
imagesc(uint8(img_finale));
title("Image finale");





    