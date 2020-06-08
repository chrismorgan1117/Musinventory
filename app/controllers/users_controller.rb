class UsersController < ApplicationController
  
  
  get '/signup' do
      if logged_in?
        redirect to "/users/#{current_user.id}"
      else
        erb :'/users/signup'
      end
    end

  post '/signup' do 
    if params[:username] == "" || params[:password] == "" 
      redirect '/error'
    else
      user = User.new(username: params[:username], password_digest: params[:password_digest])
      user.save
      session[:id] = user.id
      redirect "/users/#{user.id}"
    end
  end

  post '/login' do 
    user = User.find_by(:username => params[:username])
    if user && user.password_digest == params[:password_digest]#user.authenticate(params[:password_digest])
      session[:user_id] = user.id
      redirect to '/profile'
    else
      erb :login_error
    end
  end

  get '/profile' do 

    erb :profile
  end
  
  
  get '/users/:id' do
    @user = User.find_by_id(params[:id])
    if logged_in? && @user == current_user
      erb :'/users/profile'
    else
      redirect to '/'
    end
  end
end