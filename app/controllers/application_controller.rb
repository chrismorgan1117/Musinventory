require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :session_secret, "password_security"
  end

  get "/" do
    erb :welcome
  end

  get '/signup' do 
    erb :signup
  end

  post '/signup' do 
    @user = User.find_by(:username => params[:username])
    if params[:username] == "" || params[:password] == "" 
      redirect '/error'
    elsif @user != nil
      redirect '/error2'
    else
      @user = User.create( username: params[:username], password_digest: params[:password_digest])
      @user.save
      session[:id] = @user.id
      redirect '/profile'
    end
  end

  post '/login' do 
    @user = User.find_by(:username => params[:username])
    if @user != nil && @user.password_digest == params[:password_digest]
      session[:user_id] = @user.id
      redirect to '/local_musicians'
    else
      erb :login_error
    end
  end

  get '/profile' do 
    
    erb :profile
  end

end
