class EquipmentController < ApplicationController
  
  get '/equipment/create' do 
    if logged_in?
      erb :'/equipment/create'
    else
       erb :'/welcome'
    end
  end

  get '/equipment/edit' do 
    erb :'/equipment/edit'
  end


end