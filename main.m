close all
clc
clear

portrait = imread('./Img/portrait');
avenue = imread('./Img/avenue');

H = find_H(avenue,portrait);