class SchapiController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def index
    userid = params["userid"]
    schs = []
    schlist = Schedule.all 
    schlist.each do |sch|
      if sch.userid.to_i == userid.to_i
        schs.push(sch)
      end
    end
    
    render :json => schs
  end
end
