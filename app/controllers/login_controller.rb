class LoginController < ApplicationController
  def main
    @error = params[:error]
  end

  def login 
    username = params[:username]
    password = params[:password]
    userdatas = User.all
    
    userdatas.each do |userdata|
      if userdata.name == username
        userobject = User.find(userdata.id.to_i)
        if userobject.authenticate(password)
          session[:username] = userdata.name
          session[:userid] = userdata.id
          session[:schedule] = []
          schedules = Schedule.all.order(:time)
          schedules.each do |schedule2|
            if schedule2.userid == userdata.id
              session[:schedule].push(schedule2.id)
            end
            
          end

          redirect_to controller:'index',action:'index' and return
        end
        redirect_to controller:'login',action:'main',error:'Password not Correct!' and return
      end
    end
    
    redirect_to controller:'login',action:'main',error:'User not exist!'
  end
end
