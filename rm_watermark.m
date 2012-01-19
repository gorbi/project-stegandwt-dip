function rm_watermark()

%Getting watermarked image
u=imread('watermarked.bmp');

%Input cover image again
f_name=input('Enter the cover image name along with its path:','s');
v=imread(f_name);

%Obtaining DWT co-efficients of cover image
[cA,cH,cV,cD]=dwt2(v,'haar');

%Obtaining DWT co-efficients of watermarked image
[cA1,cH1,cV1,cD1]=dwt2(u,'haar');

%Obtaining the message image as 4 sub-sized images
z1=cA1-cA;
z2=cH1-cH;
z3=cV1-cV;
z4=cD1-cD;

%Concatenation of these 4 sub-sized image to get original message image
z=[z1 z2; z3 z4];
z=abs(z);

%Normalising
m=max(z(:));
z=z./m;

%Display and write the obtained message image obtained from watermark
figure(1);
title('Obtained message from watemarked image');
imshow(z);

imwrite(z,'msg_from_watermark.bmp','bmp');
end

