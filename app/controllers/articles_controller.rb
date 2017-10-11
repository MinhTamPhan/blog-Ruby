class ArticlesController < ApplicationController

  skip_before_action :require_login, only: [:create, :index]
  def index
    @articles = Article.all
  end
  
  def dashboard
    @articles = Article.where(account_id: session[:current_user_id])
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
    if @article.save
      if @param[:picture]
        upload(@article.id)
      end
      redirect_to dashboard_url
    else
      render :new
    end
    #render json: @article
    #render plain: params[:article].inspect
  end
  
  def show
    @article = Article.find(params[:id])
  end

  private

  def upload(id)
    uploaded_io = new_post_params()[:picture]
    Dir.mkdir(Rails.root.join('public', 'uploads', "#{id}"))
    File.open(Rails.root.join('public', 'uploads', "#{id}", 'main.jpg'), 'wb') do |file|
      file.write(uploaded_io.read)
    end
  end

  def new_post_params
    params.require(:article).permit(:title, :text, :picture)
  end
end
