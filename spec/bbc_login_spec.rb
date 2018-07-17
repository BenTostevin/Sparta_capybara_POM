require 'spec_helper'

describe 'Testing the BBC' do
  context 'testing Login' do
    it 'should respond with success when we login with a valid email and password' do
      @bbc_site = BBC_Site.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_login.fill_email
      @bbc_site.bbc_login.fill_password
      @bbc_site.bbc_login.click_submit
    end
  end
end
