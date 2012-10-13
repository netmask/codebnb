# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :reservation do
    user nil
    venue nil
    status "MyString"
    period nil
  end
end
