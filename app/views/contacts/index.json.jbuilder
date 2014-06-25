json.array!(@contacts) do |contact|
  json.extract! contact, :id, :fname, :lname, :email, :salutation, :position, :role, :complete, :school_id
  json.url contact_url(contact, format: :json)
end
