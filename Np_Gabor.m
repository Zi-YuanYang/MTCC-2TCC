%%
%  基于神经生理学的gabor滤波器
%%
function [Gb] = Np_Gabor(s,n)

% s = 8;  %滤波器的大小为(2*s+1)^2
% fOmega = 0.5;
% fKappa = 2;
fOmega = 0.35;
fKappa = 2.78;
d = pi/n; %角度间隔

Gb = zeros(2*s + 1,2*s + 1,n);
for fTheta = 0:d:(n-1)*d
    G = zeros(2*s + 1,2*s + 1);
    for x = -s:s
        for y = -s:s
            x1 = x*cos(fTheta) + y*sin(fTheta);
            y1 = y*cos(fTheta) - x*sin(fTheta);
            %G(x+s+1,y+s+1) = fOmega/(sqrt(2*pi)*fKappa)*exp(-fOmega*fOmega*(4*x1*x1+y1*y1)/(8*fKappa*fKappa))*(exp(sqrt(-1)*fOmega*x1)-exp(-fKappa*fKappa/2));
            G(x+s+1,y+s+1) = fOmega/(sqrt(2*pi)*fKappa)*exp(-fOmega*fOmega*(4*x1*x1+y1*y1)/(8*fKappa*fKappa))*(cos(fOmega*x1)-exp(-fKappa*fKappa/2));
        end
    end
    G = G -mean(mean(G)); 
    Gb(:,:,round(fTheta/d)+1) = G(:,:);
end

%%
% figure,
% subplot(231),imshow(Gb(:,:,1),[]);
% subplot(232),imshow(Gb(:,:,2),[]);
% subplot(233),imshow(Gb(:,:,3),[]);
% subplot(234),imshow(Gb(:,:,4),[]);
% subplot(235),imshow(Gb(:,:,5),[]);
% subplot(236),imshow(Gb(:,:,6),[]);
