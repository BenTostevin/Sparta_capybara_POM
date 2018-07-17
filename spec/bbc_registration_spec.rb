require 'spec_helper'

describe 'Testing the BBC Registration' do

  context 'initial user journey signing up' do

    xit 'should take us through the correct sign up registration process with valid details' do
      @bbc_site = BBC_Site.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_homepage.click_go_to_register

      @bbc_site.bbc_registration.click_over_13
      @bbc_site.bbc_registration.date_of_birth
      @bbc_site.bbc_registration.click_dob_button
      @bbc_site.bbc_registration.enter_email
      @bbc_site.bbc_registration.enter_password
      @bbc_site.bbc_registration.enter_postcode
      @bbc_site.bbc_registration.enter_gender
      @bbc_site.bbc_registration.choose_email_updtaes
      @bbc_site.bbc_registration.click_register

      expect(@bbc_site.bbc_registration.check_registered).to be true
      # expect(@bbc_site.bbc_registration.check_registered_again).to 'BBC - Register - thank you'
    end    

  end

end
