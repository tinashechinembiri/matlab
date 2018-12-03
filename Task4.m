% MATLAB script for Assessment Item-1
% Task-4
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
igray = medfilt2(igray,[5 5]); 
figure, imshow (igray);
title ('3 - median filter');

new = histeq(igray);
figure, imshow(new); 
title('histogram');
%crop the image 
%binary image 
binaryI = imbinarize(new,0.27);
imshow(binaryI); title('binary image');
%complement image 
compIm = imcomplement(binaryI);
figure,
imshow(compIm)
%open image 
 st = strel ('disk',2);
 newImage = imopen(compIm,st); 
 figure, imshow(newImage);
 title('open'); 
 %close image 
 newImage = imclose(newImage,st);
 figure, imshow(newImage);title("close");
 %fill images
 newImage = imfill(newImage,'holes');
 figure, imshow(newImage); title('i am fill ');


%roudness and area metric 
[L,R] =  bwboundaries(newImage, 'noholes' );



hold on
for i = 1:length(L)
  boundary = L{i};
  plot(boundary(:,2), boundary(:,1), 'g', 'LineWidth', 2)
end

 

stats = regionprops (R,'Area', 'Centroid'); 
th = 0.94;
for i = 1:length(L)
    
  sq = diff(boundary).^2;    
  perimeter = sum(sqrt(sum(sq,2)));
  
  
  imagearea = stats(i).Area;
  
  
  metric = 4*pi*imagearea/perimeter^2;
    

   
    if metric > th
    imagecentral = stats(i).Centroid;
    plot(imagecentral(1),imagecentral(2),'ko');
    end
    
    firstimage = metric <3&imagearea < 2000;
    roundobjet = find(firstimage); 
    finalImage = ismember(newImage,roundobjet)>0.7;
%roundobject = find (metric >)
%finalImage = ismember (newImage,metric);
end 
figure, imshow(finalImage);
title('Final image');