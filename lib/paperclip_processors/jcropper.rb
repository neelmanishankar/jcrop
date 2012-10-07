# Jcropper paperclip processor
#
# This processor very slightly changes the default thumbnail processor in order to work properly with Jcrop
# the jQuery cropper plugin.
 
module Paperclip
  # Handles thumbnailing images that are uploaded.
  class Jcropper < Thumbnail
    
    def transformation_command
      if crop_command
        p super
        p "::::::::::::::::: #{crop_command} "
        crop=crop_command +  super.sub(/ -crop \S+/, '').split(' ')
        p "KKKKKKKKKKKKKKKKKKKK#{crop}"
        crop.join(' ')
      else
        p "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL"
        super
      end
    end
    
    def crop_command
      target = @attachment.instance
      if target.cropping?
        ["-crop","#{target.crop_w.to_i}x#{target.crop_h.to_i}+#{target.crop_x.to_i}+#{target.crop_y.to_i}"]
      end
    end
  
  end
   
end