class UsersController < ApplicationController

  get '/signup' do
    if !logged_in?
      @error = session[:error]
    erb :'/users/signup'
  else
    redirect '/routines'
    end
  end

  post '/signup' do
    no_blanks = params[:username] != "" && params[:email] != "" && params[:password] != ""
    user_exists = !!User.find_by(username: params[:username])
    if no_blanks && !user_exists
      @user = User.create(username: params[:username], email: params[:email], password: params[:password])
      session[:user_id] = @user.id
      redirect '/home'
    else
      session[:error] = "There was an error during signup."
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
