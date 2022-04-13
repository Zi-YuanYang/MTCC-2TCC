%%
%
%    ��ROC����,����������������������Χ�����
%
%%
function  [eer, FAR, GAR] = calculate_eer( DisIntra ,DisInter )

num_DisIntra = length(DisIntra); %��ȡ���ں�������ĸ���
num_DisInter = length(DisInter);  %��ȡ��亣������ĸ���

%% ����EER
FRR = [];
GAR = [];
FAR = [];

for threshold = 0:0.01:1
    frr = sum(DisIntra > threshold)/num_DisIntra;   %���ڴ���Ԥ����ֵ�ģ�����ľܾ���
    FRR = [FRR frr];
    gar = sum(DisIntra <= threshold)/num_DisIntra;   %����С��Ԥ����ֵ�ģ���ȷ����
    GAR = [GAR gar];
    far = sum(DisInter <= threshold)/num_DisInter;   %���С����ֵ�ģ��ʹ���Ľ�����
    FAR = [FAR far];
end

[~, EERindex]=min(abs(FAR-FRR));
eer = (FAR(EERindex)+FRR(EERindex))/2;

end
