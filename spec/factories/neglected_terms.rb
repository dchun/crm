# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :neglected_term do
    exclude "MyString"
  end
end
