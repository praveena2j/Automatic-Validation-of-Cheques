% imreadind reads image file from file
% even if the image file is index color, imreadind can read image data as well as rgb image data
%
% img = imreadint(filename, options) 
%
%
%Output parameter:
% img: image data whose range is 0 to 255 with double type
%
%Input parameters:
% filename: filename
% optons: options which are same to imread
%
%Example
% img = imreadind('img.png');
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
function img = imreadind(filename, varargin)

[ind map] = imread(filename, varargin{:} );
if( isempty(map) )
 img = double(ind);
else
 img = ind2rgb(ind,map) * 255;
end

