citibike.cr
===========

![license](https://raster.shields.io/badge/license-MIT%20with%20restrictions-green.png)

A simple wrapper over the NYC Citi Bike [GBFS](https://github.com/NABSA/gbfs/blob/master/gbfs.md)
feed.

Uses the feed's TTL to cache requests.

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  citibike:
    github: woodruffw/citibike.cr
```

## Usage

```crystal
require "citibike"

# play with these five methods:
CitiBike.system_regions
CitiBike.system_information
CitiBike.station_information
CitiBike.system_alerts
CitiBike.station_status
```

## Contributing

1. Fork it (<https://github.com/woodruffw/citibike/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [woodruffw](https://github.com/woodruffw) William Woodruff - creator, maintainer
