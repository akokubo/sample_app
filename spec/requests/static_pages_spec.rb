require 'spec_helper'

describe "StaticPages" do

  # :base_titleを設定
  let(:base_title) { "Ruby on Rails Tutorial Sample App" }

  # テストの主題がpageであると宣言。
  # これによりexpect(page).toと書かなくても対象がpageとわかるようになる。
  subject { page }

  # Homeページに対するテスト
  describe "Home Page" do
    # 実行前にroot_pathを訪問
    before { visit root_path }

    # それはSample Appという内容を持っている
    it { should have_content('Sample App') }
    # full_titleヘルパーによりベース・タイトルを表示しているかをテスト
    it { should have_title(full_title('')) }
    # full_titleヘルパーによりタイトルにサフィックスが含まれていないことをテスト
    it { should_not have_content('| Home')}
  end
  
  describe "Help page" do
    before { visit help_path }

    it { should have_content('Help') }
    it { should have_title(full_title('Help')) }
  end

  describe "About page" do
    before { visit about_path }

    it { should have_content('About') }
    it { should have_title(full_title('About Us')) }
  end

  describe "Contact page" do
    before { visit contact_path }

    it { should have_content('Contact') }
    it { should have_title(full_title('Contact')) }
  end
end
