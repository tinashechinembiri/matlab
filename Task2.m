% MATLAB script for Assessment Item-1
% Task-2
clear; close all; clc;
I = imread('SC.png'); 
%%imshow(I); 
%imagesc(I); 
image(I);

[row, col] = size (I);

A=80; B = 100; C=220; 

for i = 1:row
    for j = 1:col 
        if I(i,j)>=A &&(I(i,j)<=B)
            
        I(i,j) =  C;
        end 
        
    end 
end 
imshow(I)

 

