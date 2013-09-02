subplot(1,3,1)
real = [0.00, 1.00, 2.00, 3.00, 4.00, 5.00, 6.00, 7.00, 8.00, 9.00, 10.00]
up = [-1.12, 0.21, 1.18, 2.09, 3.33, 4.5, 5.26, 6.59, 7.73, 8.68, 9.80]
down = [-0.69, 0.42, 1.65, 2.48, 3.62, 4.71, 5.87, 6.89, 7.92, 9.10, 10.2]
plot(real, real, real, up, 'x', real, down, 'o')
title('Press�o real vs Press�o indicada')
xlabel('Press�o real')
ylabel('Press�o indicada')
legend('Real', 'Aumentando', 'Diminuindo')

subplot(1,3,2)
middle = (up+down)/2
% -0.90500    0.31500    1.41500    2.28500    3.47500    4.60500    5.56500    6.74000    7.82500    8.89000   10.00000
plot(real, real, real, middle, 'x')
xlabel('Press�o real')
ylabel('Press�o m�dia indicada')
title('M�dia das indica��es de press�o')
legend('Real', 'M�dia indicada')

subplot(1,3,3)
p = polyfit(real, middle, 1)
% 1.08232  -0.84705
d = polyval(p, real)
% -0.84705   0.23527   1.31759   2.39991   3.48223   4.56455   5.64686   6.72918   7.81150   8.89382   9.97614
plot(real, d, real, middle, 'x')
title('Reta de calibra��o')
xlabel('Press�o real')
ylabel('Press�o calibrada')
legend('-0.84705+1.08232x', 'M�dia indicada')

sensibilidade = p(1)-1
% sensibilidade = 0.082318
offset = p(2)
% offset = -0.84705
linearidade = 0
histerese = max(max(abs(up-d),max(abs(down-d))))
% histerese =  0.38686

pause