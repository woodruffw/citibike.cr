require "json"

module CitiBike
  # Wraps a list of `Region`s. Regions contain both an identifier and a human-friendly name.
  struct SystemRegions
    # Represents an individual region in the Citi Bike system.
    struct Region
      JSON.mapping(
        region_id: String,
        name: String,
      )
    end

    JSON.mapping(
      regions: Array(Region)
    )
  end
end
