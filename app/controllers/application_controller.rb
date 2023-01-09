
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base


  configure do
    set :method_override, true
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get '/articles/new' do
    erb :new
  end
  
  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

  post '/articles' do
    article = Article.create(params)
    redirect "/articles/#{article.id}"
  end

  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

  patch '/articles/:id' do
    # params.delete("_method")
    @article = Article.find(params[:id])
    @article.update(params[:article])
    redirect "/articles/#{article.id}"
  end

  delete '/articles/:id' do
    @article = Article.find(params[:id])
    @article.destroy
    redirect "/articles"
  end




  #need to be Private method - not for user
  # def find_article
    # DRY - use this method instead of repeating .find in routes above
    # @article = Article.find(params[:id])
  # end




end
