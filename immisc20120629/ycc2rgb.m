% ycc2rgb transfers color space from ycc to rgb
%
% ycc = rgb2ycc(rgb)
%
%
%Output parameter:
% rgb: rgb image
%
%
%Input parameter:
% ycc: ycc image
%
%
%Example:
% img = imread('img.jpg');
% ycc = rgb2ycc( img );
% rgb = ycc2rgb( ycc );
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
function rgb = ycc2rgb(ycc)

A = [ 0.299, 0.587,0.114; ...
     -0.169,-0.331,0.500; ...
      0.500,-0.419,0.081];
A = inv(A);

rgb = zeros(size(ycc));
for k=1:3
 rgb(:,:,k) = A(k,1) * ycc(:,:,1) + A(k,2) * ycc(:,:,2) + A(k,3) * ycc(:,:,3);
end

