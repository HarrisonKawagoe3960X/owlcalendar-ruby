class PostschapiController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index
    json_request = JSON.parse(request.body.read)
    if json_request["content"] != nil
       content= json_request["content"]
      time= json_request["time"]
      userid= json_request["userid"]
      timedata= json_request["timedata"]
      schedule = Schedule.new(content:content,time:time,userid:userid,timedata:timedata)
      schedule.save
    end
    
  end
end
