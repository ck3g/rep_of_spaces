module ApplicationHelper
  def nav_link_to(text, path)
    active_class = "active" if current_page?(path)
    content_tag :li, class: "nav-item #{active_class}" do
      link_to text, path, class: "nav-link"
    end
  end

  def word_time_ago_in_words(word)
    if word.last_practiced_at
      time_ago_in_words(word.last_practiced_at) + " #{t("views.words.practiced_at_ago")}"
    else
      t("views.words.never_practiced_at")
    end
  end

  def gender_icon(word)
    return if word&.gender.blank?
    content_tag :span, "", class: "gender gender-#{word.gender}"
  end

  def gender_class(word)
    return if word.try(:gender).blank?
    "gender-#{word.gender}"
  end
end
