class RoutinesController < ApplicationController

  get '/routines' do
    if logged_in?
      erb :'/routines/show'
    else
      erb :'/'
    end
  end

  get '/createroutine' do
    if logged_in?
      erb :'/routines/create'
    else
      erb :'/'
    end
  end

  post '/routines' do
    if logged_in?
      if params[:routine_name] != "" && params[:routine_content] != ""
      @routine = current_user.routines.create(routine_name: params[:routine_name], routine_days: params[:routine_days], routine_content: params[:routine_content])
      redirect "/routines/#{@routine/:slug}"
    else
      redirect '/createroutine'
    end
  else
    redirect '/login'
    end
  end

end
