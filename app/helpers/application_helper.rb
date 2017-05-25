module ApplicationHelper
  def render_images(images, scheme = nil)
    return "" if images.count == 0
    #scheme1 = [{style: :large, columns: 12}, {type: :column, large: 4, content: {style: :square, count: 2}}, { type: :column, large: 4, content: {style: :wide} }, {type: :column, large: 4, content: { style: :square, count: 2 }} ]
    scheme1 = {scheme: [:large, [[:square, :square], :wide, [:square, :square]]], images_count: 6}
    scheme2 = {scheme: [[:medium_square, :medium_tall], [:medium_tall, :medium_square]], images_count: 4}
    scheme3 = {scheme: [:large, [[:small_wide, [:small_square, :small_square]], :medium_square]], images_count: 5}
    scheme4 = {scheme: [[[:small_square, :small_square, :small_square, :small_square], :medium_square], [:medium_square, [:small_square, :small_square, :small_square, :small_square]]], images_count: 10}

    scheme ||= scheme1
    content_str = ""


    processed_images_count = 0
    total_images_count = images.count
    images.in_groups_of(scheme[:images_count], false) do |group|
      content_str = render_array(scheme[:scheme], group)
    end
    "<div class='collage-wrapper slide-up inside-project-one'><div class='row collapse'>#{content_str}</div></div>".html_safe
  end

  def render_array(entry, images)
    arr_str = ""
    if entry.is_a?(String) || entry.is_a?(Symbol)
      first_image = images.is_a?(Array) ? images.first : images
      entry_str = complete_render_image(first_image, entry.to_sym, wrap_class: "optional-full-width-photo")
      entry_str = "<div class='columns'>#{entry_str}</div>"
      arr_str = entry_str
    elsif entry.is_a?(Array)
      arr_entries_count = entry.flatten.count
      processed_entries_count = 0
      entry.each do |child_entry|
        group_images_count = child_entry.is_a?(Array) ? child_entry.flatten.count : 1
        group_images = images[processed_entries_count..(processed_entries_count + group_images_count - 1)]
        arr_str = render_array(entry, group_images)
      end

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
end
