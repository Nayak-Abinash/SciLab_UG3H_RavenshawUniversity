//Q: Solve the s-wave Schrodinger equation for the ground state and the first excited state of the hydrogen atom under the columb potential.



funcprot(0); //lets you redefine functions without any hassle
clc; //clears console
clf; //clears figure window
clear; //clears any residual variable values from previous-run programs

//we will use 'ev' units to define our parameters. This is done so to avoid rounding off errors by scilab

m=0.511D6; //mass of the electron 
hbar=1973; //planck's constant/2*pi
e=3.795; //charge of the electron

//the Schrodinger equation here is in terms of the radial cordinate 'r', where r:[0,inf]. Ofcourse scilab won't handle these values exactly. So we choose a reasonably small and a reasonable large number for 'r'

r0=1D-8; //the starting r value
rn=40; //the final r value 
n=500; //the number of points in the r's range where we will solve for the wavefunction
r=linspace(r0,rn,n); //divides the r-range into N equispaced points
D=r(2)-r(1); //the distance between two consecutive points
V=-e*e./r; //the Columb potenntial 
C=2*m*D*D/(hbar*hbar); //defining a convenient parameter

//we want to cast the simultaneous linear equations in terms of a matrix equation

for i=1:n-3 //defines the matrix A
    A(i,i)=(2+C*V(i+1))
    A(i,i+1)=-1
    A(i+1,i)=-1
end
A(n-2,n-2)=(2+C*V(n-1)); //defines the matrix A
A=A./C; //divides the matrix by C
[V,E]=spec(A); //solves the eigenvalue problem of A. The V, and the E contains the eigenfunctions and the eigenvalues, respectively. Note that, the V and E are in square-matrix form, where the eigenvectors are given as the columns of V and the eigenvalues are the diagonal entries of E.
 
Energy=diag(E); //picks out the energy eigenvalues
for i=1:2
    mprintf("\n E(%d)=%2.5f ev",i,Energy(i)) //prints the ground state and the first-excited state energy values
end

//now, we want to plot the wavefunctions as function of r

/*
for i=1:2 //starts a loop
    EigenVec=V(:,i) //picks out the ith eigenvector
    psi=[0;EigenVec;0] //we add a zero on the top and bottom of V1 to account for the boundary values. Now this vector has n-components.
    subplot(2,2,i) //breaks the graphic window into 2x2 sub-windows and picks ith one for plotting
    plot2d(r(1:25),psi(1:25),i+1) //plots the eigenvector's components against r which basically means it plots the wavefunction against r.
    a=gca() //gets the current axes
    a.thickness=3 //increases axes thickness 
    a.box="on" //puts a box around the plot
    a.children.children.thickness=3
    title("Wave Function for n="+string(i),"fontsize",3.5,"edgecol",1) //puts a title on your subplots
    xlabel("r in Angstrom","fontsize",3,"fontname",3) //labels the x-axes
    ylabel("Wave Function","fontsize",3,"fontname",3) //labels the y-axes
end //ends the loop
*/
np=100;
zm=zeros(1,np);
psi0=[0;V(:,1);0];
psi1=[0;V(:,2);0];
plot(r(1:np),psi0(1:np),'r-*',r(1:np),psi1(1:np),'-+',r(1:np),zm(1:np),'black--');
//plot2d(r(1:np),psi0(1:np),5);
//plot2d(r(1:np),psi1(1:np),9);
//plot2d(r(1:np),zm(1:np),1);
a=gca();
a.thickness=2;
a.box="on";
a.children.children.thickness=1;
title("Energy Eigenfunctions","fontsize",4,"fontname",2);
xlabel("r in Angstrom","fontsize",3,"fontname",3);
ylabel("Wave Function","fontsize",3,"fontname",3);
legend(["Ground State( "+string(Energy(1))+"ev)","First Excited State( "+string(Energy(2))+"ev)"],[4]);



    


