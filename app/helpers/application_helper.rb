module ApplicationHelper
  def render_images(images, scheme = nil)
    return "" if images.count == 0
    schemes = []
    schemes << {scheme: [{style: :large}, [[{style: :square, columns: 12}, {style: :square, columns: 12}], {style: :wide, columns: 4}, [{style: :square, columns: 12}, {style: :square, columns: 12}]]], images_count: 6}
    schemes << {scheme: [[:medium_square, :medium_tall], [:medium_tall, :medium_square]], images_count: 4}
    schemes << {scheme: [:large, [[:small_wide, [:small_square, :small_square]], :medium_square]], images_count: 5}
    schemes << {scheme: [[[:small_square, :small_square, :small_square, :small_square], :medium_square], [:medium_square, [:small_square, :small_square, :small_square, :small_square]]], images_count: 10}

    if scheme
      scheme_index = scheme - 1
    else
      scheme_index = 0
    end

    scheme_index = 0

    scheme = schemes[scheme_index]
    content_str = ""


    processed_images_count = 0
    total_images_count = images.count
    images.in_groups_of(scheme[:images_count], false) do |group|
      content_str = render_array(scheme[:scheme], group)
    end
    "<div class='collage-wrapper slide-up inside-project-one'>#{content_str}</div>".html_safe
  end

  def render_array(entry, images, level = 0, columns = 12)
    puts "entry: #{entry.inspect}"
    puts "images.ids: #{images.map(&:id).join(", ")}"
    puts "level: #{level}"
    puts "columns: #{columns}"

    arr_str = ""

    if entry.is_a?(String) || entry.is_a?(Symbol)
      entry = {style: entry.to_sym}
    end

    if entry.is_a?(Hash)
      if entry[:columns]
        columns = entry[:columns]
      end

      first_image = images.is_a?(Array) ? images.first : images
      entry_str = complete_render_image(first_image, entry[:style], wrap_class: "optional-full-width-photo")
      entry_str = "<div class='columns large-#{columns}'>#{entry_str}</div>"
      arr_str = entry_str
    elsif entry.is_a?(Array)
      arr_entries_count = entry.flatten.count
      processed_entries_count = 0

      entry.each do |child_entry|
        group_images_count = child_entry.is_a?(Array) ? child_entry.flatten.count : 1
        group_images = images[processed_entries_count..(processed_entries_count + group_images_count - 1)]
        if group_images.count == 0
          next
        end

        child_columns = 12 / entry.count
        if level >= 0 && level <= 0
          child_columns = 12
        end

        arr_str += render_array(child_entry, group_images, level + 1, child_columns)
        processed_entries_count += group_images_count
      end

      wrap_columns = 12 / entry.count
      if level == 0 && level <= 2
        wrap_columns = 12
      end

      if level == 0
        arr_str = "<div class='s-wrap row collapse'>#{arr_str}</div>"
      elsif level > 1
        arr_str = "<div class='s-wrap columns large-#{wrap_columns}'><div class='row collapse'>#{arr_str}</div></div>"
      end
      #arr_str = "<div class='row collapse'>#{arr_str}</div>"
    end

    arr_str
  end

  def render_entry(entry, entry_index, scheme)

  end

  def compute_scheme(images, scheme)
    scheme.map{|entry|
      entry[]
    }
  end

  def render_column(large_size, content)

  end

  def render_image(entry)
    opts = {}
    opts[:asset] = entry[:image]
    render "image", **opts
  end

  def complete_render_image(image, style, options = {})
    render "image", asset: image, style: style, **options
  end

  def render_summary_attributes(instance, attrs)
    attrs.map do|attr|
      value = instance.send(attr)
      next if value.blank?
      formatted_value = ""

      value = [value] if !value.is_a?(Array)

      formatted_value = value.map{|line| "<p class='regular'>#{line}</p>"  }.join("")

      label = I18n.t("projects.summary.attributes.#{attr}", raise: true) rescue attr.to_s.humanize
      label += ":"
      "<p class='smaller'>#{label}</p>#{formatted_value}"
    end.select{|s| !s.nil? }.join("").html_safe

  end

  def self.video_url(resource)
    if (!resource.respond_to?(:youtube_video_id) || resource.youtube_video_id.blank?) && (!resource.respond_to?(:vimeo_video_id) || resource.vimeo_video_id.blank?)
      return nil
    elsif resource.respond_to?(:youtube_video_id) && resource.youtube_video_id.present?
      return "https://www.youtube.com/embed/#{resource.youtube_video_id}?rel=0"
    elsif resource.respond_to?(:vimeo_video_id) &&  resource.vimeo_video_id.present?
      return "https://player.vimeo.com/video/#{resource.vimeo_video_id}"
    end
  end

  def main_hash_tag
    "twoheartslviv"
  end

  def hash_tag_url(t)
    "https://www.instagram.com/explore/tags/#{t}"
  end
end
