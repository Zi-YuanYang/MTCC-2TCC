function [mD] = im_Ham_MTCC(PC1,PC2)

D = zeros(5,5);
H = zeros(1,6);
for i = -2:2
    for j = -2:2
        h = 32 - abs(i);  % ��ƥ��ͼƬ������ 
        w = 32 - abs(j);  % ��ƥ��ͼƬ������
        siz = h * w;      % �����غϵ����ص����
        for k = 1:6
            PC1_R = PC1{1,k}(1+(abs(i)+i)/2:32-(abs(i)-i)/2,1+(abs(j)+j)/2:32-(abs(j)-j)/2); % ͼ��PC1��ƥ�䷶Χ
            PC2_R = PC2{1,k}(1+(abs(i)-i)/2:32-(abs(i)+i)/2,1+(abs(j)-j)/2:32-(abs(j)+j)/2); % ͼ��PC2��ƥ�䷶Χ
            R=bitxor(PC1_R,PC2_R);       % ������
            H(1,k) = length(find(R>0));  % ����PC1��PC2�ĺ�������
        end
        D(i+3,j+3) = sum(H)/(6*siz);     % �����һ����������
    end
end
mD=min(min(D));   % ���һ�������������Сֵ
end

