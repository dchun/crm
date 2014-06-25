json.array!(@districts) do |district|
  json.extract! district, :id, :state, :name, :college_readiness_score, :tested_ap, :passed_ap, :math_score, :math_proficient, :math_not_proficient, :reading_score, :reading_proficient, :reading_not_proficient
  json.url district_url(district, format: :json)
end
