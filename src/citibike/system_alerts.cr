require "json"

module CitiBike
  # Wraps a list of `Alert`s. Alerts can be region, system, or station based.
  struct SystemAlerts
    # Represents an alert posted about the Citi Bike system.
    struct Alert
      # Represents the lifespan of an alert.
      struct Timespan
        JSON.mapping(
          start: {type: Time, converter: Time::EpochConverter},
          end: {type: Time?, converter: Time::EpochConverter},
        )
      end

      JSON.mapping(
        alert_id: String,
        type: String,
        times: Array(Timespan),
        station_ids: Array(String)?,
        region_ids: Array(String)?,
        url: String?,
        summary: String,
        description: String?,
        last_updated: {type: Time?, converter: Time::EpochConverter},
      )
    end

    JSON.mapping(
      alerts: Array(Alert)
    )
  end
end
