require_relative 'test_defaults'
require_relative "../lib/entry"

class EntryTest < Minitest::Test

  attr_reader :entry

  def setup
    @data = {
      first_name: 'allison',
      last_name: 'nguyen',
      email_address: 'arannon@jumpstartlab.com',
      home_phone: '6154385000',
      street: '3155 19th st nw',
      city: 'washington',
      state: 'dc',
      zipcode: '20010'
    }

    @entry = Entry.new(@data)
  end

  def test_data
    assert_equal entry.name, 'allison nguyen'
    assert_equal entry.first_name, 'allison'
    assert_equal entry.last_name, 'nguyen'
    assert_equal entry.email_address, 'arannon@jumpstartlab.com'
    assert_equal entry.home_phone, '6154385000'
    assert_equal entry.street, '3155 19th st nw'
    assert_equal entry.city, 'washington'
    assert_equal entry.state, 'dc'
    assert_equal entry.zipcode, '20010'
  end

  def test_to_csv
    assert_equal "allison," +
                 "nguyen," +
                 "arannon@jumpstartlab.com," +
                 "6154385000," +
                 "3155 19th st nw," +
                 "washington," +
                 "dc," +
                 "20010", @entry.to_csv
  end

end
