require "json"

module CitiBike
  # Wraps a list of `Station`s. Stations contain information about location, capacity,
  # and payment options.
  struct StationInformation
    # Represents an individual station in the Citi Bike system.
    struct Station
      JSON.mapping(
        station_id: String,
        name: String,
        lat: Float64,
        lon: Float64,
        region_id: UInt32,
        rental_methods: Array(String),
        capacity: UInt32,
        rental_url: String,
        eightd_has_key_dispenser: Bool,
      )
    end

    JSON.mapping(
      stations: Array(Station)
    )
  end
end
