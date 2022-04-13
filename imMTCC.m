function [T1, T2] = imMTCC(I, Gb)

T1 = cell(1,6);
T2 = cell(1,6);
for i = 1:6
    I1 = conv2(double(I),double(Gb(:,:,i)),'same'); %��Ԥ������ͼ�����6��������˲����������
    I2 = conv2(I1,double(Gb(:,:,i)),'same'); 
    
    I1 = I1 > 0;  % ��ֵ��
    DIM1 = I1(1:4:end,1:4:end); %�Ծ�����ͼ���²�����32*32��
    T1{1,i} = double(DIM1); %����������Ĳ���ͼƬ�ֱ�����cell��
    
    I2 = I2 > 0;
    DIM2 = I2(1:4:end,1:4:end);
    T2{1,i} = double(DIM2); 
end