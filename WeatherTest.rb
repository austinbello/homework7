require 'minitest/pride'
require 'minitest/autorun'
require './Weather.rb'

class WeatherTest < Minitest::Test
  def test_initialize
    Weather.new(zip_code: 27703)
  end

  def test_error
    a = Weather.new(zip_code: 123)
    assert a.error=="No cities match your search query"
  end

  def test_data
    a = Weather.new(zip_code: 27703)
    assert a.data('local_tz_short')=="EDT"
  end
end
