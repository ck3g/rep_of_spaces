class WordsController < ApplicationController
  authorize_resource

  before_action :find_word, only: [:show, :edit, :update, :destroy]

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
      redirect_to words_path, notice: t("views.words.created_successfully")
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @word.update_attributes safe_params
      redirect_to words_path, notice: t("views.words.updated_successfully")
    else
      render :edit
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
