Rails.application.routes.draw do
  # アプリケーションのrootパスをArticlesControllerとアクションに対応づける
  root "articles#index"

  # resourcesを使うことで、リソースの集まりを対応づけるのによく使われるルーティングを全て対応づけてくれる
  # いちいち、get パス, to: コントローラ#メソッド名と書かなくて良い
  resources :articles

  # GET /articlesリクエストをArticlesControllerのindexアクションに対応づける
  # get "/articles", to: "articles#index"

  # 1件の記事のタイトルと本文を表示したい
  # GET /articles/:idをArticlesControllerのshowアクションに対応づける
  # :idは、ルーティングのパラメータで、その値をparamsと言うハッシュに保存する
  # get "/articles/:id", to: "articles#show"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
