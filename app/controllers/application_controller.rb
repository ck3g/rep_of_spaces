class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end

  def current_category
    return unless params[:category_id] && current_user
    @category ||= current_user.categories.find params[:category_id]
  end
  helper_method :current_category
end
