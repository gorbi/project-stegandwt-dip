function o = conca(a,b,c,x,y,z)

[Mm Nm]=size(z);


t2=[a;b];

t3=[t2 x];



P1=z(1:1:round(Mm./2),1:1:round(Nm./2));
P2=z(1:1:round(Mm./2),round(Nm./2)+1:1:Nm);
P3=z(round(Mm./2)+1:1:Mm,1:1:round(Nm./2));
P4=z(round(Mm./2)+1:1:Mm,round(Nm./2)+1:1:Nm);

t4=[P3;P4];

t5=[t4 y];

t6=[c P1 P2];

o=[t3;t5;t6];





end