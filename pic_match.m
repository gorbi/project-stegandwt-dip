function pic_match(mfw)
%PIC_MATCH Summary of this function goes here
%   Detailed explanation goes here
ow=imread('gabor_filtered_msg_image.bmp');
ow=imresize(ow,[256 256]);
bit_mac=mfw-ow;
count=0;
for i=1:(256*256)
    
    if(bit_mac(i)==0)
        count=count+1;
    
    end
end

per_mac=count/(256*256)*100;
strng='Image match percentage is ';
strng=[strng num2str(per_mac) ' %'];
button = questdlg(strng, ...
                            'Matching','Ok','Ok');
          
          switch button
            case 'Ok',
                
          end
end

