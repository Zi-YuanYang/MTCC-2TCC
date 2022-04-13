%%
%
%    画ROC曲线
%
%%
function  plot_c(FAR, GAR)

figure;
semilogx(FAR, GAR, '-p');
axis([1e-05 1 0.98 1]);

xlabel('FAR(%)');  % 错误接受率
ylabel('GAR(%)');  % 正确接受率
title('ROC曲线图');
grid on;
end
