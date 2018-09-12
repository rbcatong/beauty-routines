class RoutinesController < ApplicationController

  get '/routines' do
    erb :'/routines/show'
  end

  get '/createroutine' do
    erb :'/routines/create'
end

  post '/routines' do
    @routine = current_user.routines.create(routine_name: params[:routine_name], routine_days: params[:routine_days], routine_content: params[:routine_content])

  end

end
