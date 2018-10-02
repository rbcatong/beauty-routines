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
      if params[:routine_name] != "" && params[:routine_content] != "" && params[:routine_days] != " "
        @routine = current_user.routines.create(routine_name: params[:routine_name], routine_days: params[:routine_days], routine_content: params[:routine_content])
        erb :'/routines/show'
      else
        session[:error] = "There was an error while creating a routine, please fill in all blanks."
        @error1 = session[:error]
        erb :'/routines/create'
      end
    else
      redirect '/login'
    end
  end

  get '/routines/:id/edit' do
    @routine = Routine.find_by_id(params[:id])
    erb :'/routines/edit'
  end

  patch '/routines/:id' do
    @routine = Routine.find_by_id(params[:id])
        @routine.routine_name = params[:routine_name]
        @routine.routine_days = params[:routine_days]
        @routine.routine_content = params[:routine_content]
      if params[:routine_name] != "" && params[:routine_content] != "" && params[:routine_days] != " "
        @routine.save
        redirect '/routines'
      else
        session[:error] = "There was an error while creating a routine, please fill in all blanks."
        @error2 = session[:error]
        erb :'/routines/edit'
      end
    end
  end


delete '/routines/:id' do
  if logged_in?
    @routine = Routine.find_by_id(params[:id])
    if @routine.user_id == current_user.id
      @routine.destroy
      redirect '/routines'
    else
      redirect '/login'
    end
  end
end
