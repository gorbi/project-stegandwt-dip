function ask_rm()
button = questdlg('The message image was successfully extracted from watermarked image', ...
                            'Finished','Ok','Show all images','Show all images');
          switch button
            case 'Ok',
              
            case 'Show all images',
              figure('Name','Message Image Extracted from Watermarked Image','NumberTitle','off'),
              imshow('msg_from_watermarked.bmp'),
              
              figure('Name','Original Message Image','NumberTitle','off'),
              imshow('message_image.bmp'),
          end
end