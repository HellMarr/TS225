close all
clc
clear

%% Image de base
img_src = double(imread('./Img/kremlin.jpg'));

%% Initialisation des triplets [I,M,B] pour les 2 imagettes

imagette1 = img_src(400:1400,500:2100,:);
triplet1 = imb(imagette1);
imagette2 = img_src(700:1600,1200:2300,:);
triplet2 = imb(imagette2);

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
