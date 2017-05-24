module ApplicationHelper
  def render_images(images, scheme = nil)
    return "" if images.count == 0
    #scheme1 = [{style: :large, columns: 12}, {type: :column, large: 4, content: {style: :square, count: 2}}, { type: :column, large: 4, content: {style: :wide} }, {type: :column, large: 4, content: { style: :square, count: 2 }} ]
    scheme1 = [:large, [{style: :square, count: 2}, :wide, {style: :square, count: 2}]]
    scheme ||= scheme1
    content_str = ""


    processed_images_count = 0
    total_images_count = images.count
    scheme.each_with_index do |entry, i|
      #content_str += render_entry(entry, i, scheme)
      entry_str = ""
      if entry.is_a?(String) || entry.is_a?(Symbol)
        entry_str = complete_render_image(images[processed_images_count], entry.to_sym, wrap_class: "optional-full-width-photo")
        entry_str = "<div class='columns'>#{entry_str}</div>"
      end

      content_str += entry_str
    end
    "<div class='collage-wrapper slide-up inside-project-one'><div class='row collapse'>#{content_str}</div></div>".html_safe
  end

  def render_entry(entry, entry_index, scheme)
    content_str = ""
    if entry[:type] == :column
      content_str += render_column(entry[:large], entry[:content])
    else
      content_str += render_image(entry)
      image_number += entry[:count] || 1
    end
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
end
