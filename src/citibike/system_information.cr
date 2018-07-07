require "json"

module CitiBike
  # Represents metadata about the Citi Bike system.
  struct SystemInformation
    JSON.mapping(
      system_id: String,
      language: String,
      name: String,
      short_name: String,
      operator: String,
      url: String,
      purchase_url: String,
      start_data: String,
      phone_number: String,
      email: String,
      license_url: String,
      timezone: String,
    )
  end
end
