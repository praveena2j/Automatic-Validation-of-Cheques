% eachchannel allows us to apply function for each channel
% 
% dst = eachchannel(func, src)
%
%
%Output parameter:
% dst: output of function
%
%Input parameters:
% func: function to be applied
% src: input image data
%
%
%Example:
% X = double(imread('img.jpg'));
% Xdct = eachchannel(@(X)(dct2(X)), X);
%
%
%Version: 20120629

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Miscellaneous tools for image processing                 %
%                                                          %
% Copyright (C) 2012 Masayuki Tanaka. All rights reserved. %
%                    mtanaka@ctrl.titech.ac.jp             %
%                                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function dst = eachchannel(func, src)

if( size(src,3) > 1 )
 for i=1:size(src,3)
  dst(:,:,i) = func(src(:,:,i));
 end
else
 dst = func(src);
end
