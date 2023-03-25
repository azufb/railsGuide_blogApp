# モデルとは、データを表現するためのRubyクラス
# Active Recordと言うRailsの機能を介してアプリケーションのデータベースとやり取りする

class Article < ApplicationRecord
    # validatesでバリデーション

    # titleは必須入力
    validates :title, presence: true
    # bodyは必須入力で10文字以上
    validates :body, presence: true, length: { minimum: 10 }
end
