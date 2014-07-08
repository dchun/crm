json.array!(@equivalent_terms) do |equivalent_term|
  json.extract! equivalent_term, :id, :input, :output
  json.url equivalent_term_url(equivalent_term, format: :json)
end
