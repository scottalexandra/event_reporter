require_relative 'test_defaults'
require_relative '../lib/sanitizer'

class SanitizerTest < Minitest::Test

  def test_it_cleans_first_name

    clean_data = Sanitizer.new
    assert clean_data.clean_first_name('MiGUel').include?('miguel')
  end

  def test_it_cleans_last_name

    clean_data = Sanitizer.new
    assert clean_data.clean_last_name('NavarrO').include?('navarro')
  end

  def test_it_cleans_home_phone
    skip
    clean_data = Sanitizer.new
    assert_equal '(714) 773-8089', clean_data.clean_home_phone('7147738089').include?('(714) 773-8089')
  end

  def test_it_cleans_city

    clean_data = Sanitizer.new
    assert clean_data.clean_city('San Francisco').include?('san francisco')
  end

  def test_it_cleans_state

    clean_data = Sanitizer.new
    assert clean_data.clean_state('CA').include?('ca')
  end

  def test_it_cleans_zip_code

    clean_data = Sanitizer.new
    assert clean_data.clean_zipcode('890').include?('00890')
  end
end
