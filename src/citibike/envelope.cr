require "json"

module CitiBike
  # Represents the wrapper object for all GBFS responses.
  struct Envelope(T)
    JSON.mapping(
      last_updated: {type: Time, converter: Time::EpochConverter},
      ttl: UInt32,
      data: T,
    )

    # Whether or not this object is stale, i.e. has existed for longer than
    # `last_updated` + `ttl` seconds.
    def stale?
      (last_updated + Time::Span.new(seconds: ttl, nanoseconds: 0)) >= Time.now
    end
  end
end
