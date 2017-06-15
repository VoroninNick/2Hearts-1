#Paperclip::Attachment.default_options[:processors] = [:thumbnail, :tinify, :watermark]
Paperclip::Attachment.default_options[:processors] = [:thumbnail, :tinify]
WATERMARK_POSITIONS = ["NorthWest", "North", "NorthEast", "West", "Center", "East", "SouthWest", "South", "SouthEast"]
WATERMARK_ORIGINAL_STYLE = {watermark_path: "#{Rails.root}/app/assets/images/favicon/favicon-180x180.png", position: proc {|attachment| attachment.instance.try("#{attachment.name}_watermark_position") }}