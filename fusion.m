function [img_final] = fusion(img1,mask1,boite1,img2,mask2,boite2)
%FUSION Summary of this function goes here
%   Detailed explanation goes here
    y_min = min(boite1(1,1),boite2(1,1));
    y_max = max(boite1(2,1),boite2(2,1));
    x_min = min(boite1(1,2),boite2(1,2));
    x_max = max(boite1(2,2),boite2(2,2));
    img_final = zeros(x_max-x_min+1,y_max-y_min+1,3);
    %Resize des masques et des images dans la boite engoblante
    img1_englob = zeros(x_max-x_min+1,y_max-y_min+1,3);
    img1_englob(boite1(1,2)-x_min+1:boite1(2,2)-x_min+1,boite1(1,1)-y_min+1:boite1(2,1)-y_min+1,:) = img1;
    img2_englob = zeros(x_max-x_min+1,y_max-y_min+1,3);
    img2_englob(boite2(1,2)-x_min+1:boite2(2,2)-x_min+1,boite2(1,1)-y_min+1:boite2(2,1)-y_min+1,:) = img2;
    mask1_englob = zeros(x_max-x_min+1,y_max-y_min+1);
    mask1_englob(boite1(1,2)-x_min+1:boite1(2,2)-x_min+1,boite1(1,1)-y_min+1:boite1(2,1)-y_min+1,:) = mask1;
    mask2_englob = zeros(x_max-x_min+1,y_max-y_min+1);
    mask2_englob(boite2(1,2)-x_min+1:boite2(2,2)-x_min+1,boite2(1,1)-y_min+1:boite2(2,1)-y_min+1,:) = mask2;
    %Addition des masques 
    mask = zeros(x_max-x_min+1,y_max-y_min+1,3);
    for i=1:x_max-x_min+1
        for j=1:y_max-y_min+1
            mask(i,j) = mask1_englob(i,j) + mask2_englob(i,j);
        end
    end
    %Création de l'image finale
    for i=1:x_max-x_min+1
        for j=1:y_max-y_min+1
              img_final(i,j,:) = floor((img1_englob(i,j,:) + img2_englob(i,j,:))/mask(i,j));
        end
    end
end

