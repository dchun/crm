# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contact do
    fname "MyString"
    lname "MyString"
    email "MyString"
    salutation "MyString"
    position "MyString"
    role "MyString"
    complete false
    school nil
  end
end
