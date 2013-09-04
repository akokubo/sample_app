require 'spec_helper'

# Micropostページに関する記述
describe "Micropost Pages" do

  # 対象はページ
  subject { page }

  # :userをFactoryGirl.createで生成
  let(:user) { FactoryGirl.create(:user) }
  # 事前にサインインする
  before { sign_in user }

  # Micropostの生成に関する記述
  describe "Micropost creation" do
    # 事前にroot_pathを訪問
    before { visit root_path }

    # 不正な情報が与えられた場合の記述
    describe "with invalid information" do

      # micropostを生成するべきでない
      it "should not create a micropost" do
        # "Post"ボタンをクリックすると、Micropostの数が変化しない
        expect { click_button "Post" }.not_to change(Micropost, :count)
      end
    end

    # エラーメッセージに関する記述
    describe "error messages" do
      # 事前に"Post"ボタンをクリック
      before { click_button "Post" }
      # 'error'という内容が表示されている
      it { should have_content('error') }
    end

    # 適正な情報が与えられた場合の記述
    describe "with valid information" do
      # micropost_contentに"Lorem ipsum"と事前に入力
      before { fill_in 'micropost_content', with: "Lorem ipsum" }
      # micropostを生成するべき
      it "should create a micropost" do
        # "Post"ボタンをクリックすると、Micropostの個数が1つ増える
        expect { click_button "Post" }.to change(Micropost, :count).by(1)
      end
    end

  end


end
