json.array!(@schools) do |school|
  json.extract! school, :id, :name, :state_rank, :national_rank, :college_readiness_score, :tested_ap_ib, :pass_ap_ib, :math_score, :math_proficient, :math_not_proficient, :reading_score, :reading_proficient, :reading_not_proficient, :student_teacher_ratio, :street_address, :city, :state, :zip, :latitude, :longitude, :total_enrollment, :total_economically_disadvantaged, :receives_title_i_funding, :ap_student_performance_participation_rate, :ap_student_performance_participant_passing_rate, :ap_student_performance_exam_per_test_taker, :ap_student_performance_exam_pass_rate, :district_id
  json.url school_url(school, format: :json)
end
