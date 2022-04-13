function [mD] = im_Ham_MTCC(PC1,PC2)

D = zeros(5,5);
H = zeros(1,6);
for i = -2:2
    for j = -2:2
        h = 32 - abs(i);  % 待匹配图片的行数 
        w = 32 - abs(j);  % 待匹配图片的列数
        siz = h * w;      % 计算重合的像素点个数
        for k = 1:6
            PC1_R = PC1{1,k}(1+(abs(i)+i)/2:32-(abs(i)-i)/2,1+(abs(j)+j)/2:32-(abs(j)-j)/2); % 图像PC1的匹配范围
            PC2_R = PC2{1,k}(1+(abs(i)-i)/2:32-(abs(i)+i)/2,1+(abs(j)-j)/2:32-(abs(j)+j)/2); % 图像PC2的匹配范围
            R=bitxor(PC1_R,PC2_R);       % 异或操作
            H(1,k) = length(find(R>0));  % 计算PC1和PC2的海明距离
        end
        D(i+3,j+3) = sum(H)/(6*siz);     % 计算归一化海明距离
    end
end
mD=min(min(D));   % 求归一化海明距离的最小值
end

