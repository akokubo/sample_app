require 'spec_helper'

describe "StaticPages" do

  # テストの主題がpageであると宣言。
  # これによりexpect(page).toと書かなくても対象がpageとわかるようになる。
  subject { page }

  # すべてのページに共通するテスト
  shared_examples_for "all static pages" do
    # それはSample Appという内容を持っている
    it { should have_content(heading) }
    # full_titleヘルパーによりベース・タイトルを表示しているかをテスト
    it { should have_title(full_title(page_title)) }
  end

  # Homeページに対するテスト
  describe "Home Page" do
    # 実行前にroot_pathを訪問
    before { visit root_path }
    let(:heading)    { 'Sample App' }
    let(:page_title) { '' }

    # shared_examplesによるテスト
    it_should_behave_like "all static pages"
    # full_titleヘルパーによりタイトルにサフィックスが含まれていないことをテスト
    it { should_not have_title('| Home')}
  end
  
  describe "Help page" do
    before { visit help_path }
    let(:heading)    { 'Help' }
    let(:page_title) { 'Help' }

    # shared_examplesによるテスト
    it_should_behave_like "all static pages"
  end

  describe "About page" do
    before { visit about_path }
    let(:heading)    { 'About' }
    let(:page_title) { 'About' }

    # shared_examplesによるテスト
    it_should_behave_like "all static pages"
  end

  describe "Contact page" do
    before { visit contact_path }
    let(:heading)    { 'Contact' }
    let(:page_title) { 'Contact' }

    # shared_examplesによるテスト
    it_should_behave_like "all static pages"
  end
end
