
funcprot(0); 
clc; 
clf; 
clear; 

m=940D6; 
D=0.755501;
alpha=1.44;
hbar=1973; 
rz=0.131349;

r0=1D-8; 
rn=40; 
n=500; 
r=linspace(r0,rn,n); 
D=r(2)-r(1);

V1=D*(exp(-2*alpha.*(r-rz))-exp(-alpha.*(r-rz)))
C=2*m*D*D/(hbar*hbar); 

for i=1:n-3 
    A1(i,i)=(2+C*V1(i+1))
    A1(i,i+1)=-1
    A1(i+1,i)=-1
end
A1(n-2,n-2)=(2+C*V1(n-1)); 
A1=A1./C; 
[EV1,E1]=spec(A1); 
 
Energy1=diag(E1); 
mprintf("\n E(%d)=%2.5f ev",1,Energy1(1)); 


np=100;
zm=zeros(1,np);
psi10=[0;EV1(:,1);0];
plot(r(1:np),-psi10(1:np),'r-*',r(1:np),zm(1:np),'black--');

a=gca();
a.thickness=2;
a.box="on";
a.children.children.thickness=1;
title("Energy Eigenfunctions","fontsize",4,"fontname",2);
xlabel("r in Angstrom","fontsize",3,"fontname",3);
ylabel("Wave Function","fontsize",3,"fontname",3);
legend(["Ground State( "+string(Energy1(1))+"ev)"],[1]);



    
