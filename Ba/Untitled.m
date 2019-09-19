close all
clear all
%%%%%%%%%%%%%%%%%%%%%%% EX1 a %%%%%%%%%%%%%%%%%%%%%%%
% Define the Function phi
myfun1 = @(x) 16 .*x;  % calcul of phi ( phi (x) ) 4 times case of 0 <= x <= 1/2
myfun2 = @(x) -10 + 16 .*x; % calcul of phi ( phi (x) ) 4 times case of 1/2 < x <= 1
% Set initial values
n=4;
dx=0.005;
a=0;
b=1;
N=b/dx;
phi=zeros(1,N);
gn=zeros(1,N);
% Array between [0,1]
t=linspace(a,b,N);
% Calculating the function phi at the current point
for i=1:N
if (t(i)>= 0 && t(i) <= 0.5)
   phi(i)=myfun1(t(i));
else
   phi(i)=myfun2(t(i));
end
end

% Ploting
figure
plot(t,phi)
xlabel('x')
ylabel('y = gn(x)')
title('Function gn on the unit interval [0, 1] for n = 4 with N=200')

%%%%%%%%%%%%%%%%%%%%%%% EX1 b %%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%% EX1 c %%%%%%%%%%%%%%%%%%%%%%%

%Nsample=125;
%Nsample=1000;
Nsample=8000;
r= rand(Nsample,1);
rf=zeros(Nsample,1);
for i=1:Nsample
if (r(i)>= 0 && r(i) <= 0.5)
   rf(i)=myfun1(r(i));
else
   rf(i)=myfun2(r(i));
end
end
meanr=mean(rf);
err= std(rf)/ sqrt(Nsample);

fprintf('Monte Carlo esimate (nsample=%d) %f +/- %f ', Nsample , meanr , err );
