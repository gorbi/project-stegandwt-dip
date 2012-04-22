function ask_wm()
button = questdlg('The cover image was successfully watermarked with message image', ...
                            'Finished','Ok','Show all images','Show all images');
          switch button
            case 'Ok',
              
            case 'Show all images',
              figure('Name','Cover Image','NumberTitle','off'),
              imshow('cover_image.bmp'),
              
              figure('Name','Message Image','NumberTitle','off'),
              imshow('message_image.bmp'),
                
              figure('Name','Watermarked Image','NumberTitle','off'),
              imshow('watermarked.bmp'),
              
              figure('Name','Gabored Filtered Message Image','NumberTitle','off'),
              imshow('gabor_filtered_msg_image.bmp'),
          end
end