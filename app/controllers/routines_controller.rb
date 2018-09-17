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
      # redirect "/routines/#{@routine.slug}/edit"
    else
      redirect '/createroutine'
    end
  else
    redirect '/login'
    end
  end

  get '/routines/:slug/edit' do
    @routine = Routine.find_by_slug(params[:slug])
    binding.pry
    erb :'/routines/edit'
  end

  patch '/routines/:slug' do
    @routine.routine_name = Routine.find_by_slug(params[:slug])
    @routine.routine_days = params[:routine_days]
    @routine.content = params[:routine_content]
    @routine.save
  end

end
