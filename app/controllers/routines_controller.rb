class RoutinesController < ApplicationController

  get '/routines' do
    erb :'/routines/show'
  end

  get '/createroutine' do
    erb :'/routines/create'
end

  post '/routines' do
    @routine = current_user.routines.create(name: params[:routine_name], day: params[:routine_days], content: params[:routine_content])

  end

end
