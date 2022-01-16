close all
clc
clear

img_src = double(imread('./Img/kremlin.jpg'));
img_1 = double(imread('./Img/toureiffel1.jpg'));
img_2 = double(imread('./Img/toureiffel2.jpeg'));
img_3 = double(imread('./Img/sacrecoeur4.jpg'));
img_4 = double(imread('./Img/sacrecoeur2.jpg'));
img_5 = double(imread('./Img/sacrecoeur3.jpg'));
[h_src,w_src,z_src] = size(img_src);

%% Initialisation des triplets [I,M,B]

triplet1=imb(img_src(400:1400,500:2100,:));
triplet2=imb(img_src(700:1600,1200:2300,:));

%% Calcul dans le référentiel d'une image pour 2 images

triplet_src = triplet1;
triplet_dest = triplet2;
H = find_H(triplet_src.img,triplet_dest.img);
triplet_src_in_dest = new_imb(triplet_src,H);

%% Fusion

triplet_final = fusion(triplet_src_in_dest,triplet_dest);

%% Affichage

figure,
imshow(uint8(triplet_final.img));
title("Mosaïque à 2 images");


%% Calcul dans le référentiel d'une image pour 3 images
% 
% triplet3=imb(img_3);
% triplet4=imb(img_4);
% triplet5=imb(img_5);
% 
% H = find_H(triplet3.img,triplet4.img);
% triplet3 = new_imb(triplet3,H);
% close all;
% H = find_H(triplet5.img,triplet4.img);
% triplet5 = new_imb(triplet5,H);
% 
% %% Fusion à trois images
% 
% triplet_final = fusion(triplet3,triplet4,triplet5);
% 
% %% Affichage à trois images
% 
% figure,
% imshow(uint8(triplet_final.img));
% title("Mosaïque à 3 images");

