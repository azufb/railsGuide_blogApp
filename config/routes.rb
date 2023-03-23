Rails.application.routes.draw do
  # アプリケーションのrootパスをArticlesControllerとアクションに対応づける
  root "articles#index"
  
  # GET /articlesリクエストをArticlesControllerのindexアクションに対応づける
  get "/articles", to: "articles#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
