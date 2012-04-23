function watermarked = watermark(fn_cover,fn_msg)

a=imread(fn_cover);

b=gabor_2d(fn_msg);
b=imresize(b,[256 256]);
[Mm Nm]=size(b);

[cA1,cH1,cV1,cD1] = dwt2(a,'haar');
cA1=int32(cA1);
cH1=int32(cH1);
cV1=int32(cV1);
cD1=int32(cD1);

t=[cH1 cV1 cD1];
t=double(t);
[Mt Nt]=size(t);

index=1;
i=1;
b_pos=2;

while(index<=(Mm*Nm))

    if(t(i) >= 0)
        t(i)=bitset(t(i),b_pos,b(index));
        index=index+1;
    end
    
    i=i+1;
    
    if(i>(Mt*Nt))
        i=1;
        b_pos=b_pos+1;
    end

end

H1=t(:,1:(size(t,2)/3));
V1=t(:,1+(size(t,2)/3):(2*(size(t,2)/3)));
D1=t(:,1+(2*(size(t,2)/3)):size(t,2));

watermarked=idwt2(cA1,H1,V1,D1,'haar');

watermarked=uint8(watermarked);

end