class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.integer :state_rank
      t.integer :national_rank
      t.float :college_readiness_score
      t.float :tested_ap_ib
      t.float :pass_ap_ib
      t.float :math_score
      t.float :math_proficient
      t.float :math_not_proficient
      t.float :reading_score
      t.float :reading_proficient
      t.float :reading_not_proficient
      t.string :student_teacher_ratio
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zip
      t.float :latitude
      t.float :longitude
      t.integer :total_enrollment
      t.float :total_economically_disadvantaged
      t.boolean :receives_title_i_funding
      t.float :ap_student_performance_participation_rate
      t.float :ap_student_performance_participant_passing_rate
      t.float :ap_student_performance_exam_per_test_taker
      t.float :ap_student_performance_exam_pass_rate
      t.belongs_to :district, index: true

      t.timestamps
    end
  end
end
