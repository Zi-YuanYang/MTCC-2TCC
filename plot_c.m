%%
%
%    ��ROC����
%
%%
function  plot_c(FAR, GAR)

figure;
semilogx(FAR, GAR, '-p');
axis([1e-05 1 0.98 1]);

xlabel('FAR(%)');  % ���������
ylabel('GAR(%)');  % ��ȷ������
title('ROC����ͼ');
grid on;
end
