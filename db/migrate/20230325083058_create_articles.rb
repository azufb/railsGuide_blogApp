# マイグレーションは、アプリケーションのデータベース構造を変更するときに使われる機能
# bin/rails db:migrateでマイグレーションを実行すると、モデルを介してテーブルとやり取りできる

class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    # create_tableメソッドは、articlesテーブルの構成を指定する
    create_table :articles do |t|
      # titleカラム
      t.string :title
      # bodyカラム
      t.text :body

      # created_atとupdated_atの2つのカラムを定義
      t.timestamps
    end
  end
end
