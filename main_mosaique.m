close all
clc
clear

img_src = double(imread('./Img/kremlin.jpg'));
img_1 = double(imread('./Img/toureiffel1.jpg'));
img_2 = double(imread('./Img/toureiffel2.jpeg'));
[h_src,w_src,z_src] = size(img_src);

%% Initialisation des triplets [I,M,B]

[img1,mask1,boite1]=imb(img_src(1:1000,1:2000,:));
[img2,mask2,boite2]=imb(img_src(800:1800,1200:2600,:));
[img1,mask1,boite1]=imb(img_1);
[img2,mask2,boite2]=imb(img_2);

%% Calcul dans le référentiel d'une image pour toutes les images

H12 = [0.029314227862646,0.438942937014629,2.953225383575869e+02;0.354925443585198,0.101191677121572,2.697748273876351e+02;1.801520665771357e-04,-2.323609677897337e-04,1];
coo2 = [1686,874;1867,877;1690,957;1848,960];
[img1,mask1,boite1] = new_imb(img1,mask1,boite1,img2,false,H12,coo2);

%% Fusion

img_final = fusion(img1,mask1,boite1,img2,mask2,boite2);

%% Affichage

imshow(uint8(img_final));


