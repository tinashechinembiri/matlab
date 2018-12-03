% MATLAB script for Assessment Item-1
% Task-3
clear; close all; clc;
% median filter 
I = imread('Noisy.png');
igray = rgb2gray(I);
[l,r] = size (igray); % will initialization the row and column using the size of the image 
new =  igray-igray; % subract the image into to amke the new one 
k = 5; % size of the neighbourhood image of 5*5 
finali = zeros(k); % adds zeros to the edge of the images 
first = k - floor (k*0.5);

for i = first:1 : l - floor (k*0.5) % will loops through  the image and will look at the pixels of the images 
    for j = first:1:r-floor(k *0.5)
     i1 = i - (floor(k*0.5));
     j1 = j - (floor(k*0.5)); 
     
     for x =1:1:k
         for y = 1:1:k
             finali (x,y) = igray(i1+x-1,j1+y-1); % zoom to nearest neighbour 
         end
     end
    s = reshape(finali,1,[]); % it will take the values and put them in an array 
    [M,N] = size(s); % splits the size of the arrays in to column and rows 
    
for q=1:1:N-1
for p=1:1:N-1
    a=s(1,p);
    b=s(1,p+1);
    if(a>b)
     s(1,p)=b;
     s(1,p+1)=a;
    end
end  
end
mid = s (1,floor(k*k*0.5)+1);
new (i,j)= mid; 
    end 
end 
figure, imshow (new,[]);
%https://stackoverflow.com/questions/27535535/matlab-median-filter-code

% average filter 
[l,r] = size (igray);
b = 5; % make the image 5*5 neighbourhood 
v = ones(b);  % create the value for the factor 
[M,N] = size(v); % creates the size of the row and column for the neighbourhood by 5*5 

w =1:M; % creates a row of M of 1 to 5
f = round (median(w)); % takes the median of the  w thats about 3
output = zeros (l+2*(f-1),r+2*(f-1)); %  creates zeros  around the images 
for i=f:(l+(f-1)) % loops through the pixels 
    for j =f: (r+(f-1))% loops through the pixels 
     output(i,j)= igray(i-(f-1),j-(f-1));   % creates a new output of the image   
    end 
end 
sum =0; 
x=0; 
y=0; 
for i=1:l
    for j=1:r 
        for m=1:M
            for n =1:N
                sum = sum +output (i+x,j+y)*v(m,n); 
                y=y+1;
            end
            y=0; 
            x=x+1; 
        end 
        x=0; 
        output(i,j) = (1/(M*N))*(sum); 
        sum= 0; 
    end 
end 
figure ,imshow (uint8(output)); 
%https://uk.mathworks.com/matlabcentral/fileexchange/41082-averaging-filter-without-using-imfilter



