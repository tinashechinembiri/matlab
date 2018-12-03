clear; close all; clc;

I = imread('Noisy.png');
igray = rgb2gray(I);
[l,r] = size (igray);
b = 5; 
v = ones(b); 
[M,N] = size(v); 

w =1:M; 
f = round (median(w)); 
output = zeros (l+2*(f-1),r+2*(f-1));
for i=f:(l+(f-1))
    for j =f: (r+(f-1))
     output(i,j)= igray(i-(f-1),j-(f-1));    
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
imshow (uint8(output)); 
 