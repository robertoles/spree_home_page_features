Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :home_page_features
  end
end
