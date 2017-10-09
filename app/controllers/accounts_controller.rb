class AccountsController < ApplicationController
  def index
    @account = Account.new
  end

  def create
    render plain: params[:account].inspect    
  end

  def new
    @account = Account.new
  end

  def login
    render plain: params[:account].inspect    
  end
end
