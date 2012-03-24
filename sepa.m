function [a,b,c,x,y,z] = sepa(o)


a=o(1:(size(o,1)/5),1:(size(o,2)/3));

b=o(1+(size(o,1)/5):2*(size(o,1)/5),1:(size(o,2)/3));

c=o(1+(4*(size(o,1)/5)):size(o,1),1:(size(o,2)/3));

x=o(1:(2*(size(o,1)/5)),1+(size(o,2)/3):size(o,2));

y=o(1+(2*(size(o,1)/5)):(4*(size(o,1)/5)),1+(size(o,2)/3):size(o,2));


t1=o(1+(4*(size(o,1)/5)):size(o,1),1+(size(o,2)/3):size(o,2));


t2=o(1+(2*(size(o,1)/5)):(3*(size(o,1)/5)),1:(size(o,2)/3));


t3=o(1+(3*(size(o,1)/5)):(4*(size(o,1)/5)),1:(size(o,2)/3));


t=[t2 t3];

z=[t1;t];

end