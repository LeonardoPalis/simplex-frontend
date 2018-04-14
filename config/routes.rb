Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :admin_users
    namespace :admin do
     get 'admin_users/index'
  end

  devise_scope :admin_user do
   get "/admin" => "devise/sessions#new"
  end
  namespace :admin do
    resources :admin_users 
    resources :home   
    resources :employees do
      collection do
        get "set_datatable_employees"
      end
    end 
    resources :products do
      collection do
        get "set_datatable_products"
      end
    end  
    resources :optimize
    resources :type_resource do
      collection do
        get "set_datatable_type_resources"
      end
    end 
    resources :production do
      collection do
        post "employee_hour"
        post "create_work"
        post "create_resource"
        get "set_datatable_resource"
        delete "destroy_resource"
      end
      member do
        get "resources"
        get "show_details"
      end
    end
    root 'home#index'

  end
  root 'landpage#index'
  
end
