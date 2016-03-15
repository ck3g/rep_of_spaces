class PracticesController < ApplicationController
  authorize_resource class: false

  def new
    @word = WordPresenter.new(current_user.words.weak.sample)
  end

  def create
    UpdateWordStatus.new(Word.find(params[:id]), result).call
    redirect_to new_practice_path
  end

  private

  def result
    {
      "failed_repetition" => :failed_repetition,
      "successful_repetition" => :successful_repetition
    }.fetch(params[:result], :failed_repetition)
  end
end
