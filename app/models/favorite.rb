class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :book

  # 同じuser_idとbook_idの組み合わせが存在しないように
  validates_uniqueness_of :book_id, scope: :user_id
end
