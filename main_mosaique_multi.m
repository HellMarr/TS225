close all
clear
clc

%% Image de base
img_src = double(imread('./Img/kremlin.jpg'));
nb_imagettes = 3;

%% Initialisation des triplets [I,M,B] pour les imagettes

imagette1 = img_src(300:1400,800:1700,:);
triplet1 = imb(imagette1);
imagette2 = img_src(500:1000,1300:2100,:);
triplet2 = imb(imagette2);
imagette3 = img_src(900:1700,900:1900,:);
triplet3 = imb(imagette3);

%Tableau qui va servir pour les imagettes nécessitant de passer par
%plusieurs espaces
triplets = [triplet1 triplet2 triplet3];

%% Calcul dans le référentiel d'une image pour nb_imagettes images

%Choisir l'espace dans lequel vont être projeter les imagettes
triplet_dest = triplet2;

%Pour les imagettes ayant 4 points en communs avec l'imagette choisie
triplet1 = commun(triplet_dest,triplet1);

%Pour les imagettes n'ayant pas de points en commun avec l'imagette choisie
triplet3 = non_commun(triplet_dest,triplet3,triplets(1));

%% Fusion à nb_imagettes images

triplet_final = fusion(triplet1,triplet2,triplet3);

%% Affichage à nb_imagettes images

figure,
imshow(uint8(triplet_final.img));
titre = sprintf("Mosaïque à %d images",nb_imagettes);
title(titre);