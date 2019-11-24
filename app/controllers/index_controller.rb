require 'date'

class IndexController < ApplicationController
    d = Date.today
    $todayyear = (d.strftime("%Y")).to_i(10)
    $todaymonth = (d.strftime("%m")).to_i(10)
    $todayday = (d.strftime("%d")).to_i(10)
    $currentyear = $todayyear
    $currentmonth = $todaymonth
    
    def index

        
        @userid = session[:userid]
        @currentyear = $currentyear
        @currentmonth = $currentmonth
        @todayday = $todayday
        @todayyear = $todayyear
        @todaymonth = $todaymonth
        
        e = Date.new(@currentyear,@currentmonth,1)
        @yb = e.wday
        @title = @currentyear.to_s + "年" + @currentmonth.to_s + "月" 
        @daymax = 0
        month_days = [31,27,31,30,31,30,31,31,30,31,30,31]
        if (@currentyear % 4 == 0)&&(@currentyear % 100 != 0) || (@currentyear % 400== 0)
            month_days[1] = 28
        end
       
       @daymax = month_days[@currentmonth - 1]

    end

    def back
        if $currentmonth == 1
            $currentmonth = 12
            $currentyear -=1
        else 
            $currentmonth-=1
        end
        @currentyear = $currentyear
        @currentmonth = $currentmonth
        $daydata = Array.new(35)
        redirect_to :action => 'index'
    end

    def forward
        if $currentmonth == 12
            $currentmonth = 1
            $currentyear +=1
        else 
            $currentmonth+=1
        end
        @currentyear = $currentyear
        @currentmonth = $currentmonth
        redirect_to :action => 'index'
    end

    def seeday
        params[:detailday] = params[:day]
        params[:detailmonth] = $currentmonth
        params[:detailyear] = $currentyear
        redirect_to controller: 'daydetail', action: 'day',:detailmonth=> $currentmonth,:detailyear=>$currentyear,:detailday=> params[:day]
    end

    def logout
        session[:userid] = nil
        session[:username] = nil
        session[:schedules] = []
        redirect_to :action => 'index'

    end
end
