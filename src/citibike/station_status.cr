require "json"

module CitiBike
  # Wraps a list of `Status`es. Statuses contain information about the state of each station.
  struct StationStatus
    struct Status
      JSON.mapping(
        station_id: String,
        num_bikes_available: UInt32,
        num_ebikes_available: UInt32,
        num_bikes_disabled: UInt32,
        num_docks_available: UInt32,
        num_docks_disabled: UInt32,
        is_installed: UInt32,
        is_renting: UInt32,
        is_returning: UInt32,
        last_reported: {type: Time, converter: Time::EpochConverter},
        eightd_has_available_keys: Bool,
      )

      # Whether or not this Citi Bike station is installed.
      def installed?
        is_installed == 1
      end

      # Whether or not this Citi Bike station is currently renting bikes.
      def renting?
        is_renting == 1
      end

      # Whether or not this Citi Bike station is currently accepted returned bikes.
      #
      # NOTE: This is `true` *even if* the station is full!
      def returning?
        is_returning == 1
      end
    end

    JSON.mapping(
      stations: Array(Status)
    )
  end
end
