clc;
clear all;
close all;

I2 = imread('C:\Users\PRAVEEN\Downloads\check_images\sample images\d_1.jpg');
I2 = imresize(I2,[500 1200]);
I1 = imread('C:\Users\PRAVEEN\Downloads\check_images\sample images\6.jpg');
I1 = imresize(I1,[500 1200]);

%%%%%%% The functions used in the main.m file %%%%%%%
% Function "d2gauss.m":
% This function returns a 2D Gaussian filter with size n1*n2; theta is 
% the angle that the filter rotated counter clockwise; and sigma1 and sigma2
% are the standard deviation of the gaussian functions.
% n1=10;sigma1=2;n2=10;sigma2=2;theta=0;
% 
% G=d2gauss(n1,sigma1,n2,sigma2,theta);
% [dx dy] = gradient(G);
% Ix = conv2(rgb2gray(I1),dx,'same');
% Iy = conv2(rgb2gray(I1),dy,'same');
% Im = sqrt(Ix.*Ix + Iy.*Iy);
% 
% figure;
% imshow(Im)
% 
% figure;
% imagesc(Im)
% 
% level = graythresh(I1);
% 
% BW = im2bw(I1,level);
% 
ED = edge(rgb2gray(I1),'canny');

[H theta rho] = hough(ED);
P = houghpeaks(H,5,'threshold',ceil(0.3*max(H(:))));
lines = houghlines(ED,theta,rho,P,'FillGap',5,'MinLength',7);

figure, imshow(I1), hold on
max_len = 0;
for k = 1:length(lines)
    lenLin(k) = sqrt(sum((lines(k).point1 - lines(k).point2).^2));
    
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

   % Plot beginnings and ends of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');

   % Determine the endpoints of the longest line segment
   len = norm(lines(k).point1 - lines(k).point2);
   if ( len > max_len)
      max_len = len;
      xy_long = xy;
   end
end
[maxLenLin argmaxLenLin]= max(lenLin);
skewAngle = lines(argmaxLenLin).theta;
% highlight the longest line segment
plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','red');

skew_rotate = skewAngle - 90;

IM = imrotate(I1,skew_rotate);

imwrite(IM,'skewedimage.jpg','jpeg','Quality',100);

level = graythresh(IM);
BW = im2bw(IM,level);
n1=10;sigma1=2;n2=10;sigma2=2;theta=0;
 
G=d2gauss(n1,sigma1,n2,sigma2,theta);
[dx dy] = gradient(G);
Ix = conv2(rgb2gray(IM),dx,'same');
Iy = conv2(rgb2gray(IM),dy,'same');
Im = sqrt(Ix.*Ix + Iy.*Iy);
 
figure;
imshow(Im)
 
figure;
imagesc(Im)
 
imHPP = sum(Im,1);
imVPP = sum(Im,2);
 
[horPeaks horLocs]= findpeaks(imHPP, 'MINPEAKDISTANCE', 20, 'NPEAKS', 4);
[verPeaks verLocs]= findpeaks(imVPP, 'MINPEAKDISTANCE', 20, 'NPEAKS', 4);
 
newIm = IM(96:420, 75:1010, :);
imwrite(newIm, 'extractedBlock.jpg');
BW = imgrad(rgb2gray(IM));
[Ilabel num]=bwlabel(BW);
disp(num)
Iprops=regionprops(Ilabel);
Ibox=[Iprops.BoundingBox];
Ibox=reshape(Ibox,[4 num]);
 
m=1;%%%%%%%%discarding insignificant objects based on threshold and storing the corner pixels in Iobj
for l=1:num
    if (Ibox(3,l)>10)
        Iobj(:,m)=Ibox(:,l);
        m=m+1;
    end
end
%  %%%%%%%%%%%%%%%%%%%%%%
hold on;
figure;
imshow(BW);
for cnt=1:m-1
    rectangle('position',Iobj(:,cnt),'edgecolor','r');
end
hold off;
cnt=1;
for cnt=1:m-1
    a=floor(Iobj(2,cnt));
    if(a==0)
        a=1;
    end
    b=floor(Iobj(2,cnt)+Iobj(4,cnt));
    c=floor(Iobj(1,cnt));
    if(c==0)
        c=1;
    end
    d=floor(Iobj(1,cnt)+Iobj(3,cnt));

    mag_check=BW(a:b,c:d);  
    mag_check=~mag_check;
figure;
imshow(mag_check); 
