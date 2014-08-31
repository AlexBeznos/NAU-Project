module ApplicationHelper

  def is_active?(my_path, active_class, main_class = "")
    if request.path == my_path
      return main_class + " " + active_class
    else
      return main_class
    end
  end

  def active_li_tag(name, path)
    url = URI.parse(path)
    content_tag(:li, :class => is_active?(url.path, "active")) do
      link_to name, path
    end
  end

end
