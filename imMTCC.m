function [T1, T2] = imMTCC(I, Gb)

T1 = cell(1,6);
T2 = cell(1,6);
for i = 1:6
    I1 = conv2(double(I),double(Gb(:,:,i)),'same'); %对预处理后的图像进行6个方向的滤波处理（卷积）
    I2 = conv2(I1,double(Gb(:,:,i)),'same'); 
    
    I1 = I1 > 0;  % 二值化
    DIM1 = I1(1:4:end,1:4:end); %对卷积后的图像下采样（32*32）
    T1{1,i} = double(DIM1); %将各个方向的采样图片分别存放在cell中
    
    I2 = I2 > 0;
    DIM2 = I2(1:4:end,1:4:end);
    T2{1,i} = double(DIM2); 
end