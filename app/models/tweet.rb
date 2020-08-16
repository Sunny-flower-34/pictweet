class Tweet < ApplicationRecord
  validates :text, presence: true
  # 1つの投稿は、1人のユーザーが投稿したもの
  # 1対1」のつながりがあることを示すのがbelongs_toメソッド
  belongs_to :user
  #ツイートは複数のコメントを所有できるので
  has_many :comments  # commentsテーブルとのアソシエーション

  # def self.search(search)
  #   return Tweet.all unless search
  #   Tweet.where('text LIKE(?)', "%#{search}%")
  # end

  def self.search(search)
    if search
      Tweet.where('text LIKE(?)', "%#{search}%")
    else
      Tweet.all
    end
  end
end
