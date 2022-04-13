%------------------------------------------------------------------------
%normalize image
%the resulting image has know mean and variance
%------------------------------------------------------------------------
function nimg = normalize_image(img)
%     img = imread('test.jpg');
    m0 = 0;
    v0 = 10;
    %img = rgb2gray(img);
    [ht,wt] =   size(img);
    img = double(img);
    %compute mean and variances
    m       =   mean(img(:));
    v       =   var(img(:));
    
    gmidx   =   find(img > m); %greater than mean
    lmidx   =   find(img <=m); %lesser than mean
    
    nimg(gmidx) = m0 + sqrt((v0*(img(gmidx)-m).^2)/v);
    nimg(lmidx) = m0 - sqrt((v0*(img(lmidx)-m).^2)/v);
    nimg        = reshape(nimg,[ht,wt]);
%end function normalize_img