
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect to '/articles'
  end

  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    Article.create(title: params[:title], content: params[:content])
  end

  get '/articles' do
    @article = Article.all

    erb :index
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])
  end

  get '/articles/:id/edit' do
    erb :edit
  end



end
