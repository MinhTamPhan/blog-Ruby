class AccountsController < ApplicationController

  include AccountsHelper

  skip_before_action :require_login, only: [:new, :create, :index, :login]

  def index
    @account = Account.new
  end

  def create
    @account = Account.new(sign_up_params)
    require 'digest'
    @account.password = Digest::MD5.hexdigest(@account.password)
    @account.password_confirmation = Digest::MD5.hexdigest(@account.password_confirmation)
    if @account.save
      redirect_to(@account)
    else
      render :new
    end
  end

  def new
    @account = Account.new
  end

  def login
    @params = sign_in_params
    require 'digest'
    @password_raw = Digest::MD5.hexdigest(@params[:password])
    @account = Account.find_by(email: @params[:email], password: @password_raw)
    session[:current_user_id] = @account.id
    if @params[:remember]
      cookies[:current_user_id] = { value: @account.id, expires: 30.days.from_now }
    end
    redirect_to dashboard_url
  end

  def show
    if is_authencated?
      @account = session[:current_user_id]
    else
      redirect_to accounts
    end
  end


  def logout
    detroy_authencated
    redirect_to root_url
  end

  private

  def sign_up_params
    params.require(:account).permit(:email, :fullname,:password, :password_confirmation)
  end

  def sign_in_params
    params.require(:account).permit(:email,:password, :remember)
  end
end
