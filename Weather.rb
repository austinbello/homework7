require "httparty"

class Weather
  def initialize(zip_code:)
    @zip_code = zip_code
  end

  def api_call
    HTTParty.get("http://api.wunderground.com/api/#{ENV["API_KEY"]}/conditions/q/#{@zip_code}.json")
  end

  def error
    begin
      self.api_call['response']['error']['description']
    rescue
      nil
    else
      self.api_call['response']['error']['description']
    end
  end

  def data(variable)
    self.api_call['current_observation'][variable]
  end

  def summary
    if self.error.nil?
      puts "\nWeather for #{data('display_location')['full']} (#{data('observation_time')}):\nOverall: #{data('weather')}\nTemperature: #{data('temperature_string')}\nWind: #{data('wind_string')}"
    else
      self.error
    end
  end
end
