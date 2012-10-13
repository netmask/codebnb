Then /^I should see the home screen map with my current position$/ do
  find('venues_map')
end

Then /^I fill the "(.*?)" form with:$/ do |form, rows|
  rows.raw.each do |row|
    fill_in(row[0], with: row[1])
  end
end

Then /^I press "(.*?)"$/ do |button|
  click_button button
end

Then /^I should see "(.*?)"$/ do |content|
  have_content content
end

Given /^The following "(.*?)" exist:$/ do |model, attrs|
  attrs.hashes.each do |model_attrs|
    FactoryGirl.create model.singularize.downcase, model_attrs
  end
end

Then /^I should see a list of my "(.*?)" venues$/ do |qty|
  page.should have_selector('div.venue', :count => qty)
end

Then /^show me the page$/ do
  save_and_open_page
end
