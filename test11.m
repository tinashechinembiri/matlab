clear; close all; clc;
I = imread('Starfish.jpg');
figure;
imshow(I);
title ('1- Original');

igray = rgb2gray(I);
figure;
imshow(igray);
title ('task 2 - Greyscale');
%median 
% igray = medfilt2(igray,[5 5]); 
% figure, imshow (igray);
% title ('3 - median filter');

new = histeq(igray);
figure, imshow(new); 
title('histogram');

new = histeq(igray);
figure, imshow(new); 
title('2- histogram');