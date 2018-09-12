class UsersController < ApplicationController

  get '/signup' do
    if !logged_in?
    erb :'/users/signup'
  else
    redirect '/routines'
    end
  end

  post '/signup' do
    if params[:username] != "" && params[:email] != "" && params[:password] != ""
      @user = User.create(username: params[:username], email: params[:email], password: params[:password])
      session[:user_id] = @user.id
      redirect '/home'
    else
      redirect to '/signup'
    end
  end

  get '/login' do
    if logged_in?
      redirect '/home'
    else
      erb :'/users/login'
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to '/home'
    else
      redirect '/login'
    end
  end

  get '/logout' do
    if logged_in?
      session.destroy
      redirect '/login'
    else
      redirect '/'
    end
  end

  get '/home' do
    erb :'/routines/home'
  end



end
