# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    latitude 1.5
    longitude 1.5
    title "MyString"
    url "MyString"
  end
end
