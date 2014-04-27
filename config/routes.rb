Rails.application.routes.draw do
  root 'site#index'

  scope :api, defaults: { format: :json }, except: [ :edit, :new ] do
    resources :users do
      resources :tools
    end

    resources :tools, only: [ :index, :show ]
  end
end
