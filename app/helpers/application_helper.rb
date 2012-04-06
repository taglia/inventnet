module ApplicationHelper
  def nav_link (label, path, options=nil)
    result = "<li"
    if current_page? path
      result += " class 'active'";
    end
    result += ">"+link_to(label, path, options)+"</li>"

    return result.html_safe
  end
end
