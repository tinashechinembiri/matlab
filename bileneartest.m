clear; close all; clc;

% Step-1: Load input image
I = imread('Zebra.jpg');
figure;
imshow(I);
title('Step-1: Load input image');

% Step-2: Conversion of input image to grey-scale image
Igray = rgb2gray(I);
figure;
imshow(Igray);
title('Step-2: Conversion of input image to greyscale');
title('Step4: Convert bilinear interpolation')

[r,c] = size (Igray); 
factor = 3; % the size of the image on the bilnear interpolation 

rn = floor (factor *r); 
rc = floor(factor * c); 
u = 1: (r-1)/(rn-1):r; 
finali = zeros(rn,c,class(Igray)); 
for i = 1:rn 
    tf = floor(u(i)); 
    f = u(i)- tf; 
    if f 
        finali (i,:) = (1-f)*Igray(tf,:)+f*Igray(tf+1,:); 
    else 
        finali(i,:)= Igray(u(i),:); 
    end 
end 
p = 1 : (c-1)/ (rc-1): c; 
final2 = zeros (rn,rc,class(Igray)); 
for j = 1: rc
    
    tp = floor (p(j)); 
    f= p(j) - tp; 
    if f 
       final2 (:,j) = (1-f)*finali(:,tp)+f*finali(:,tp+1); 
    else 
        final2 (:,j)= finali(:,p(j));
        
    end 
end 
imshow(final2)   %%https://www.researchgate.net/figure/51166868_fig10_Specialised-code-for-2D-bilinear-interpolation