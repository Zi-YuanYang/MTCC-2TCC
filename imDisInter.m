function DisInter = imDisInter(clsnum,smpnum,code)
%
%  clsnum : �����  smpnum��ÿ��������  code����������
%
tic;
%���ƥ�����
p=1; %�洢�������ָ��
for i=1:clsnum-1
    for j=1:smpnum
        for ii=i+1:clsnum
            for jj=1:smpnum
                img_1=code{(i-1)*smpnum+j};   %���� PalmCodeͼƬimg_1
                img_2=code{(ii-1)*smpnum+jj}; %���� PalmCodeͼƬimg_2
                DisInter(p) = im_Ham_MTCC(img_1,img_2);
                p=p+1;
            end
        end
    end
end      
toc;