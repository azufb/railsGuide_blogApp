# コントローラは、アプリケーションに対する特定のリクエストを受け取って処理する
# アクションは、リクエストを扱うために必要な処理を実行する(インスタンスメソッド)

class ArticlesController < ApplicationController
  # indexアクション
  def index
    # データベースから全ての記事を取り出す
    # @articlesはインスタンス変数で、ビューからも参照可能。
    @articles = Article.all
  end

  # showアクション
  # デフォルトで、show.html.erbをレンダリング
  def show
    # findでデータを1件取得、引数はid
    # ルーティングのパラメータとして受け取った:idが保存されているparamsから:idを取得
    @article = Article.find(params[:id])
  end
end
