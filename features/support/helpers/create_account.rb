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
    expect(page).to have_selector(:id, 'at-spree_user[email]-field')
    fill_in('at-spree_user[email]-field', :with => @new_email)
    expect(page).to have_selector(:id, 'at-spree_user[password]-field')
    fill_in('at-spree_user[password]-field', :with => @new_password)
    expect(page).to have_selector(:id, 'at-spree_user[password_confirmation]-field')
    fill_in('at-spree_user[password_confirmation]-field', :with => @new_password)
    expect(page).to have_text("Get in on top secret Ref news".upcase)
    find(:id, 'join-button').click
  end
end
