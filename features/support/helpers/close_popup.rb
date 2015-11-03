def closePopup
  find('//*[@id="first-visit-exit-desktop"]').click if page.has_xpath?('//*[@id="first-visit-exit-desktop"]') && @desktop
end
