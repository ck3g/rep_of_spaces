class WordsController < ApplicationController
  before_action :find_word, only: [:show, :destroy]

  def index
    @words = current_user.words.all
  end

  def show
  end

  def new
    @word = Word.new
  end

  def create
    @word = current_user.words.new safe_params
    if @word.save
      redirect_to words_path, notice: "You have added one more word"
    else
      render :new
    end
  end

  def destroy
    @word.destroy
    redirect_to words_url
  end

  private

  def find_word
    @word = Word.find params[:id]
  end

  def safe_params
    params.require(:word).permit(:content, :translation, :excerpt)
  end
end
