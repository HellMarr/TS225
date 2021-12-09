close all
clc
clear

img_src = double(imread('./Img/kremlin.jpg'));
[h_src,w_src,z_src] = size(img_src);

img1 = img_src(1:1000,1:2000,:);
[h1,w1,z1] = size(img1);
mask1 = ones(h1,w1);
boite1 = [1,1;w1,h1];
img2 = img_src(800:1800,1200:2600,:);
[h2,w2,z2] = size(img2);
mask2 = ones(h2,w2);
boite2 = [1,1;w2,h2];

[img1,mask1,boite1] = etape_2(img1,mask1,boite1,img2,mask2,boite2);


%[H2,coo2] = find_H(img2,img1);

% max_x = floor(max(coo1(:,1)));
% max_y = floor(max(coo1(:,2)));
% min_x = floor(min(coo1(:,1)));
% min_y = floor(min(coo1(:,2)));
% max_x2 = floor(max(coo2(:,1)));
% max_y2 = floor(max(coo2(:,2)));
% min_x2 = floor(min(coo2(:,1)));
% min_y2 = floor(min(coo2(:,2)));
% mask = zeros(h1+h2-max_x,w1+w2-max_y,3);
% 
% %Image,Mask,Boite = fonct(I,M,B,I2,M2,B2);
% 
% for k=1:h1+h2-max_x
%     for j=1:w1+w2-max_y
%         if k < h1 && j < w1
%            mask(k,j,:) = img1(k,j,:);
%         end
%         if k > h1-max_x && j > w1-max_y 
%            mask(k,j,:) = img2(k-h1+max_x,j-w1+max_y,:); 
%         end
%     end
% end
% imagesc(uint8((mask)));

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

