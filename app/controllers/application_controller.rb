
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles/new' do
    erb :new
  end

  get '/articles' do
    @Articles = Article.all
    erb :index
  end

  get '/articles/:id' do
    @article = Article.find(params["id"])
    erb :show
  end

  patch '/articles/:id' do
    @article = Article.find(params["id"])
    Article.update(@article.id, title: params["title"], content: params["content"])
    redirect "/articles/#{@article.id}"
  end

  delete '/articles/:id/delete' do
    Article.delete(params["id"])
  end

  post '/articles' do
    @article = Article.create(title: params["title"], content: params["content"])
    redirect "/articles/#{@article.id}"
  end

  get '/articles/:id/edit' do
    @article = Article.find(params["id"])
    erb :edit
  end
end
