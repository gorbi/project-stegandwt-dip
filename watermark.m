function watermark()

%Gain
k=10;

%Input image
f_name=input('Enter the cover image name along with its path:','s');

i1=imread(f_name);


%i1=im2double(i1);
[Mc Nc]=size(i1);


%Obtaining the message image
i2=gabor_2d();
[Mm Nm]=size(i2);


%Calculating the threshold
%th=0;
%for i=1:Mm
%    for j=1:Nm
%        th=th+i2(i,j);
%    end
%end
%th=th/(Mm*Nm);

%Converting image to binary image
%for i=1:Mm
%    for j=1:Nm
%        if(i2(i,j)>th)
%            i2(i,j)=1;
%        else
%            i2(i,j)=0;
%        end
%    end
%end

%Dividing the image into 4 image matrices of size Mm/2 X Nm/2
%Images are P1 P2 P3 P4
P1=i2(1:1:round(Mm./2),1:1:round(Nm./2));
P2=i2(1:1:round(Mm./2),round(Nm./2)+1:1:Nm);
P3=i2(round(Mm./2)+1:1:Mm,1:1:round(Nm./2));
P4=i2(round(Mm./2)+1:1:Mm,round(Nm./2)+1:1:Nm);

%Obtaining DWT co-efficients
[cA1,cH1,cV1,cD1] = dwt2(i1,'haar');


%Adding message image into co-efficients with gain
cA1=cA1+k.*P1;
cH1=cH1+k.*P2;
cV1=cV1+k.*P3;
cD1=cD1+k.*P4;


%Obtaing back image by using DWT co-efficients
watermarked=idwt2(cA1,cH1,cV1,cD1,'haar',[Mc,Nc]);

%Converting back to uint8 from double class
watermarked=uint8(watermarked);

imwrite(watermarked,'watermarked.bmp','bmp');

end


