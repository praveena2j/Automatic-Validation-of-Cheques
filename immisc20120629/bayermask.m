% bayermask provides sampled bayer CFA data and bayer mask
%
% [bayer mask] = bayermask(data,pattern)
%
%
%Output parameter:
% bayer: bayer data. Zero is set for non-observed pixel.
% mask: One is set for observed pixel and zero is set for non-observed pixel.
%
%
%Input parameter:
% data: rgb full color image
% pattern: bayer pattern 'rggb', 'bggr', 'grbg', or 'gbrg'
%
%Example:
% rgb = imread('img.png');
% [bayer, mask] = bayermask( rgb, 'rggb' );
%
%
%Version: 20120616

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Miscellaneous tools for image processing                 %
%                                                          %
% Copyright (C) 2012 Masayuki Tanaka. All rights reserved. %
%                    mtanaka@ctrl.titech.ac.jp             %
%                                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [bayer mask] = bayermask(data,pattern)

if( size(data,3) == 1 )
 data = repmat(data,[1,1,3]);
end

num = rgb123(pattern);

bayer = zeros(size(data));
mask = zeros(size(data));

rows1 = 1:2:size(data,1);
rows2 = 2:2:size(data,1);
cols1 = 1:2:size(data,2);
cols2 = 2:2:size(data,2);

mask(rows1,cols1,num(1)) = 1;
mask(rows1,cols2,num(2)) = 1;
mask(rows2,cols1,num(3)) = 1;
mask(rows2,cols2,num(4)) = 1;

bayer = data .* mask;
