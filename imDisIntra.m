function DisIntra = imDisIntra(clsnum,smpnum,code)
%
%  clsnum : 类别数  smpnum：每类样本数  code：特征编码
%
tic;
% 类内匹配过程
p=1; %存储类内间距离的指针
for i=1:clsnum
    for j=1:smpnum-1
        for k=j+1:smpnum
            img_1=code{(i-1)*smpnum+j}; %读入 PalmCode图片img_1
            img_2=code{(i-1)*smpnum+k}; %读入 PalmCode图片img_2
            DisIntra(p) = im_Ham_MTCC(img_1,img_2);
            p=p+1;
        end
    end
end
toc;