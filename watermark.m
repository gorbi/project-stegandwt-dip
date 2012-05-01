%Create a function 'watermarked' that takes inputs of path and filenames of
%cover image 'fn_cover' and message image'fn_msg' and performs the required
%watermarking

function watermarked = watermark(fn_cover,fn_msg)

%Read the cover image indicated by path and filename 'fn_cover' into
%matrix 'a'
a=imread(fn_cover);

%Read the message image indicated by the path and filename 'fn_msg' into
%matrix 'b'
b=gabor_2d(fn_msg);
%Resize the image so that its size is 256 x 256
b=imresize(b,[256 256]);
%Get the size of resized message image into the variables Mm and Nm
[Mm Nm]=size(b);

%Apply 2-D haar based DWT on the cover image and obtain the band co-efficients 
%cA1,cH1,cV1,cD1
[cA1,cH1,cV1,cD1] = dwt2(a,'haar');
%Convert the obtained co-efficients of the cover image to integers and
%restrict their length to 32 bits
cA1=int32(cA1);
cH1=int32(cH1);
cV1=int32(cV1);
cD1=int32(cD1);

%Excluding cA band, concatenate the other 3 co-efficient bands to form a
%matrix 't'
t=[cH1 cV1 cD1];
%Double the precision of the elements in the matrix 't'
t=double(t);
%Obtain the size of matrix t into variables Mt and Nt
[Mt Nt]=size(t);

%Take the pointer 'index' to message image and initialize it to 1st pixel
%value
index=1;
%Take the pointer 'i' and initialize it to 1st element in 't' matrix
i=1;
%Set the bit position to 2 inorder to replace the 2nd LSB of eligible
%co-efficient in the 't' matrix with message image pixel value
b_pos=2;

%Start embedding procedure and continue till all message pixels are
%embedded
while(index<=(Mm*Nm))
    %If co-efficient pointed by 'i' is eligible, then set the pixel value of message and
    %increment message image pointer
    if(t(i) >= 0)
        t(i)=bitset(t(i),b_pos,b(index));
        index=index+1;
    end
    
    %Increment 'i' as co-efficient is unable to be used for embedding
    i=i+1;
    
    %If the end of 't' is reached, reset 'i' to 1st element and increment
    %bit position by 1 to start appending message to next higher bit
    if(i>(Mt*Nt))
        i=1;
        b_pos=b_pos+1;
    end

end

%Separate matrix 't' to get modified bands as H1,V1,D1
H1=t(:,1:(size(t,2)/3));
V1=t(:,1+(size(t,2)/3):(2*(size(t,2)/3)));
D1=t(:,1+(2*(size(t,2)/3)):size(t,2));

%Apply inverse 2-D haar based DWT to unmodified cA1 band,H1,V1,D1 to obtain the 
%watermarked image
watermarked=idwt2(cA1,H1,V1,D1,'haar');
%Convert the pixel values in the watermarked image to unsigned 8-bit integer
watermarked=uint8(watermarked);

end