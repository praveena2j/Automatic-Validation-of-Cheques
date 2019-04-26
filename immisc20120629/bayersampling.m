% bayersampling samples pixel value associated bayer color filter array
%
% raw = bayersampling( rgb, pattern )
%
%
%Output parameter:
% raw: raw data of tye bayer CFA
%
%
%Input parameter:
% rgb: rgb full color image
% pattern: bayer pattern 'rggb', 'bggr', 'grbg', or 'gbrg'
%
%Example:
% rgb = imread('img.png');
% raw = bayersampling( rgb, 'rggb' );
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
function raw = bayersampling( rgb, pattern )

num = rgb123(pattern);

raw = zeros(size(rgb,1), size(rgb,2));

rows1 = 1:2:size(rgb,1);
rows2 = 2:2:size(rgb,1);
cols1 = 1:2:size(rgb,2);
cols2 = 2:2:size(rgb,2);

raw(rows1,cols1) = rgb(rows1,cols1, num(1));
raw(rows1,cols2) = rgb(rows1,cols2, num(2));
raw(rows2,cols1) = rgb(rows2,cols1, num(3));
raw(rows2,cols2) = rgb(rows2,cols2, num(4));

