function DisIntra = imDisIntra(clsnum,smpnum,code)
%
%  clsnum : �����  smpnum��ÿ��������  code����������
%
tic;
% ����ƥ�����
p=1; %�洢���ڼ�����ָ��
for i=1:clsnum
    for j=1:smpnum-1
        for k=j+1:smpnum
            img_1=code{(i-1)*smpnum+j}; %���� PalmCodeͼƬimg_1
            img_2=code{(i-1)*smpnum+k}; %���� PalmCodeͼƬimg_2
            DisIntra(p) = im_Ham_MTCC(img_1,img_2);
            p=p+1;
        end
    end
end
toc;