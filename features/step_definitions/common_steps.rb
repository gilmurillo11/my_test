Given /^I am a new user and create a new account$/ do
  goToProfile
  new_user = User.new(email: "")
  new_user.createAccount
  expect(page).to have_text("About You")
end

When /^I see my account page$/ do
  about_you = ["About You","First Name","Last Name","Email","Birthday","Change Your Password"]
  about_you.each do |text|
    expect(page).to have_text(text.upcase)
  end
end

Then /^I log out$/ do
  visit @base_path + "/logout"
end


Given /^I am on the home page$/ do
  visit @base_path_auth
  closePopup
end

When /^I go to the profile page$/ do
  find('//*[@id="nav-mount"]/div/nav/a[3]').click if @desktop
end

Then /^I decide not to create a new account$/ do
  find(:id, 'at-signup-link').click
  click_link("Nevermind, go back.") if @desktop
  expect("Been Around?")
end


