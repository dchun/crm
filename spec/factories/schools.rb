# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :school do
    name "MyString"
    state_rank 1
    national_rank 1
    college_readiness_score 1.5
    tested_ap_ib 1.5
    pass_ap_ib 1.5
    math_score 1.5
    math_proficient 1.5
    math_not_proficient 1.5
    reading_score 1.5
    reading_proficient 1.5
    reading_not_proficient 1.5
    student_teacher_ratio "MyString"
    street_address "MyString"
    city "MyString"
    state "MyString"
    zip "MyString"
    latitude 1.5
    longitude 1.5
    total_enrollment 1
    total_economically_disadvantaged 1.5
    receives_title_i_funding false
    ap_student_performance_participation_rate 1.5
    ap_student_performance_participant_passing_rate 1.5
    ap_student_performance_exam_per_test_taker 1.5
    ap_student_performance_exam_pass_rate 1.5
    district nil
  end
end
