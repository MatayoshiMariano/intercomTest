module Distance

  # Earth's radius in KM.
  EARTH_RADIUS = 6371.0

  class << self

    def between(point1:, point2:)
      point1 = extract_coordinates(point1)
      point2 = extract_coordinates(point2)

      lat1, long1 = to_radians(point1)
      lat2, long2 = to_radians(point2)

      delta_lat = lat2 - lat1
      delta_lon = long2 - long1

      a = (Math.sin(delta_lat / 2))**2 + Math.cos(lat1) * (Math.sin(delta_lon / 2))**2 * Math.cos(lat2)
      c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a))
      c * EARTH_RADIUS
    end

    def to_radians(*args)
      args = args.first if args.first.is_a?(Array)
      if args.size == 1
        args.first * (Math::PI / 180)
      else
        args.map { |i| to_radians(i) }
      end
    end

    def extract_coordinates(point)
      raise "The point must be an array with 2 elements" if point.size != 2
      lat, lon = point
      raise "The coordiantes must be a float" if !(!lat.nil? && lat.respond_to?(:to_f) && !lon.nil? && lon.respond_to?(:to_f))
      [lat.to_f, lon.to_f]
    end

  end

end
