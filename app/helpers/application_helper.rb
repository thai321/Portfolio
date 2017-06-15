module ApplicationHelper
  def login_helper(style)
    if !current_user.is_a?(GuestUser)
      link_to "Logout", destroy_user_session_path, method: :delete, class: style
    else
      (link_to "Register", new_user_registration_path, class: style) +
      " " + 
      (link_to "Login", new_user_session_path, class: style)
    end
  end

  def sample_helper
    content_tag(:div, "My content", class: "my-class")
  end

  def source_helper(lay_out)
    if session[:source] 
      greeting = "Thanks for visiting me from #{session[:source]} and you're on the #{lay_out} page"
      content_tag(:p, greeting, class: "source-greeting")
    end 
  end

  def copyright_helper
    @copyright = NguyenViewTool::Renderer.copyright 'Thai Nguyen', 'All rights reserved'
  end
end
