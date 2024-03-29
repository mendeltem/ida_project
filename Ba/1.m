close all
clear all
fontsize=16; % Do not change this parameter


sigm=10;
rho=28;
beta=8/3;
dt=0.01; %time step in computational model
a=4; %parameter for tent map
fakt=1.99999; % Do not change this parameter

N=2*10^4; % changed for the smaller time steps
%Sequence of real numbers defined by map iteration
g1=a*(1/sqrt(2)-0.5);% η 1  initial
g2=a*(1/sqrt(3)-0.5);% η 2  initial
g3=a*(1/sqrt(5)-0.5);% η 3  initial

r1 = g1;
r2 = g2;
r3 = g3;

%initial condition
x = -0.587
y = -0.563
z = 16.870

%index for the t_out
d =1
%reserve the matrix
matrix = zeros(3,4001)


res=zeros(N,7);
for i=1:(N) 
   % here information for every timestep 
   res(i,:6)=[i-1 x y z g1 g2 g3]; 
   %check if − a/2 ≤ η 1 < 0
   if (g1 >= -a/2) & (g1 < 0)
     g1=a*(fakt*g1/a+0.5);
   else
     g1= a*(-fakt*g1/a+0.5);
   end  
   %check if  − a/2 ≤ η 2 < 0
   if (g2 >= -a/2) & (g2 < 0)
     g2=a*(fakt*g2/a+0.5);
   else
     g2=a*(-fakt*g2/a+0.5);
   end
   %check if  − a/2 ≤ η 3 < 0 
   if (g3 >= -a/2) & (g3 < 0)
     g3=a*(fakt*g3/a+0.5);
   else
     g3=a*(-fakt*g3/a+0.5);
   end
   xn= x + dt*((sigm*(y-x))+g1);
   yn= y + dt*((x*(rho-z)-y)+g2);
   zn= z + dt*((x*y-beta*z)+g3);

   x = xn; y = yn; z=zn;
   %saving every 0.05 second the x,y,z values in the matrix for the
   %obeservation
   if mod(i,5) == 0
       matrix(:,d)  = [x y z];
       d = 1 + d 
   end
end

res(:,1)=res(:,1)*dt;
%figure
set(gca,'FontSize',fontsize)
%ploting the observation
comet(matrix(1,1:4000),matrix(2,1:4000));
%changed the view 
view(0,90)



