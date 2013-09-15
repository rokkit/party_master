PartyMaster::Application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :auth do
        devise_for :users, controllers: { sessions: 'api/v1/auth/sessions' }
        #resources :sessions, only: [:create, :destroy]
      end
      resources :events
    end
  end
end
