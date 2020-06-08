class UsersController < ApplicationController
  
  
  get '/signup' do
    #check if already logged in, if not send to sign up page
      if logged_in?
        redirect to "/users/#{current_user.id}"
      else
        erb :'/users/signup'
      end
    end

  post '/signup' do 
    #no empty params
    if params[:username] == "" || params[:password] == "" 
      redirect '/error'
    else
      #create new user, save and redirect
      user = User.new(username: params[:username], password_digest: params[:password_digest])
      user.save
      session[:id] = user.id
      redirect "/users/#{user.id}"
    end
  end

  post '/login' do 
    #find user by username, verify user exists and password matches, set session id, direct to profile or error
    user = User.find_by(:username => params[:username])
    if user && user.password_digest == params[:password_digest]
      session[:user_id] = user.id
      redirect "/users/#{user.id}"
    else
      erb :login_error
    end
  end

  get '/profile' do 

    erb :profile
  end
  
  
  get '/users/:id' do
    #find user, verify user is logged in and is current user, display profile or redirect to homepage
    @user = User.find_by_id(params[:id])
    if logged_in? && @user == current_user
      erb :'/users/profile'
    else
      redirect to '/'
    end
  end
end