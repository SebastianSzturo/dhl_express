require "typhoeus"
require "json"
require "chronic"

module DhlExpress
  class Tracking
    # Create a new Tracking object.
    #
    # tracking_number - tracking number of the package to lookup.
    #
    # Returns an instance of DhlExpress::Tracking.
    def initialize(tracking_number)
      raise ArgumentError unless tracking_number

      @tracking_number = tracking_number
      tracking_url = "https://www.mydhl.dhl.com/shipmentTracking?AWB=#{@tracking_number}"

      @tracking_json = JSON.parse(Typhoeus.get(tracking_url).body)
    end

    # Origin of the package
    #
    # Returns origin as String.
    def origin
      return nil if tracking_is_empty

      origin = @tracking_json["results"][0]["origin"]["value"].strip
      return origin
    end

    # Destination of the packaage
    #
    # Returns destination as String.
    def destination
      return nil if tracking_is_empty

      destination = @tracking_json["results"][0]["destination"]["value"].strip
      return destination
    end

    # Current status of the package in the history
    #
    # Returns status as String.
    def status
      return nil if tracking_is_empty

      status = @tracking_json["results"][0]["description"].strip
      return status
    end

    # History of package checkpoints in chronological order
    #
    # Returns tracking history as Array.
    def history
      return nil if tracking_is_empty

      checkpoints = @tracking_json["results"][0]["checkpoints"]

      history = []

      checkpoints.each do |checkpoint|
        date = dhl_date_string_as_date(checkpoint)
        action = checkpoint["description"].strip
        location = checkpoint["location"].strip

        history << { date: date, action: action, location: location }
      end

      history.sort_by! { |h| h[:date] }

      return history
    end

    private

    def dhl_date_string_as_date(checkpoint)
      date_string = checkpoint["date"]
      month_string_position = date_string.index(",")+2
      date_without_weekday = date_string[month_string_position...date_string.length]
      time = checkpoint["time"]

      date = Chronic.parse("#{date_without_weekday} at #{time}") rescue nil
      return date
    end

    def tracking_is_empty
      if @tracking_json["results"].nil?
        return true
      else
        return false
      end
    end

  end
end