Paperclip::Attachment.default_options[:processors] = [:thumbnail, :tinify, :watermark]
#Paperclip::Attachment.default_options[:processors] = [:thumbnail, :tinify]

WATERMARK_ORIGINAL_STYLE = {watermark_path: "#{Rails.root}/app/assets/images/watermark/small.png", position: proc {|attachment| attachment.instance.try("#{attachment.name}_watermark_position") }}