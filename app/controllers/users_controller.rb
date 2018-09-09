class UsersController < Sinatra::Base

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



end
