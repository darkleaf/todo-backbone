TodoBackbone::Application.routes.draw do
  root to: 'welcome#show'
  resources :tasks
end
