require_relative 'test_defaults'
require_relative '../lib/entry_repo'

class EntryRepoTest < Minitest::Test

   def test_search_by_last_name
    entries = [
      { first_name: 'allison', last_name: 'nguyen', home_phone: '615.438.5000' },
      { first_name: 'sarah', last_name: 'nguyen', home_phone: '414.520.5000' },
      { first_name: 'jennifer', last_name: 'cope', home_phone: '704.813.3000' }
    ]

    repository = EntryRepo.new(entries)
    entries = repository.search_by_last_name("nguyen").sort_by { |e| e.first_name }
    assert_equal 2, entries.length

    allison, sarah = entries

    assert_equal "allison nguyen", allison.name
    assert_equal "615.438.5000", allison.home_phone
    assert_equal "sarah nguyen", sarah.name
    assert_equal "414.520.5000", sarah.home_phone
    # assert_equal "jennifer cope", jennifer.name
    # assert_equal "704.813.3000", jennifer.home_phone
  end

  def test_search_by_first_name

   entries = [
     { first_name: 'allison', last_name: 'nguyen', home_phone: '615.438.5000' },
     { first_name: 'allison', last_name: 'hankins', home_phone: '414.520.5000' },
     { first_name: 'jennifer', last_name: 'cope', home_phone: '704.813.3000' }
   ]

   repository = EntryRepo.new(entries)
   entries = repository.search_by_first_name("allison").sort_by { |e| e.last_name }
   assert_equal 2, entries.length

   allison1, allison2  = entries

   assert_equal "allison nguyen", allison2.name
   assert_equal "615.438.5000", allison2.home_phone
   assert_equal "allison hankins", allison1.name
   assert_equal "414.520.5000", allison1.home_phone
  #  assert_equal "jennifer cope", jennifer.name
  #  assert_equal "704.813.3000", jennifer.phone_number
 end

  def test_search_by_home_phone
    entries = [
    { first_name: 'allison', last_name: 'nguyen', home_phone: '615.438.5000' },
    { first_name: 'sarah', last_name: 'nguyen', home_phone: '414.520.5000' },
    { first_name: 'jennifer', last_name: 'cope', home_phone: '704.813.3000' }
    ]

    repository = EntryRepo.new(entries)
    entries = repository.search_by_home_phone("615.438.5000").sort_by { |e| e.home_phone }
    assert_equal 1, entries.length
  end

  def test_search_by_zip_code
    entries = [
      { zipcode: '80023' },
      { zipcode: '80027' },
      { zipcode: '80029' },
      { zipcode: '80039' }
    ]

    repository = EntryRepo.new(entries)
    entries = repository.search_by_zipcode("80039").sort_by { |e| e.zipcode }
    assert_equal 1, entries.length
  end

  def test_search_by_email_address
    entries = [
      { email_address: 'manny@tothemoon.com' },
      { email_address: 'shawni18@aol.com' },
      { email_address: 'dude@compulink.com' }
    ]

    repository = EntryRepo.new(entries)
    entries = repository.search_by_email_address("shawni18@aol.com").sort_by { |e| e.email_address }
    assert_equal 1, entries.length
  end

  def test_search_by_city
    entries = [
      { city: 'new york' },
      { city: 'san francisco'},
      { city: 'San Diego' },
      { city: 'Denver' }
    ]

    repository = EntryRepo.new(entries)
    entries = repository.search_by_city("san diego").sort_by { |e| e.city }
    assert_equal 1, entries.length
  end

  def test_search_by_state
    entries = [
      { state: 'california' },
      { state: 'north dakota'},
      { state: 'hawaii' }
    ]

    repository = EntryRepo.new(entries)
    entries = repository.search_by_state("hawaii").sort_by { |e| e.state }
    assert_equal 1, entries.length
  end

  def test_search_by_street
    entries = [
      { street: '1615 Hill Top ln.'},
      { street: '121 Faxon Dr.'},
      { street: '24th Ave. Unit 1'}
    ]

    repository = EntryRepo.new(entries)
    entries = repository.search_by_street("1615 hill top ln.").sort_by { |e| e.street}
    assert_equal 1, entries.length
  end
end
