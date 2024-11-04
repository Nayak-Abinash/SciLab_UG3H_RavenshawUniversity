
funcprot(0); 
clc; 
clf; 
clear; 

m=0.511D6; 
hbar=1973; 
e=3.795; 

r0=1D-8; 
rn=40; 
n=500; 
r=linspace(r0,rn,n); 
D=r(2)-r(1);
a1=3;a2=5;a3=7; 
V1=-e*e.*exp(-r/a1)./r; 
V2=-e*e.*exp(-r/a2)./r; 
V3=-e*e.*exp(-r/a3)./r; 
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



np=100;
zm=zeros(1,np);
psi10=[0;EV1(:,1);0];
psi20=[0;EV2(:,1);0];
psi30=[0;EV3(:,1);0];
plot(r(1:np),-psi10(1:np),'r-*',r(1:np),psi20(1:np),'-+',r(1:np),-psi30(1:np),'-<>',r(1:np),zm(1:np),'black--');

a=gca();
a.thickness=2;
a.box="on";
a.children.children.thickness=1;
title("Energy Eigenfunctions","fontsize",4,"fontname",2);
xlabel("r in Angstrom","fontsize",3,"fontname",3);
ylabel("Wave Function","fontsize",3,"fontname",3);
legend(["Ground State( "+string(Energy1(1))+"ev) for a= "+string(a1)+"A","Ground State( "+string(Energy2(1))+"ev) for a= "+string(a2)+"A","Ground State( "+string(Energy3(1))+"ev) for a= "+string(a3)+"A"],[1]);



    
