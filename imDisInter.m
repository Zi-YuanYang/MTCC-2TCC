function DisInter = imDisInter(clsnum,smpnum,code)
%
%  clsnum : 类别数  smpnum：每类样本数  code：特征编码
%
tic;
%类间匹配过程
p=1; %存储类间距离的指针
for i=1:clsnum-1
    for j=1:smpnum
        for ii=i+1:clsnum
            for jj=1:smpnum
                img_1=code{(i-1)*smpnum+j};   %读入 PalmCode图片img_1
                img_2=code{(ii-1)*smpnum+jj}; %读入 PalmCode图片img_2
                DisInter(p) = im_Ham_MTCC(img_1,img_2);
                p=p+1;
            end
        end
    end
end      
toc;