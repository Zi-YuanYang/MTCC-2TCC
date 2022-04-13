%%
%
%    画ROC曲线,并返回曲线与两坐标轴所围的面积
%
%%
function  [eer, FAR, GAR] = calculate_eer( DisIntra ,DisInter )

num_DisIntra = length(DisIntra); %获取类内海明距离的个数
num_DisInter = length(DisInter);  %获取类间海明距离的个数

%% 计算EER
FRR = [];
GAR = [];
FAR = [];

for threshold = 0:0.01:1
    frr = sum(DisIntra > threshold)/num_DisIntra;   %类内大于预设阈值的，错误的拒绝了
    FRR = [FRR frr];
    gar = sum(DisIntra <= threshold)/num_DisIntra;   %类内小于预设阈值的，正确接受
    GAR = [GAR gar];
    far = sum(DisInter <= threshold)/num_DisInter;   %类间小于阈值的，就错误的接受了
    FAR = [FAR far];
end

[~, EERindex]=min(abs(FAR-FRR));
eer = (FAR(EERindex)+FRR(EERindex))/2;

end
