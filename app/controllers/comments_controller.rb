class CommentsController < ApplicationController
    # 認証された人物のみ、コメントを削除できる
    http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy

    # createアクション
    def create
        # 対象の記事をfindメソッドでデータベースから取得してインスタンス変数に格納
        @article = Article.find(params[:article_id])
        # 対象の記事に対して、コメントの作成と保存をcreateメソッドによって実行
        # createメソッドは、ArticleモデルとCommentモデルが関連付けられたことで使えるようになったメソッド
        # コメントと記事が自動的にリンクされ、記事1件に対して、コメントが従属する
        @comment = @article.comments.create(comment_params)

        # 個別の記事ページにリダイレクト
        # article_path(@article)ヘルパーによって、ArticlesControllerのshowアクションが呼び出され、show.html.erbがレンダリングされる。
        redirect_to article_path(@article)
    end

    # destrpyアクション
    def destroy
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
        @comment.destroy
        redirect_to article_path(@article), status: :see_other
    end

    private
    def comment_params
        params.require(:comment).permit(:commenter, :body, :status)
    end
end