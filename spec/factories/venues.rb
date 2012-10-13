# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :venue do
    user_id 1
    latitude 1.5
    longitude 1.5
    label "MyString"
    description "MyText"
    work_place ""
    meals ""
    internet false
    disclamer "MyText"
    mates_allowed false
    mates_quantity 1
    city nil
  end
end
