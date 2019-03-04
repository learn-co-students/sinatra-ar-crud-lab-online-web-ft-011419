
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
    
  get'/' do 
    redirect to "/articles"
    end

    get'/articles'  do
      @articles = Article.all
       erb :index 
      end
   
    get '/articles/new' do
    erb :new
    end

    post '/articles' do 

       @article =Article.create(params)
     redirect to   "/articles/#{@article.id}"
    end
    
    
    
    get'/articles/:id'  do
     @article = Article.find(params[:id])
     erb :show 
    end
    
    #update

    get  '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
    end

    patch '/articles/:id' do 
    var = Article.find(params[:id])
   
    var.update(params[:article])
    redirect  to  "/articles/#{var.id}"
    end

delete '/articles/:id' do
Article.find(params[:id]).delete
redirect to '/articles'
end






end
