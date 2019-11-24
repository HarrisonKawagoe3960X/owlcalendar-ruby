class NewscheduleController < ApplicationController
  def index
  end

  def newschedule 
  year = params[:year]
  month = params[:month]
  day = params[:day]
  hour = params[:hour]
  minute = params[:minute]
  content = params[:content]
  temp = year.to_s
  timenum = year.to_i * 1000+ month.to_i * 100  + day.to_i * 10 +hour.to_i  +minute.to_i * 0.1
  if month.to_i <10
    temp+="0"
  end
  temp += month.to_s
  if day.to_i <10
    temp+="0"
  end
  temp += day.to_s
  if hour.to_i <10
    temp+="0"
  end
  temp += hour.to_s
  if minute.to_i <10
    temp+="0"
  end
  temp += minute.to_s
  schedule = Schedule.new(content:content,time:timenum,userid:session[:userid],timedata:temp)
  schedule.save
  Schedule.order(:time)
  session[:schedule] = []

  schedules = Schedule.all.order(:time)
          schedules.each do |schedule2|
            if schedule2.userid == session[:userid]
              session[:schedule].push(schedule2.id)
            end
            
          end
  
 
  redirect_to controller:'index',action:'index'
  end
end
