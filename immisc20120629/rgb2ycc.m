% rgb2ycc transfers color space from rgb to ycc
%
% ycc = rgb2ycc(rgb)
%
%
%Output parameter:
% ycc: ycc image
%
%
%Input parameter:
% rgb: rgb image
%
%
%Example:
% rgb = imread('img.jpg');
% ycc = rgb2ycc( rgb )
%
%
%Version: 20120601


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Miscellaneous tools for image processing                 %
%                                                          %
% Copyright (C) 2012 Masayuki Tanaka. All rights reserved. %
%                    mtanaka@ctrl.titech.ac.jp             %
%                                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function ycc = rgb2ycc(rgb)

A = [ 0.299, 0.587,0.114; ...
     -0.169,-0.331,0.500; ...
      0.500,-0.419,0.081];

ycc = zeros(size(rgb));
for k=1:3
 ycc(:,:,k) = A(k,1) * rgb(:,:,1) + A(k,2) * rgb(:,:,2) + A(k,3) * rgb(:,:,3);
end

