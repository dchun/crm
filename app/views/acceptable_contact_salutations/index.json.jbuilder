json.array!(@acceptable_contact_salutations) do |acceptable_contact_salutation|
  json.extract! acceptable_contact_salutation, :id, :salutation
  json.url acceptable_contact_salutation_url(acceptable_contact_salutation, format: :json)
end
