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

  # newアクション
  def new
    # newメソッドでArticleクラスのインスタンスを作成
    # データベースには保存しない
    # インスタンス化された記事は、ビューでフォームをビルドするときに使われる
    @article = Article.new
  end

  # createアクション
  def create
    # タイトルと本文を持つ新しい記事をインスタンス化
    @article = Article.new(article_params)

    # saveメソッドで、データベースを保存
    if @article.save
      # 保存に成功すると、記事のページにリダイレクト
      redirect_to @article
    else
      # 保存に失敗すると、フォームを再表示
      render :new, status: :unprocessable_entity
    end
  end

  # editアクション
  def edit
    # 対象の記事をfindメソッドで取ってきてインスタンス変数に入れる
    @article = Article.find(params[:id])
  end

  # updateアクション
  def update
    # 対象の記事をfindメソッドで取ってきてインスタンス変数に入れる
    @article = Article.find(params[:id])

    # updateメソッドで新しい内容でデータベースを保存
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # destroyアクション
  def destroy
    # 対象の記事をfindメソッドで取ってきてインスタンス変数に入れる
    @article = Article.find(params[:id])
    # destroyメソッドで削除
    @article.destroy

    # 最初の一覧ページにリダイレクト
    redirect_to root_path, status: :see_other
  end

  private
  def article_params
    # 送信されたフォームのデータはparamasハッシュに保存される
    # Strong Parametersでparamsをフィルタリング
    # ブラウザ側で勝手にフィールドを追加されてデータを上書き等されないようにするため
    # ここでフィルタリングされて、使えるパラメータは、titleとbodyのみ
    params.require(:article).permit(:title, :body, :status)
  end
end
