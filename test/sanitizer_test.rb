require_relative 'test_defaults'
require_relative '../lib/sanitizer'

class SanitizerTest < Minitest::Test

  def test_it_cleans_first_name
    assert Sanitizer.clean_first_name('MiGUel').include?('miguel')
  end

  def test_it_cleans_last_name
    assert Sanitizer.clean_last_name('NavarrO').include?('navarro')
  end

  def test_it_cleans_home_phone
    assert Sanitizer.clean_home_phone('7147738089').include?('7147738089')
  end

  def test_it_cleans_street
    assert Sanitizer.clean_street('121 faxon dr.').include?('121 faxon dr.')
  end

  def test_it_cleans_city
    assert Sanitizer.clean_city('San Francisco').include?('san francisco')
  end

  def test_it_cleans_state
    assert Sanitizer.clean_state('ca').include?('CA')
  end

  def test_it_cleans_zip_code
    assert Sanitizer.clean_zipcode('890').include?('00890')
  end
end
