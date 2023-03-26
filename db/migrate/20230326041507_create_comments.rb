class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      # t.referencesは、article_idというinteger型カラムとそのインデックス、articlesのidカラムを指す外部キー制約を設定
      t.references :article, null: false, foreign_key: true

      t.timestamps
    end
  end
end
