GeocodeJob = Struct.new(:schools) do
  def perform
    schools.each do |s|
      ss = School.find(s)
      ss.geocode
      ss.save
      sleep 1
    end
  end
end