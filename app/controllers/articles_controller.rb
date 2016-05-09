class ArticlesController < ApplicationController
   
   #before anything else, call set_article
   before_action :set_article, only: [:edit, :update, :show, :destroy]  
   
   def index
      @articles = Article.all
   end
   
   def new
      @article = Article.new
   end
   
   def edit
      set_article
   end
   
   def create
      
      #render plain: params[:article].inspect
      @article = Article.new(article_params)
     
      if @article.save
        #do something
        flash[:success] = "Article was successfully created!"
        redirect_to article_path(@article)
      else
        render 'new' #validation failed, render new template to create article
      end
      
   end
   
   def update
      set_article
      if @article.update(article_params)
         flash[:success] = "Article was successfully updated"
         redirect_to article_path(@article)
      else
         render 'edit'
      end
   end
   
   def show
      set_article
   end
   
   def destroy
      set_article  #call set_article method from below
      @article.destroy
      flash[:danger] = "Article was successfully deleted"
      redirect_to articles_path
   end
   
   private 
   
      def set_article
         @article = Article.find(params[:id])
      end
      
      def article_params
         #top-level key article, permit title and description as input values
         params.require(:article).permit(:title, :description)
         
      end
   
end