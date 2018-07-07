require "http/client"

require "./citibike/*"

# A simple wrapper over the NYC Citi Bike [GBFS](https://github.com/NABSA/gbfs/blob/master/gbfs.md)
# feed. Uses the feed's TTL to cache requests.
module CitiBike
  extend self

  # The base URL for all NYC Citibike GBFS requests.
  BASE_URL = "https://gbfs.citibikenyc.com/gbfs/en"

  @@system_regions : Envelope(SystemRegions)?
  @@system_information : Envelope(SystemInformation)?
  @@station_information : Envelope(StationInformation)?
  @@system_alerts : Envelope(SystemAlerts)?
  @@station_status : Envelope(StationStatus)?

  private def fetch(endpoint)
    resp = HTTP::Client.get("#{BASE_URL}/#{endpoint}.json")
    resp.body
  end

  private macro fetch_if_stale(response, klass)
    if @@{{response.id}}.nil? || @@{{response.id}}.not_nil!.stale?
      @@{{response.id}} = Envelope({{klass.id}}).from_json fetch("{{response.id}}")
    end
  end

  # Returns an `Array` of all `SystemRegions::Region`s.
  def system_regions
    fetch_if_stale system_regions, SystemRegions
    @@system_regions.not_nil!.data.regions
  end

  # Returns a `SystemInformation` containing metadata about the bikeshare.
  def system_information
    fetch_if_stale system_information, SystemInformation
    @@system_information.not_nil!.data
  end

  # Returns an `Array` of `StationInformation::Station`s.
  def station_information
    fetch_if_stale station_information, StationInformation
    @@station_information.not_nil!.data.stations
  end

  # Returns an `Array` of `SystemAlerts::Alert`s.
  def system_alerts
    fetch_if_stale system_alerts, SystemAlerts
    @@system_alerts.not_nil!.data.alerts
  end

  # Returns an `Array` of `StationStatus::Status`es.
  def station_status
    fetch_if_stale station_status, StationStatus
    @@station_status.not_nil!.data.stations
  end
end
