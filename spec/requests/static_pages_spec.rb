require 'spec_helper'

describe "StaticPages" do

  # :base_titleを設定
  let(:base_title) { "Ruby on Rails Tutorial Sample App" }

  # Homeページに対するテスト
  describe "Home Page" do

    # それはSample Appという内容を持っている
    it "should have the content 'Sample App'" do
      visit root_path
      expect(page).to have_content('Sample App')
    end

    # full_titleヘルパーによりベース・タイトルを表示しているかをテスト
    it "should have the base title" do
      visit root_path
      expect(page).to have_title("Ruby on Rails Tutorial Sample App")
    end

    # full_titleヘルパーによりタイトルにサフィックスが含まれていないことをテスト
    it "should not have a custom page title" do
      visit root_path
      expect(page).not_to have_title('| Home')
    end
  end

  # Helpページに対するテスト
  describe "Help Page" do

    # それはHelpという内容を持っている
    it "should have the content 'Help'" do
      visit help_path
      expect(page).to have_content('Help')
    end

    # タイトルに対するテスト
    it "should have the title 'Help'" do
      visit help_path
      expect(page).to have_title("#{base_title} | Help")
    end
  end

  # Aboutページに対するテスト
  describe "About Page" do
    # それはAbout Usという内容を持っている
    it "should have the content 'About Us'" do
      visit about_path
      expect(page).to have_content('About Us')
    end

    # タイトルに対するテスト
    it "should have the title 'About Us'" do
      visit about_path
      expect(page).to have_title("#{base_title} | About Us")
    end
  end

  # Contactページに対するテスト
  describe "Contact Page" do
    # それはContactという内容を持っている
    it "should have the content 'Contact'" do
      visit contact_path
      expect(page).to have_content('Contact')
    end

    # タイトルに対するテスト
    it "should have the title 'Contact'" do
      visit contact_path
      expect(page).to have_title("#{base_title} | Contact")
    end
  end
end
