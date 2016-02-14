module ApplicationHelper
  def nav_link_to(text, path)
    active_class = "active" if current_page?(path)
    content_tag :li, class: "nav-item #{active_class}" do
      link_to text, path, class: "nav-link"
    end
  end
end
