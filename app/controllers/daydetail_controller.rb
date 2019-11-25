class DaydetailController < ApplicationController
  
  def day
    @festivals = []
    @currentmonth = params[:detailmonth]
    @currentyear = params[:detailyear]
    @currentday = params[:detailday]
    if session[:userid] != nil
      session[:schedule] = []
          schedules = Schedule.all.order(:time)
          schedules.each do |schedule2|
            if schedule2.userid == session[:userid]
              session[:schedule].push(schedule2.id)
            end
            
          end
    end

    @title = @currentyear.to_s+"年"+@currentmonth.to_s+"月"+@currentday.to_s+"日"
    if @currentday.to_i == 1 && @currentmonth.to_i == 1
        @festivals.push("元日")
    end
    if @currentday.to_i == 11 && @currentmonth.to_i == 2
      @festivals.push("建国記念の日")
    end  
    if @currentday.to_i == 23 && @currentmonth.to_i == 2
      @festivals.push("天皇誕生日")
    end  
    if @currentday.to_i == 29 && @currentmonth.to_i == 4
      @festivals.push("昭和の日")
    end  
    if @currentday.to_i == 3 && @currentmonth.to_i == 5
      @festivals.push("憲法記念日")
    end  
    if @currentday.to_i == 4 && @currentmonth.to_i == 5
      @festivals.push("みどりの日")
    end  
    if @currentday.to_i == 5 && @currentmonth.to_i == 5
      @festivals.push("こどもの日")
    end 
    if @currentday.to_i == 11 && @currentmonth.to_i == 8
      @festivals.push("山の日")
    end 
    if @currentday.to_i == 3 && @currentmonth.to_i == 11
      @festivals.push("文化の日")
    end 
    if @currentday.to_i == 23 && @currentmonth.to_i == 11
      @festivals.push("勤労感謝の日")
    end 
  end
end
