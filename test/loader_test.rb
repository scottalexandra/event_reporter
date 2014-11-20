require_relative 'test_defaults'
require_relative '../lib/loader'

class LoaderTest < Minitest::Test

  def test_loading_default_file
    file = Loader.new
    assert 'data/event_attendees.csv', file
  end
