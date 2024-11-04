
funcprot(0); 
clc; 
clf; 
clear; 

m=940; 
k=100;
hbar=197.3; 

r0=1D-8; 
rn=40; 
n=500; 
r=linspace(r0,rn,n); 
D=r(2)-r(1);
b1=0;b2=10;b3=30; 
V1=(k.*r.*r./2) + (b1.*r.*r.*r./3);
V2=(k.*r.*r./2) + (b2.*r.*r.*r./3); 
V3=(k.*r.*r./2) + (b3.*r.*r.*r./3); 
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

for i=1:n-3 
    A2(i,i)=(2+C*V2(i+1))
    A2(i,i+1)=-1
    A2(i+1,i)=-1
end
A2(n-2,n-2)=(2+C*V2(n-1)); 
A2=A2./C; 
[EV2,E2]=spec(A2); 
 
Energy2=diag(E2);
mprintf("\n E(%d)=%2.5f ev",1,Energy2(1)); 

for i=1:n-3 
    A3(i,i)=(2+C*V3(i+1))
    A3(i,i+1)=-1
    A3(i+1,i)=-1
end
A3(n-2,n-2)=(2+C*V3(n-1)); 
A3=A3./C; 
[EV3,E3]=spec(A3); 
 
Energy3=diag(E3);
mprintf("\n E(%d)=%2.5f ev",1,Energy3(1)); 



np=50;
zm=zeros(1,np);
psi10=[0;EV1(:,1);0];
psi20=[0;EV2(:,1);0];
psi30=[0;EV3(:,1);0];
plot(r(1:np),psi10(1:np),'r-*',r(1:np),-psi20(1:np),'-+',r(1:np),-psi30(1:np),'-<>',r(1:np),zm(1:np),'black--');

a=gca();
a.thickness=2;
a.box="on";
a.children.children.thickness=1;
title("Energy Eigenfunctions","fontsize",4,"fontname",2);
xlabel("r in FemtoMeter","fontsize",3,"fontname",3);
ylabel("Wave Function","fontsize",3,"fontname",3);
legend(["Ground State( "+string(Energy1(1))+"ev) for b= "+string(b1)+"MeV/fm^3","Ground State( "+string(Energy2(1))+"ev) for b= "+string(b2)+"MeV/fm^3","Ground State( "+string(Energy3(1))+"ev) for b= "+string(b3)+"MeV/fm^3"],[1]);



    
