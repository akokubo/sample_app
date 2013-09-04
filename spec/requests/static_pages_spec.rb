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

    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum")
        FactoryGirl.create(:micropost, user: user, content: "Dolor sit amet")
        sign_in user
        visit root_path
      end

      it "should render the user's feed" do
        user.feed.each do |item|
          expect(page).to have_selector("li##{item.id}", text: item.content)
        end
      end

      describe "follower/following counts" do
        let(:other_user) { FactoryGirl.create(:user) }
        before do
          other_user.follow!(user)
          visit root_path
        end

        it { should have_link("0 following", href: following_user_path(user)) }
        it { should have_link("1 followers", href: followers_user_path(user)) }
      end
    end
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

  # リンクのテスト
  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    expect(page).to have_title(full_title('About Us'))
    click_link "Help"
    expect(page).to  have_title(full_title('Help'))
    click_link "Contact"
    expect(page).to  have_title(full_title('Contact'))
    click_link "Home"
    click_link "Sign up now!"
    expect(page).to  have_title(full_title('Sign up'))
    click_link "sample app"
    expect(page).to  have_title(full_title(''))
  end

end
