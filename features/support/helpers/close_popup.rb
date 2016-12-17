def closePopup
  find('//*[@id="exit-desktop"]').click if page.has_xpath?('//*[@id="exit-desktop"]') && @desktop
end
