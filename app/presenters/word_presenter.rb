class WordPresenter < SimpleDelegator
  def excerpt
    word.excerpt.gsub(
      /#{Regexp.quote(word.content)}/,
      "<strong>#{word.content}</strong>"
    )
  end

  private

  def word
    __getobj__
  end
end
