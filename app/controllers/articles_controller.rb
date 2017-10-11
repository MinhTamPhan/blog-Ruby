class ArticlesController < ApplicationController

  skip_before_action :require_login, only: [:create, :index]
  def index;end
  
  def dashboard
  end

  def new
    @title = 'New'
    @article = Article.new  
  end

  def create
    @param = new_post_params
    @article = Article.new
    @article.title = @param[:title]
    @article.text = @param[:text]
    @article.account = Account.find(session[:current_user_id])
    if @param[:picture]
      upload()
    end
    if @article.save
      redirect_to dashboard_url
    else
      render :new
    end
    #render json: @article
    #render plain: params[:article].inspect
  end

  private

  def upload
    uploaded_io = new_post_params()[:picture]
    File.open(Rails.root.join('app', 'assets/images/post','main.png'), 'wb') do |file|
      file.write(uploaded_io.read)
    end
  end

  def new_post_params
    params.require(:article).permit(:title, :text, :picture)
  end
end
