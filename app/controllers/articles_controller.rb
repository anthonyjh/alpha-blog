class ArticlesController < ApplicationController
   
   def new
      @article = Article.new
   end
   
   def create
      
      #render plain: params[:article].inspect
      @article = Article.new(article_params)
     
      if @article.save
        #do something
        flash[:notice] = "Article was successfully created!"
        redirect_to article_path(@article)
      else
        render 'new' #validation failed, render new template to create article
      end
      
   end
   
   def show
      @article = Article.find(params[:id])
   end
   
   private 
      def article_params
         #top-level key article, permit title and description as input values
         params.require(:article).permit(:title, :description)
         
      end
   
end