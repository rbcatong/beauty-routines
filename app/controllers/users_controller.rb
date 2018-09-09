class UsersController < Sinatra::Base

  get '/signup' do
    erb :'/users/signup'
  end

  post '/signup' do

  end

  get '/login' do
    erb :'/users/login'
  end

  post '/login' do
    binding.pry
  end

end
