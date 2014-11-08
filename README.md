## DHL Express :package:
[![Gem Version](https://badge.fury.io/rb/dhl_express.svg)](http://badge.fury.io/rb/dhl_express) [![Build Status](https://travis-ci.org/SebastianSzturo/dhl_express.svg?branch=master)](https://travis-ci.org/SebastianSzturo/dhl_express) [![Code Climate](https://codeclimate.com/github/SebastianSzturo/dhl_express/badges/gpa.svg)](https://codeclimate.com/github/SebastianSzturo/dhl_express)

A gem to track international DHL Express packages without the DHL SOAP/XML API.

## Requirements
-  Ruby 1.9

## Installation

Add this to your gemfile

```ruby
gem 'dhl_express'
```

and

```
bundle
```

## Tracking :round_pushpin:

Track a package with it's waybill tracking number.

```ruby
package = DhlExpress::Tracking.new("123456789")
```

Access tracking information.

```ruby
package = DhlExpress::Tracking.new("123456789")

package.origin # e.g. "TOKYO - TOKYO - JAPAN"
package.destination # e.g. "GREENSBORO, NC - GREENSBORO - USA" 
package.status # e.g. String of current history status point

package.history # Array of package movement history in chronological order
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
