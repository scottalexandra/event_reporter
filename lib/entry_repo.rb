require_relative 'entry'
require_relative 'loader'

class EntryRepo
  attr_reader :entries
  def initialize(entries)
    @entries = entries
  end

  def search_by_last_name(last_name)
    entries.select { |entry| entry.last_name == last_name }
  end

  def search_by_first_name(first_name)
    entries.select { |entry| entry.first_name == first_name }
  end

  def search_by_home_phone(home_phone)
    entries.select { |entry| entry.home_phone == home_phone }
  end

  def search_by_email_address(email_address)
    entries.select { |entry| entry.email_address == email_address }
  end

  def search_by_zipcode(zipcode)
    entries.select { |entry| entry.zipcode == zipcode }
  end

  def search_by_city(city)
    entries.select { |entry| entry.city == city }
  end

  def search_by_state(state)
    entries.select { |entry| entry.state == state }
  end

  def search_by_street(street)
    entries.select { |entry| entry.street == street }
  end

  def find_attribute_criteria(attribute, criteria)
    case attribute
    when 'first_name'
      search_by_first_name(criteria)
    when 'last_name'
      search_by_last_name(criteria)
    when 'home_phone'
      search_by_home_phone(criteria)
    when 'email_address'
      search_by_email_address(criteria)
    when 'zipcode'
      search_by_zipcode(criteria)
    when 'city'
      search_by_city(criteria)
    when 'state'
      search_by_state(criteria)
    when 'street'
      search_by_street(criteria)
    end
  end
end
