close all
clc
clear

portrait = double(imread('./Img/portrait'));
avenue = double(imread('./Img/avenue'));

[coo2,H] = find_H(avenue,portrait);
coo2(:,3) = 1;
disp(coo2)

img = remake(H,portrait,coo2);