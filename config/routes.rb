Rails.application.routes.draw do
  resources :psas, :except => :show do
    collection do
      get :lapsed
    end
  end
end
