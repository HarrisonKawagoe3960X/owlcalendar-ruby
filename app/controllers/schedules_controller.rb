class SchedulesController < ApplicationController
  def main
  end

  def delete
    deletenum = params[:deleteindex]
    Schedule.destroy(deletenum.to_i)
    Schedule.order(:time)
  session[:schedule] = []

  schedules = Schedule.all.order(:time)
          schedules.each do |schedule2|
            if schedule2.userid == session[:userid]
              session[:schedule].push(schedule2.id)
            end
            
          end
  
    redirect_to action:'main' 
  end
end
