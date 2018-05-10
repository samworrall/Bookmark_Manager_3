def visit_and_add_bookmark
  visit('/')
  click_button 'Add bookmark'
  fill_in 'Name', with: 'Makers'
  fill_in 'Url', with: 'http://makersacademy.com'
  click_button 'Submit'
end
