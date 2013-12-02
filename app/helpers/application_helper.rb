module ApplicationHelper
  def image_tag(source, options = {})
    if is_mobile_device? && options.has_key?(:size)
      width, height = options[:size].split('x').map(&:to_i)
      options[:size] = "#{width/2}x#{height/2}"
    end

    super(source, options)
  end
end
