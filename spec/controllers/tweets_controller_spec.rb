require 'rails_helper'

describe TweetsController do
  describe 'GET #new' do
    # newアクションが動いたあとnew.html.erbに遷移するか
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  # edit
  describe 'GET #edit' do
    # アクション内で定義されているインスタンス変数の値が期待したものになるか
    it "assigns the requested tweet to @tweet" do
      tweet = create(:tweet)
      get :edit, params: { id: tweet }
      expect(assigns(:tweet)).to eq tweet
    end

    it "renders the :edit template" do
      # 期待したビューに遷移するか
      tweet = create(:tweet)
      get :edit, params: { id: tweet }
      expect(response).to render_template :edit
    end
  end
  # index
  describe 'GET #index' do
    it "populates an array of tweets ordered by created_at DESC" do
      tweets = create_list(:tweet, 3) 
      get :index
      expect(assigns(:tweets)).to match(tweets.sort{ |a, b| b.created_at <=> a.created_at } )
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end
end
