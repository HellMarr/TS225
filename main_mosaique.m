close all
clc
clear

img_src = double(imread('./Img/kremlin.jpg'));
% img_1 = double(imread('./Img/toureiffel1.jpg'));
% img_2 = double(imread('./Img/toureiffel2.jpeg'));
[h_src,w_src,z_src] = size(img_src);

%% Initialisation des triplets [I,M,B]

triplet1=imb(img_src(400:1400,500:2100,:));
triplet2=imb(img_src(700:1600,1200:2300,:));
% [img1,mask1,boite1]=imb(img_1);
% [img2,mask2,boite2]=imb(img_2);

%% Calcul dans le référentiel d'une image pour toutes les images

H12 = [3.37919199928602,0.216606448103957,-2574.29348498126;0.145833966293181,2.98069234619316,-1042.88337829781;0.00140916748135691,0.00131418905337258,1];
coo2 = [913,406;1004,408;915,457;1001,460];
triplet1 = new_imb(triplet1,triplet2.img,false,H12,coo2);

%% Fusion

triplet_final = fusion(triplet1,triplet2);

%% Affichage

figure,
imshow(uint8(triplet_final.img));
title("Mosaïque à 2 images");


