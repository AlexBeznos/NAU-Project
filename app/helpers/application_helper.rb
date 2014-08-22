module ApplicationHelper
  def is_active?(my_path, main_class, active_class)
    if request.path == my_path
      return main_class + " " + active_class
    else
      return main_class
    end
  end
end
