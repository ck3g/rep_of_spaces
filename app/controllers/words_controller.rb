class WordsController < ApplicationController
  def index
    @words = current_user.words.all
  end

  def show
    @word = Word.find params[:id]
  end
end
