class User
  include Capybara::DSL
  include RSpec::Matchers

  def initialize(p = {})
    @new_email = p[:email] || ""
    @new_password = p[:password] || "password"
  end

  def createRandomEmail
    new_email = "refauto" + rand.to_s[2..9] + "@example.com" #create one random account
    @new_email = new_email
  end

  def createAccount
    createRandomEmail if @new_email == ""
    puts @new_email

    find('//*[@id="at-signup-link"]').click
    expect(page).to have_selector(:id, '[email]-field')
    fill_in('[email]-field', :with => @new_email)
    expect(page).to have_selector(:id, 'password-field')
    fill_in('[password]-field', :with => @new_password)
    expect(page).to have_selector(:id, 'password_confirmation-field')
    fill_in('[password_confirmation]-field', :with => @new_password)
    expect(page).to have_text("Text".upcase)
    find(:id, 'join-button').click
  end
end
