class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_current_company
  
  def set_current_company
      @current_company = Company.find(session[:company_id])
  end

end
