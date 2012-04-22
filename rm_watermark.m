function op = rm_watermark(fn_watermarked)

u=imread(fn_watermarked);

Mm=128;
Nm=128;

[cA1,cH1,cV1,cD1] = dwt2(u,'haar');

t=[cH1 cV1 cD1];
t=int32(t);
t=double(t);
[Mt Nt]=size(t);

index=1;
i=1;
b_pos=2;

while(index<=(Mm*Nm))

    if(t(i) >= 0)
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

end
