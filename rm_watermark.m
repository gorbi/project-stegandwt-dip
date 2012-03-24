function rm_watermark()

%Getting watermarked image
u=imread('watermarked.bmp');

%Getting size of message image embedded in watermarked image
Mm=input('Height of message image embedded in watermarked image');
Nm=input('Width of message image embedded in watermarked image');

%Obtaining 1-level DWT co-efficients
[cA1,cH1,cV1,cD1] = dwt2(u,'haar');

%Obtaining 2-level DWT co-efficients
[cA2,cH2,cV2,cD2] = dwt2(cA1,'haar');

%Using LSB based watermarking to hide msg image in second LSB of co-eff
t=conca(cH2,cV2,cD2,cH1,cV1,cD1);
[Mt Nt]=size(t);
t=int32(t);
t=double(t);

index=1;
i=1;
b_pos=2;

while(index<=(Mm*Nm))

    if(t(i)>15)
        o_temp(index)=bitget(t(i),b_pos);
        index=index+1;
    end
    
    i=i+1;
    
    if(i>(Mt*Nt))
        i=1;
        b_pos=b_pos+1;
    end

end

in=1;

for n=1:Nm
    for m=1:Mm
        op(m,n)=o_temp(in);
        in=in+1;
    end
end

op=transpose(op);

%Remove noise by filtering
op=wiener2(op,[10 10]);

%Display and write the obtained message image obtained from watermark
figure(1);
imshow(op);
title('Obtained message from watemarked image');

imwrite(op,'msg_from_watermarked.bmp','bmp');
end

