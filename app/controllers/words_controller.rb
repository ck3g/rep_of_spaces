class WordsController < ApplicationController
  before_action :find_word, only: [:show, :destroy]

  def index
    @words = current_user.words.all
  end

  def show
  end

  def destroy
    @word.destroy
    redirect_to words_url
  end

  private

  def find_word
    @word = Word.find params[:id]
  end
end
