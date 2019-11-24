class MypageController < ApplicationController
  def index
    @error = params[:error]
  end

  def update
    user = User.find_by(id: session[:userid])
    user.name = params[:username]
    user.password = params[:password]
    user.email = params[:email]
    if user.valid?
      user.save
      redirect_to controller:'index',action:'index' and return
    end
    redirect_to controller:'mypage',action:'index',error:"error!"
  end
end
