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
    else
      redirect '/createroutine'
    end
  else
    redirect '/login'
    end
  end

  get '/routines/:slug/edit' do
    @routine = Routine.find_by_slug(params[:slug])
    erb :'/routines/edit'
  end

  patch '/routines/:slug' do
    @routine.routine_name = params[:routine_name]
    @routine.routine_days = params[:routine_days]
    @routine.routine_content = params[:routine_content]
    @routine.save
  end

  get '/routines/:slug' do
    if logged_in?
      @routine = Routine.find_by_slug(params[:slug])
      if @routine.user_id == session[:user_id]
        @routine.destroy
        redirect '/routines'
      else
        redirect '/login'
      end
    end
  end


  end
