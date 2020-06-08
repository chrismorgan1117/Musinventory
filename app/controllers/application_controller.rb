require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
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
      User.create( username: params[:username], password_digest: params[:password_digest])
      @user.save
      session[:id] = @user.id
      redirect '/login'
    end
  end

end
