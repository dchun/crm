json.array!(@acceptable_contact_positions) do |acceptable_contact_position|
  json.extract! acceptable_contact_position, :id, :position
  json.url acceptable_contact_position_url(acceptable_contact_position, format: :json)
end
