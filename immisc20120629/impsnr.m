% impsnr evaluates the psnr and the rmse beween images
%
% [psnr rmse] = impsnr(X, Y, peak, b)
%
%Output parameters:
% psnr: psnr between images X and Y
% rmse: rmse between images X and Y
%
%Input parameters:
% X: image whose dimensions should be same to that of Y
% Y: image whose dimensions should be same to that of X
% peak (optional): peak value (default: 255)
% b (optional): border size to be neglected for evaluation
%
%Example:
% X = imreadind('X.png');
% Y = imreadind('Y.png');
% [psnr rmse] = impsnr(X, Y);
% fprintf('%g %g\n', psnr, rmse );
%
%
%Version: 20120618



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Miscellaneous tools for image processing                 %
%                                                          %
% Copyright (C) 2012 Masayuki Tanaka. All rights reserved. %
%                    mtanaka@ctrl.titech.ac.jp             %
%                                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [psnr rmse] = impsnr(X, Y, peak, b)

if( nargin < 3 )
 peak = 255;
end

if( nargin < 4 )
 b = 0;
end

if( b > 0 )
 X = X(b:size(X,1)-b,b:size(X,2)-b,:);
 Y = Y(b:size(Y,1)-b,b:size(Y,2)-b,:);
end

dif = (X-Y);
dif = dif .* dif;
for i=1:size(dif,3)
 d = dif(:,:,i);
 mse = sum(d(:)) / numel(d);
 rmse(i) = sqrt(mse);
 psnr(i) = 10 * log10( peak*peak/mse );
end
