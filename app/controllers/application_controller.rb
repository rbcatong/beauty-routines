require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :welcome
  end

  get '/login' do
    erb :'/users/login'
  end

  post '/login' do
    redirect to '/home'
  end


  get '/signup' do
    erb :'/users/signup'
  end

  post '/signup' do
    @user = User.create(username: params[:username], email: params[:email], password: params[:password])
    redirect to '/home'
  end

  get '/home' do
    erb :'/routines/home'
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
  end


end
