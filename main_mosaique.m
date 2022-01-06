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
%triplet1=imb(img_1);
%triplet2=imb(img_2);

%% Calcul dans le référentiel d'une image pour 2 images

H12 = [3.37919199928602,0.216606448103957,-2574.29348498126;0.145833966293181,2.98069234619316,-1042.88337829781;0.00140916748135691,0.00131418905337258,1];
coo2 = [913,406;1004,408;915,457;1001,460];
triplet1 = new_imb(triplet1,triplet2.img,true,H12,coo2);

%% Fusion

triplet3.img = 0;
triplet3.mask = 0;
triplet3.boite = 0;
triplet_final = fusion(triplet1,triplet2,triplet3,false);

%% Affichage

figure,
imshow(uint8(triplet_final.img));
title("Mosaïque à 2 images");


%% Calcul dans le référentiel d'une image pour 3 images

triplet3=imb(img_3);
triplet4=imb(img_4);
triplet5=imb(img_5);

triplet3 = new_imb(triplet3,triplet4.img,true,H12,coo2);
close all;
triplet5 = new_imb(triplet5,triplet4.img,true,H12,coo2);

%% Fusion à trois images

triplet_final = fusion(triplet3,triplet4,triplet5,true);

%% Affichage à trois images

figure,
imshow(uint8(triplet_final.img));
title("Mosaïque à 3 images");

