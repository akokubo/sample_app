require 'spec_helper'

describe "StaticPages" do

  # :base_titleを設定
  let(:base_title) { "Ruby on Rails Tutorial Sample App" }

  # Homeページに対するテスト
  describe "Home Page" do

    # それはSample Appという内容を持っている
    it "should have the content 'Sample App'" do
      visit '/static_pages/home'
      expect(page).to have_content('Sample App')
    end

    # タイトルに対するテスト
    it "should have the title 'Home'" do
      visit '/static_pages/home'
      expect(page).to have_title("#{base_title} | Home")
    end
  end

  # Helpページに対するテスト
  describe "Help Page" do

    # それはSample Appという内容を持っている
    it "should have the content 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_content('Help')
    end

    # タイトルに対するテスト
    it "should have the title 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_title("#{base_title} | Help")
    end
  end

  # Aboutページに対するテスト
  describe "About Page" do
    # それはAbout Usという内容を持っている
    it "should have the content 'About Us'" do
      visit '/static_pages/about'
      expect(page).to have_content('About Us')
    end

    # タイトルに対するテスト
    it "should have the title 'About Us'" do
      visit '/static_pages/about'
      expect(page).to have_title("#{base_title} | About Us")
    end
  end

  # Contactページに対するテスト
  describe "Contact Page" do
    # タイトルに対するテスト
    it "should have the title 'Contact'" do
      visit '/static_pages/contact'
      expect(page).to have_title("#{base_title} | Contact")
    end
  end
end
