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
      create_categories_for(@word)
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
    params.require(:word).permit(:content, :translation, :excerpt, :synonyms, :antonyms, :gender)
  end

  def create_categories_for(word)
    params[:word][:categories_csv].to_s.split(",").each do |category_name|
      word.categories << current_user.categories.find_or_create_by(name: category_name.strip)
    end
  end
end
