%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Miscellaneous tools for image processing                 %
%                                                          %
% Copyright (C) 2012 Masayuki Tanaka. All rights reserved. %
%                    mtanaka@ctrl.titech.ac.jp             %
%                                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

bayermask 
 provides sampled bayer CFA data and bayer mask

bayersampling 
 samples pixel value associated bayer color filter array

eachchannel 
 allows us to apply function for each channel

imgrad 
 calculates horizontal and vertical gradients

impsnr 
 evaluates the psnr and the rmse beween images

imreadind 
 reads image file from file even if the image file is index color, imreadind can read image data as well as rgb image data

patchdctfilter
 applys dct filter for each columned image patches

patch2img 
 compose image from columned image patches by averaging (almost same to col2im)

patchtiling
 tiles columned image patches as a image

rgb2ycc 
 transfers color space from rgb to ycc

rgb123 
 translate r, g, and b to 1, 2, and 3, respectively.

ycc2rgb 
 transfers color space from ycc to rgb

