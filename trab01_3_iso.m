subplot(1,3,1)
real = [0.00, 1.00, 2.00, 3.00, 4.00, 5.00, 6.00, 7.00, 8.00, 9.00, 10.00]
up = [-1.12, 0.21, 1.18, 2.09, 3.33, 4.5, 5.26, 6.59, 7.73, 8.68, 9.80]
down = [-0.69, 0.42, 1.65, 2.48, 3.62, 4.71, 5.87, 6.89, 7.92, 9.10, 10.2]
plot(real, real, real, up, 'x', real, down, 'o')
title('Pressão real vs Pressão indicada')
xlabel('Pressão real')
ylabel('Pressão indicada')
legend('Real', 'Aumentando', 'Diminuindo')

subplot(1,3,2)
middle = (up+down)/2
% -0.90500    0.31500    1.41500    2.28500    3.47500    4.60500    5.56500    6.74000    7.82500    8.89000   10.00000
plot(real, real, real, middle, 'x')
xlabel('Pressão real')
ylabel('Pressão média indicada')
title('Média das indicações de pressão')
legend('Real', 'Média indicada')

subplot(1,3,3)
p = polyfit(real, middle, 1)
% 1.08232  -0.84705
d = polyval(p, real)
% -0.84705   0.23527   1.31759   2.39991   3.48223   4.56455   5.64686   6.72918   7.81150   8.89382   9.97614
plot(real, real, real, middle, 'x', real, d)
title('Reta de calibração')
xlabel('Pressão real')
ylabel('Pressão calibrada')
legend('Real', 'Média indicada', '-0.84705+1.08232x')

% Sensibilidade:
% Inclinação da curva de calibração.
sensibilidade = p(1)
% sensibilidade = 1.082318

% Offset:
% Deslocamento de zero
offset = p(2)
% offset = -0.84705 

% Linearidade (%):
% Percentual de não linearidade relativa.
span = max(real) - min(real)
max_up_err = max(abs(up - d))
max_down_err = max(abs(down- d))
max_err = max(max_up_err, max_down_err) 
linearidade = max_err/span*100
% linearidade = 3.8686 %

% Histerese:
% Maior diferença entre valores de subida
% e descida para uma mesma entrada.
histerese = max(abs(up-down))/span*100
% histerese =  6.1000

pause
