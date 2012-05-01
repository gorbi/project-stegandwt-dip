%Create a function 'rm_watermark' which takes the input of path and filename of
%watermarked image 'fn_msg' and performs the required removal of watermark
%and outputs the obtained message from watermark 'op'

function op = rm_watermark(fn_watermarked)

%Read the watermarked image indicated by path and filename 'fn_watermarked'
%into matrix 'u'
u=imread(fn_watermarked);
%Initialize the variables Mm and Nm to the size of the embedded image
Mm=256;
Nm=256;

%Apply 2-D haar bsed DWT on the watermarked image and obtain the band co-efficients 
%cA1,cH1,cV1,cD1
[cA1,cH1,cV1,cD1] = dwt2(u,'haar');

%Excluding cA co-efficient band,concatenate the other 3 co-efficient bands to form a
%matrix 't'
t=[cH1 cV1 cD1];
%Convert the elements in matrix 't' to integers and restrict the size of
%its elements to 32 bits
t=int32(t);
%Double the precision of the elements in the matrix 't'
t=double(t);
%Obtain the size of matrix t into variables Mt and Nt
[Mt Nt]=size(t);

%Take the pointer 'index' to null(not-yet obtained) message image and
%initialize it to 1st pixel value
index=1;
%Take the pointer 'i' and initialize it to 1st element in 't' matrix
i=1;
%Set the bit position to 2 inorder to start extraction of message pixels
%from the 2nd LSB from the watermarked image
b_pos=2;

%Start extracting procedure and continue till all message pixels are
%extracted
while(index<=(Mm*Nm))
    %If co-efficient pointed by 'i' is eligible, then get the pixel value of message and
    %increment message image pointer
    if(t(i) >= 0)
        o_temp(index)=bitget(t(i),b_pos);
        index=index+1;
    end
    
    %Increment 'i' as co-efficient is unable to be used for extraction as
    %messsage is not embedded in it
    i=i+1;
    
    %If the end of 't' is reached, reset 'i' to 1st element and increment
    %bit position by 1 to start getting message from next higher bit
    if(i>(Mt*Nt))
        i=1;
        b_pos=b_pos+1;
    end

end

%Take the pointer 'in' and initialize it to 1
in=1;

%Extracted bits from watermarked image are present in the 1-D array, so
%convert the array into a 2-D matrix 'op' of message image size 
for n=1:Nm
    for m=1:Mm
        op(m,n)=o_temp(in);
        in=in+1;
    end
end
%Return this obtained message as output of this function
end
