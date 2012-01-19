% Function to get face template using 2D Gabor Filter

function o=gabor_2d()

la=6;
t=0;
ps=0;
g=0.5;
b=1;
% N specifies the number of times the image is passed throught Gabor Filter
% in steps of 2*pi/N
N=8;

f_name=input('Enter the message image name along with its path:','s');

i=imread(f_name);

%Double Precision
i=im2double(i);

o=zeros(size(i,1),size(i,2),N);

for n=1:N
    gb=gabor_fn(b,g,ps,la,t);
    o(:,:,n)=imfilter(i,gb,'symmetric');
    t=t+2*pi/N;
end

% Removing imaginary terms
o=abs(o).^2;

o=sum(o,3).^0.5;

%Normalising
m=max(o(:));
o=o./m;

%Inversion
o=ones(size(o,1), size(o,2))-o;

end
