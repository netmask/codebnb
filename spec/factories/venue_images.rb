# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :venue_image do
    resource "MyString"
    venue_id nil
  end
end
