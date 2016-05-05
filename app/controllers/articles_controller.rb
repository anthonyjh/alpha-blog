class ArticlesController < ApplicationController
   
   def new
      @article = Article.new
   end
   
   def create
      
      # render plain: params[:article].inspect
      @article = Article.new(article_params)
      @article.save
      redirect_to articles_show(@article)  #redirect so that it knows to save
      
   end
   
   private 
      def article_params
         #top-level key article, permit title and description as input values
         params.require(:article).permit(:title, :description)
         
      end
   
end