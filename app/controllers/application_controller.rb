class ApplicationController < ActionController::Base
  
  protect_from_forgery with: :exception
  include AccountsHelper
  before_action :require_login
  
  private

  def require_login
    unless is_authencated?
      flash[:error] = "You must be logged in to access this section"
      redirect_to accounts_url
    end
  end
end
