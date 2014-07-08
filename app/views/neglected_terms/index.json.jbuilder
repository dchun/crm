json.array!(@neglected_terms) do |neglected_term|
  json.extract! neglected_term, :id, :exclude
  json.url neglected_term_url(neglected_term, format: :json)
end
