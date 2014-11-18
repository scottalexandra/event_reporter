require_relative 'test_defaults'
require_relative '../lib/loader'

class LoaderTest < Minitest::Test

  def test_loading_default_file
    file = Loader.new
    assert 'data/event_attendees.csv', file
  end

  def test_saved_queue_file
    file = Loader.new#('./data/fake_data.csv')
    assert 'data/fake_data.csv', file
  end
end
