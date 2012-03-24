function watermark()

%Input image
f_name=input('Enter the cover image name along with its path:','s');
i1=imread(f_name);

%Obtaining the message image
i2=gabor_2d();
[Mm Nm]=size(i2);

%Obtaining 1-level DWT co-efficients
[cA1,cH1,cV1,cD1] = dwt2(i1,'haar');

%Obtaining 2-level DWT co-efficients
[cA2,cH2,cV2,cD2] = dwt2(cA1,'haar');

%Using LSB based watermarking to hide msg image in second LSB of co-eff
t=conca(cH2,cV2,cD2,cH1,cV1,cD1);
t=int32(t);
t=double(t);
[Mt Nt]=size(t);

index=1;
pos=1;
bit_pos=2;

while(index<=(Mm*Nm))

    if(t(i)>15)
        t(i)=bitset(t(i),b_pos,m(index));
        index=index+1;
    end
    
    i=i+1;
    
    if(i>(Mt*Nt))
        i=1;
        b_pos=b_pos+1;
    end

end
t=int32(t);
[H2,V2,D2,H1,V1,D1]=sepa(t);


%Obtaing back image by using DWT co-efficients
A1=idwt2(cA2,H2,V2,D2,'haar');
watermarked=idwt2(A1,H1,V1,D1,'haar');

%Converting back to uint8 from double class
watermarked=uint8(watermarked);

imwrite(watermarked,'watermarked.bmp','bmp');

end


