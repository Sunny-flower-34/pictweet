class Comment < ApplicationRecord
  # belongs_to :モデル単数形

  #コメントは一人のユーザーと一つのツイートに所属なので
  belongs_to :tweet  # tweetsテーブルとのアソシエーション
  belongs_to :user  # usersテーブルとのアソシエーション
end
