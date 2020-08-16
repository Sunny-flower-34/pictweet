class UsersController < ApplicationController
  def show
            # ログインしているユーザーの
    # @nickname = current_user.nickname
    # @tweets = current_user.tweets
    # コメント欄に表示されるユーザー名をクリックする、送られたidをparamsで取得し、そのユーザーのレコードを変数userに代入
    user = User.find(params[:id])
    @nickname = user.nickname
    @tweets = user.tweets

  end
end
