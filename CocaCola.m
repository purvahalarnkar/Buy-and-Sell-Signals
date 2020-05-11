clc
clear all
close all

data1=csvread('coca-cola.csv',1,1); %Import Coca-Cola data 
x1=data1(:,4); %select closing prices from the data

N1=25 %Order of SMA filter 1
a1=[1];
b1=ones(1,N1)/N1; %Numerator coefficients
y1=filter(b1,a1,x1); %Denominator Coefficients

N2=150 %Order of SMA filter 2
a2=[1]; %Numerator coefficients
b2=ones(1,N2)/N2; %Denominator coefficients
y2=filter(b2,a2,x1);

t=1:length(x1);
plot(t,y1,'-')
hold on
plot(t,y2,'--')
hold on
plot(x1)
grid on
axis([150 1100 35 50])

title('Coca-Cola:Crude "Buy" and "Sell" signals');
legend('SMA filter 1','SMA filter 2','Original Data')