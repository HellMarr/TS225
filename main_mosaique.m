close all
clc
clear

img_src = double(imread('./Img/kremlin.jpg'));
[h_src,w_src,z_src] = size(img_src);

img1 = img_src(1:1000,1:2000,:);
img2 = img_src(800:1800,1200:2600,:);

[H,coo] = find_H(img1,img2); 

% dim = 1000;
% img_dest = cat(3,zeros(dim),zeros(dim),zeros(dim));
% 
% img_finale1 = img_dest;
% 
% [H,coo] = find_H(img_dest,img_src); 
% max_x = max(coo(:,1));
% max_y = max(coo(:,2));
% min_x = min(coo(:,1));
% min_y = min(coo(:,2));
% for i=min_x:max_x
%     for j=min_y:max_y
%         [x,y] = homographie(H,i,j);
%         if x > 0 && x <= h_src && y > 0 && y <= w_src
%             img_finale1(j,i,:) = img_src(x,y,:);
%         end
%     end
% end
% figure,
% imagesc(uint8(img_finale1));
% 
% img_finale2 = img_dest;
% 
% [H,coo] = find_H(img_dest,img_src); 
% max_x = max(coo(:,1));
% max_y = max(coo(:,2));
% min_x = min(coo(:,1));
% min_y = min(coo(:,2));
% for i=min_x:max_x
%     for j=min_y:max_y
%         [x,y] = homographie(H,i,j);
%         if x > 0 && x <= h_src && y > 0 && y <= w_src
%             img_finale2(j,i,:) = img_src(x,y,:);
%         end
%     end
% end
% figure,
% imagesc(uint8(img_finale2));

