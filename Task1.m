% MATLAB script for Assessment Item-1
% Task-1
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

% and following steps
[r,c] = size (Igray); % creates the row and column to define the image co -ordinates of the igray image 
scale = [3,3]; % will scale the image to 3 * the igray image size 
outputI = zeros (scale(1)*r,scale(2)*c, class(Igray));% do the zero padding to the edge of the image and multply the scale and co-rdinates 
for i=1:scale(1)*r % loops through the x co-ordinates 
    for j=1:scale(2)*c %loops through the y co-ordinates 
        
       newRow = round((i-1)*(r-1)/(scale(1)*r-1)+1);% this part will scale the row from the ouputl to the igray (input to ouput)
       newCol = round( (j-1)*(c-1)/(scale(2)*c-1)+1 );% this part will scale the colum from the outpul to the igray 
       outputI(i,j) = Igray(newRow,newCol); % apply the new row  and column to the output 
    end 
end
figure;
imshow(outputI) %https://stackoverflow.com/questions/1550878/nearest-neighbor-interpolation-algorithm-in-matlab
title ('Step3: Convert nearest neighbour interpoation'); 

%step 4 the bilnear interpolation 

[r,c] = size (Igray); % creates the row and column to define the image co -ordinates of the igray image
factor = 3; % the size of the image on the bilnear interpolation 

rn = floor (factor *r); % iy muiltiple the row by 3 using the factor variable  
rc = floor(factor * c); % it muiliple the column by 3 using the factor variable 
u = 1: (r-1)/(rn-1):r;  % subratract the original and output image then divide both of images
finali = zeros(rn,c,class(Igray)); % puts zeros at the age of the images 
for i = 1:rn % loops through to final image 
    tf = floor(u(i)); 
    f = u(i)- tf; 
    if f 
        finali (i,:) = (1-f)*Igray(tf,:)+f*Igray(tf+1,:); % looks through the channel 
    else 
        finali(i,:)= Igray(u(i),:); % shows the output 
    end 
end 
p = 1 : (c-1)/ (rc-1): c; 
final2 = zeros (rn,rc,class(Igray));% adds zeros to the age of the image  
for j = 1: rc % loops through the the mulpled column 
    
    tp = floor (p(j)); 
    f= p(j) - tp; 
    if f 
       final2 (:,j) = (1-f)*finali(:,tp)+f*finali(:,tp+1);     
    else 
        final2 (:,j)= finali(:,p(j)); % creates the output of image 
        
    end 
end 
imshow(final2)  
title('Step-4: Conversion of input image to bilnear interpolation');
%%https://www.researchgate.net/figure/51166868_fig10_Specialised-code-for-2D-bilinear-interpolation




