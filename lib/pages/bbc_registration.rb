require 'capybara/dsl'

class BBC_Registration
  include Capybara::DSL

  # Constants
  REGISTRATION_SUBMIT = '#submit-button'

  def click_over_13
    click_link('13 or over')
  end

  def date_of_birth
    fill_in('Day', with: '16')
    fill_in('Month', with: '11')
    fill_in('Year', with: '1993')
  end

  def click_dob_button
    click_button 'Continue'
  end

  def enter_email
    fill_in('Email', with: 'ffm61779@molms.com')
  end

  def enter_password
    fill_in('Password', with: 'SecurePassword1!')
  end

  def enter_postcode
    fill_in('Postcode', with: 'TW10 6TF')
  end

  def enter_gender
    select 'Male', from: 'gender'
  end

  def choose_email_updtaes
    all('.button__text-wrapper')[0].click
  end

  def click_register
    find(REGISTRATION_SUBMIT).click
    sleep 1
  end

  def check_registered
    has_content?("You're now signed in")
  end

  def check_registered_again
    page.find('title').text
  end

end
