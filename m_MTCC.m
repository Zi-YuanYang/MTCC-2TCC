clear;
close all;
clc;
M = 378;  % M ��ʾ���������ԣ��������
N = 20;   % N ��ʾÿ����������������
Gb = Np_Gabor(8,6);  % ����6�������gabor�˲���

imgDataPath = 'F:\Code\NEW\PolyU\PolyU_bmp_ind\';

tic
%% ����ģ����ȡ
image_list=dir([imgDataPath '*.bmp']);
for i=1:length(image_list)
    im_name = image_list(i).name;
    im = imread([imgDataPath im_name]);
    im = normalize_image(im); % ͼ���һ��
    im = im(:,:,1);
    if size(im,2) ~= 128
        im = imresize(im,[128 128]);
    end
    [T1{i}, T2{i}]= imMTCC(im, Gb);
end

save Templates Templates
toc

%% ��ƥ�����(�������ں�)
T = 0.5;
% ���ں�������
DisIntra_1 = imDisIntra(M, N, T1);
DisIntra_2 = imDisIntra(M, N, T2);
DisIntra = T *  DisIntra_1 + (1-T) * DisIntra_2;

save DisIntra_1 DisIntra_1;
save DisIntra_2 DisIntra_2;
save DisIntra DisIntra;

% ��亣������
DisInter_1 = imDisInter(M, N, T1);
DisInter_2 = imDisInter(M, N, T2);
DisInter = T *  DisInter_1 + (1-T) * DisInter_2;

save DisInter_1 DisInter_1;
save DisInter_2 DisInter_2;
save DisInter DisInter;

%% ����EER
[eer, FAR, GAR] = calculate_eer(DisIntra, DisInter);
fprintf('EER: %f\n',eer);
save eer eer

%% ROC
plot_c(FAR, GAR);

