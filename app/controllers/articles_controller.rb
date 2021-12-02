class ArticlesController<ApplicationController
before_action :require_user, except: [:show, :index, :home]
#before_action :same_user, only: [:edit, :update, :destroy]

def home
  redirect_to articles_path if logged_in?
 end

def show
@article=Article.find(params[:id])
end

def index
  @articles=Article.all
end

  def new
      @article=Article.new
  end

def edit
@article =Article.find(params[:id])
end
  def create
    @article=Article.new(params.require(:article).permit(:title, :Author ,:description))
    @article.user=current_user
    if @article.save
      flash[:notice]="Article was created successfully"
     redirect_to @article
    else
     render'new'
  end
end
def update
  @article=Article.find(params[:id])
  if  @article.update(params.require(:article).permit(:title,:Author ,  :description))
    redirect_to articles_path
    flash[:notice]="Article was updated"
  else
    render 'edit'
end
end
  def destroy
    @article=Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end


  #def same_user
  #   if  @article.user.username != current_user.username
  #    flash[:alert]="you can only perform this action with your own articles"
  #    redirect_to @article
  #  end
  #end
end
