# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :district do
    state "MyString"
    name "MyString"
    college_readiness_score 1.5
    tested_ap 1.5
    passed_ap 1.5
    math_score 1.5
    math_proficient 1.5
    math_not_proficient 1.5
    reading_score 1.5
    reading_proficient 1.5
    reading_not_proficient 1.5
  end
end
