% Function to get face template using 2D Gabor Filter

function msg_img_gabored=gabor_2d(fn_msg)

la=2;
t=0;
ps=0;
g=0.5;
b=2;
% N specifies the number of times the image is passed through Gabor Filter in steps of 2*pi/N
N=8;

msg_img=imread(fn_msg);

%Double Precision
msg_img=im2double(msg_img);

msg_img_gabored=zeros(size(msg_img,1),size(msg_img,2),N);

for n=1:N
    gb=gabor_fn(b,g,ps,la,t);
    msg_img_gabored(:,:,n)=imfilter(msg_img,gb,'symmetric');
    t=t+2*pi/N;
end

% Removing imaginary terms
msg_img_gabored=abs(msg_img_gabored).^2;

msg_img_gabored=sum(msg_img_gabored,3).^0.5;

%Normalising
m=max(msg_img_gabored(:));
msg_img_gabored=msg_img_gabored./m;

%Converting image data into unint8 data
msg_img_gabored=msg_img_gabored.*255;
msg_img_gabored=uint8(msg_img_gabored);

lvl=graythresh(msg_img_gabored);
msg_img_gabored=im2bw(msg_img_gabored,lvl);

end
