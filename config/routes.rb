Rails.application.routes.draw do
  post 'loginapi/index'
  post 'postschapi/index'
  post 'schapi/index'
  get 'scheduleapi/index'
  get 'newschedule/index'
  post 'newschedule/newschedule'
  get 'mypage/index'
  get 'schedules/main'
  get 'schedules/delete'
  get 'register/main'
  post 'register/register'
  post 'login/login'
  get 'login/main'
  get 'daydetail/day'
  root 'index#index'
  post 'index/back'
  post 'index/forward'
  post 'index/seeday'
  get 'index/logout'
  post 'mypage/update'
  namespace 'api' do
    namespace 'v1' do
      resources :users
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
