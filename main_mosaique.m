close all
clc
clear

img_src = double(imread('./Img/kremlin.jpg'));
[h_src,w_src,z_src] = size(img_src);

% figure,
% imagesc(uint8(img_src));
% [X1,Y1] = ginput(4);
% close;
% img1 = img_src(min(floor(Y1)):max(floor(Y1)),min(floor(X1)):max(floor(X1)),:);
% 
% figure,
% imagesc(uint8(img_src));
% [X2,Y2] = ginput(4);
% close;
% img2 = img_src(min(floor(Y2)):max(floor(Y2)),min(floor(X2)):max(floor(X2)),:);

%[H,coo] = find_H(img1,img2); 

[img1,mask1,boite1]=imb(img_src(1:1000,1:2000,:));
[img2,mask2,boite2]=imb(img_src(700:1800,1100:2600,:));

H12 = [0.029314227862646,0.438942937014629,2.953225383575869e+02;0.354925443585198,0.101191677121572,2.697748273876351e+02;1.801520665771357e-04,-2.323609677897337e-04,1];
coo2 = [1686,874;1867,877;1690,957;1848,960];
%[H12,coo2] = find_H(img1,img2);
[img1,mask1,boite1] = new_imb(img1,mask1,boite1,img2,false,H12,coo2);


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
%    0.029314227862646     end
%         if k > h1-max_x && j > w1-max_y 
%            mask(k,j,:) = img2(k-h1+max_x,j-w1+max_y,:); 
%         end
%     end
% end
% imagesc(uint8((mask)));


