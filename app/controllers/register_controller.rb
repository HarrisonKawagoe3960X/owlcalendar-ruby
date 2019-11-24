class RegisterController < ApplicationController
  def main
    @error = params[:error]
  end

  def register 
    
    user = User.new(name:params[:username],password:params[:password],email:params[:email])
    if user.valid?
      user.save
      redirect_to controller:'login',action:'main' and return
    end
    redirect_to controller:'register',action:'main',error:'User is exist!'
    
  end
end
