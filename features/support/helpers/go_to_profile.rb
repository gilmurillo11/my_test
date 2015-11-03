
def goToProfile
  visit @base_path_auth
  closePopup
  step "I go to the profile page"
end