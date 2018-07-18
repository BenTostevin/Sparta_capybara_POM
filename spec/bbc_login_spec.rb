require 'spec_helper'

describe 'Testing the BBC' do
  context 'testing Login' do
    xit 'should respond with success when we login with a valid email and password' do
      @bbc_site = BBC_Site.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_login.fill_email
      @bbc_site.bbc_login.fill_password
      @bbc_site.bbc_login.click_submit
    end

    it 'should return a message saying that there is not an email with that address if the address is not registered' do
      @bbc_site = BBC_Site.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_login.fill_unregistered_email
      @bbc_site.bbc_login.fill_password
      @bbc_site.bbc_login.click_submit
      expect(@bbc_site.bbc_login.unregistered_email).to include('Sorry, we can’t find an account with that email.')
    end

    it 'should show the right error if a password that is too short is entered' do
      @bbc_site = BBC_Site.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_login.fill_registered_email
      @bbc_site.bbc_login.fill_short_password
      @bbc_site.bbc_login.click_submit
      expect(@bbc_site.bbc_login.short_password).to include('Sorry, that password is too short.')
    end

    it 'should return the right error if the password only contains letters' do
      @bbc_site = BBC_Site.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_login.fill_registered_email
      @bbc_site.bbc_login.fill_letters_password
      @bbc_site.bbc_login.click_submit
      expect(@bbc_site.bbc_login.letters_password).to include('Please include something that isn\'t a letter.')
    end

    it 'should say that your username is incorrect if you enter an incorrect username without an @' do
      @bbc_site = BBC_Site.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_login.fill_invalid_username
      @bbc_site.bbc_login.fill_password
      @bbc_site.bbc_login.click_submit
      expect(@bbc_site.bbc_login.letters_password).to include('Sorry, we can’t find an account with that username.')
    end

    it 'should tell you that your email address does not look right if you end it in an @ without clicking submit' do
      @bbc_site = BBC_Site.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_login.fill_wrong_format_email
      @bbc_site.bbc_login.fill_password
      expect(@bbc_site.bbc_login.letters_password).to include('Sorry, that email doesn’t look right.')
    end

    it 'should tell you the password field is missing after exiting the password field without entering any characters' do
      @bbc_site = BBC_Site.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_login.fill_empty_password
      @bbc_site.bbc_login.fill_registered_email
      expect(@bbc_site.bbc_login.letters_password).to include('Something\'s missing.')
    end

  end
end
