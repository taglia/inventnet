module ApplicationHelper
  def nav_link (label, path, options=nil)
    result = "<li"
    if request.fullpath.rindex path
      result += " class 'active'";
    end
    result += ">"+link_to(label, path, options)+"</li>"

    return result.html_safe
  end
end
