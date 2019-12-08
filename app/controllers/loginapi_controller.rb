class LoginapiController < ApplicationController

  skip_before_action :verify_authenticity_token
  def index
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
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

          render :plain => userdata.id.to_s and return
        end
        render :plain => 'Password not Correct!' and return
      end
    end
    end
    
    
    render :plain => 'User not exist!'
  end
end
