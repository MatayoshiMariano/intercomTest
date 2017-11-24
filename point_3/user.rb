require_relative './distance'

class User

  attr_reader :id, :coordinates, :name

  def initialize(params:)
    @id, @name = params.fetch("user_id"), params.fetch("name")
    latitude, longitude = params.fetch("latitude"), params.fetch("longitude")
    @coordinates = [latitude, longitude]
  end

  def invite_to?(point:, max_distance:)
    Distance.between(point1: point, point2: self.coordinates) < max_distance
  end

end
