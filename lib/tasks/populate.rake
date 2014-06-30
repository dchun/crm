# run the following command: rake db:populate

namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    10.times do |n|
      puts "[DEBUG] creating salutation #{n+1} of 10"
      salutation = Faker::Name.prefix
      AcceptableContactSalutation.create!( 
        salutation: salutation
      )
    end

    10.times do |n|
      puts "[DEBUG] creating position #{n+1} of 20"
      position = Faker::Name.title
      AcceptableContactPosition.create!( 
        position: position
      )
    end

    10.times do |n|
      puts "[DEBUG] creating role #{n+1} of 20"
      role = Faker::Commerce.department
      AcceptableContactRole.create!( 
        role: role
      )
    end

    100.times do |n|
      puts "[DEBUG] creating district #{n+1} of 100"
      state = Faker::Address.state
      name = Faker::Address.city
      college_readiness_score = Faker::Number.digit
      tested_ap = Faker::Number.number(2)
      passed_ap = Faker::Number.number(2)
      math_score = Faker::Number.digit
      math_proficient = Faker::Number.number(2)
      math_not_proficient = Faker::Number.number(2)
      reading_score = Faker::Number.digit
      reading_proficient = Faker::Number.number(2)
      reading_not_proficient = Faker::Number.number(2)
      District.create!( 
        state: state,
        name: name + " City",
        college_readiness_score: college_readiness_score,
        tested_ap: tested_ap,
        passed_ap: passed_ap,
        math_score: math_score,
        math_proficient: math_proficient,
        math_not_proficient: math_not_proficient,
        reading_score: reading_score,
        reading_proficient: reading_proficient,
        reading_not_proficient: reading_not_proficient
      )
    end

    100.times do |n|
      puts "[DEBUG] creating school #{n+1} of 100"
        name = Faker::Company.name
        state_rank = Faker::Number.number(2)
        national_rank = Faker::Number.number(3)
        college_readiness_score = Faker::Number.number(2)
        tested_ap_ib = Faker::Number.number(2)
        pass_ap_ib = Faker::Number.number(2)
        math_score = Faker::Number.digit
        math_proficient = Faker::Number.number(2)
        math_not_proficient = Faker::Number.number(2)
        reading_score = Faker::Number.digit
        reading_proficient = Faker::Number.number(2)
        reading_not_proficient = Faker::Number.number(2)
        student_teacher_ratio = Faker::Number.number(2)
        street_address = Faker::Address.street_address
        city = Faker::Address.city
        state = Faker::Address.state
        zip = Faker::Address.zip
        latitude = Faker::Address.latitude
        longitude = Faker::Address.longitude
        total_enrollment = Faker::Number.number(4)
        total_economically_disadvantaged = Faker::Number.number(2)
        receives_title_i_funding = Faker::Number.number(2)
        ap_student_performance_participation_rate = Faker::Number.number(2)
        ap_student_performance_participant_passing_rate = Faker::Number.number(2)
        ap_student_performance_exam_per_test_taker = Faker::Number.digit
        ap_student_performance_exam_pass_rate = Faker::Number.number(2)
        district = District.order("RANDOM()").first
      School.create!( 
        name: name,
        state_rank: state_rank,
        national_rank: national_rank,
        college_readiness_score: college_readiness_score,
        tested_ap_ib: tested_ap_ib,
        pass_ap_ib: pass_ap_ib,
        math_score: math_score,
        math_proficient: math_proficient,
        math_not_proficient: math_not_proficient,
        reading_score: reading_score,
        reading_proficient: reading_proficient,
        reading_not_proficient: reading_not_proficient,
        student_teacher_ratio: student_teacher_ratio,
        street_address: street_address,
        city: city,
        state: state,
        zip: zip,
        latitude: latitude,
        longitude: longitude,
        total_enrollment: total_enrollment,
        total_economically_disadvantaged: total_economically_disadvantaged,
        receives_title_i_funding: receives_title_i_funding,
        ap_student_performance_participation_rate: ap_student_performance_participation_rate,
        ap_student_performance_participant_passing_rate: ap_student_performance_participant_passing_rate,
        ap_student_performance_exam_per_test_taker: ap_student_performance_exam_per_test_taker,
        ap_student_performance_exam_pass_rate: ap_student_performance_exam_pass_rate,
        district_id: district.id
      )
    end

    100.times do |n|
      puts "[DEBUG] creating contact #{n+1} of 100"
        fname = Faker::Name.first_name
        lname = Faker::Name.last_name
        email = Faker::Internet.email
        url = Faker::Internet.url
        updated = "master@example.com"
        salutation = AcceptableContactSalutation.order("RANDOM()").first
        position = AcceptableContactPosition.order("RANDOM()").first
        role = AcceptableContactRole.order("RANDOM()").first
        school = School.order("RANDOM()").first
      Contact.create!( 
        fname: fname,
        lname: lname,
        email: email,
        salutation: salutation.salutation,
        position: position.position,
        role: role.role,
        school_id: school.id,
        reference_url: url,
        updated_by: updated
      )
    end

  end
end