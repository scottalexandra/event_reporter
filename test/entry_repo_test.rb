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
   skip
   entries = [
     { first_name: 'allison', last_name: 'nguyen', phone_number: '615.438.5000' },
     { first_name: 'allison', last_name: 'hankins', phone_number: '414.520.5000' },
     { first_name: 'jennifer', last_name: 'cope', phone_number: '704.813.3000' }
   ]

   repository = EntryRepo.new(entries)
   entries = repository.search_by_first_name("allison").sort_by { |e| e.last_name }
   assert_equal 2, entries.length

   allison1, allison2  = entries

   assert_equal "allison nguyen", allison2.name
   assert_equal "615.438.5000", allison2.phone_number
   assert_equal "allison hankins", allison1.name
   assert_equal "414.520.5000", allison1.phone_number
  #  assert_equal "jennifer cope", jennifer.name
  #  assert_equal "704.813.3000", jennifer.phone_number
 end
end
