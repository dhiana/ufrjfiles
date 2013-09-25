%
% Trabalho 2 de ITM
% Exercício 7
% Dhiana Deva
% 2013/2
%

r = [5705, 4563, 3675, 2981, 2434, 2000, 1653, 1375, 1149, 965.0, 814.7, 690.5, 587.5, 501.7, 429.8, 369.5, 318.6, 275.5, 238.9, 207.6, 108.9]
t = [0:5:100]
B = 3528
Rtmeio = 2000
Tmeio = 25
Rtbaixo = 108.9
Rtalto = 5705

% Sem linearizacao
figure
p = polyfit(t, r, 1)
d = polyval(p, t)
plot(t, r, 'x', t, d)
% Sensibilidade: Inclinacao da curva de calibracao.
s = p(1)
% Linearidade (%): Percentual de nao linearidade relativa.
span = max(d) - min(d)
maxerr = max(abs(r - d))
l = maxerr/span*100
title('Reta de Calibracao sem Linearizacao')
xlabel('Temperatura')
ylabel('Resistencia')
print -dpng fig1.png -S800,600

% Linearizacao 1
figure
Rp1 = Rtmeio * (B - 2*Tmeio) / (B + 2 * Tmeio)
r1 = r * Rp1 ./ (r + Rp1)
p1 = polyfit(t, r1, 1)
d1 = polyval(p1, t)
plot(t, r1, 'x', t, d1)
% Sensibilidade: Inclinacao da curva de calibracao.
s1 = p1(1)
% Linearidade (%): Percentual de nao linearidade relativa.
span1 = max(d1) - min(d1)
maxerr1 = max(abs(r1 - d1))
l1 = maxerr1/span1*100
title('Reta de Calibracao da Linearizacao 1')
xlabel('Temperatura')
ylabel('Resistencia')
print -dpng fig2.png -S800,600

% Linearizacao 2
figure
Rp2 = (Rtmeio * (Rtbaixo + Rtalto) - 2 * Rtbaixo * Rtalto) / (Rtbaixo + Rtalto - 2 * Rtmeio)
r2 = r * Rp2 ./ (r + Rp2)
p2 = polyfit(t, r2, 1)
d2 = polyval(p2, t)
plot(t, r2, 'x', t, d2)
% Sensibilidade: Inclinacao da curva de calibracao.
s2 = p2(1)
% Linearidade (%): Percentual de nao linearidade relativa.
span2 = max(d2) - min(d2)
maxerr2 = max(abs(r2 - d2))
l2 = maxerr2/span2*100
title('Reta de Calibracao da Linearizacao 1')
xlabel('Temperatura')
ylabel('Resistencia')
print -dpng fig3.png -S800,600

% Comparativo 
figure
plot(t, r, t, r1, 'x', t, r2, 'o')
title('Curva do Termistor')
xlabel('Temperatura')
ylabel('Resistencia')
print -dpng fig4.png -S800,600

pause
