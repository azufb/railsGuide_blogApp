class Comment < ApplicationRecord
  include Visible
  
  # belongs_toは、1つのコメントが1件の記事に属していることを示す(1対1)
  belongs_to :article
end
