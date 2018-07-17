require 'capybara/dsl'

class BBC_Login
  include Capybara::DSL

  # Constants
  USERNAME_INPUT = 'username'
  DUMMY_EMAIL = 'nova.sarang@lm0k.com'
  UNREGISTERED_EMAIL = 'railsgod@spartaglobal.com'

  PASSWORD_INPUT = 'password'
  DUMMY_PASSWORD = 'Password01!'

  def fill_email
    fill_in USERNAME_INPUT, with: DUMMY_EMAIL
    sleep 1
  end

  def fill_password
    fill_in PASSWORD_INPUT, with: DUMMY_PASSWORD
    sleep 1
  end

  def click_submit
    click_button 'Sign in'
    sleep 2
  end

  def fill_unregistered_email
    fill_in USERNAME_INPUT, with: UNREGISTERED_EMAIL
    sleep 2
  end

  def unregistered_email
    page.find('.form-message__text').text
  end

end
