When /^I go to the home page$/ do
  visit '/'
end

When /^I follow "(.*?)"$/ do |link|
  click_link link
end

Given /^I am on the profile page$/ do
  visit profile_path
end

Given /^I am on the my venues page$/ do
  visit profile_venues_path
end
