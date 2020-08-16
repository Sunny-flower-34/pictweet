class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :show]
  # before_action :move_to_index, except: [:index, :show, :search]

  # ツイート一覧
  def index
    # インスタンス = モデル名.all.order("並び替えの基準となるカラム名 並び順")
    @tweets = Tweet.includes(:user).order("created_at DESC")
  end

  # 新規投稿
  def new
    @tweet = Tweet.new
  end

  # 投稿が完了しました
  def create
    # binding.pry
    Tweet.create(tweet_params)
  end

  # 　削除しました
  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
  end
  # 編集ページ
  def edit
    # @tweet = Tweet.find(params[:id])
  end
  # 更新
  def update
    tweet = Tweet.find(params[:id])
    tweet.update(tweet_params)
  end
  # ツイート詳細画面
  def show
    # @tweet = Tweet.find(params[:id])
    @comment = Comment.new
    @comments = @tweet.comments.includes(:user)
  end

  def search
    @tweets = Tweet.search(params[:keyword])
    respond_to do |format|
      format.html
      format.json
    end
  end

  private
  # 投稿時に保存
  def tweet_params
    params.require(:tweet).permit(:image, :text).merge(user_id: current_user.id)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
  
  def move_to_index
    redirect_to action: :index unless user_signed_in?
    # 先にuser_signed_in?で判定をして、その返り値がfalseだった場合に手前の式を実行する
    # ユーザーがログインしていない場合にはindexアクションが実行
  end
end