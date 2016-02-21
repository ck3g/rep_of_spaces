class PracticesController < ApplicationController
  authorize_resource class: false

  def new
    @word = current_user.words.sample
  end
end
