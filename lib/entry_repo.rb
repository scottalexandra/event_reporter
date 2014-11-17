require_relative 'entry'

class EntryRepo
  attr_reader :entries
  def initialize(entries)
    @entries ||= entries.map { |entry| Entry.new(entry) }
  end

  def search_by_last_name(last_name)
    entries.select { |entry| entry.last_name == last_name }
  end

  def search_by_first_name(first_name)
    entries.select { |entry| entry.first_name == first_name}
  end

  def search_by_home_phone(home_phone)
    entries.select { |entry| entry.home_phone == home_phone}
  end

  def search_by_email_address(email_address)
    entries.select { |entry| entry.email_address == email_address}
  end

  def search_by_zipcode(zipcode)
    entries.select { |entry| entry.zipcode == zipcode}
  end

  def search_by_city(city)
    entries.select { |entry| entry.city == city}
  end

  def search_by_state(state)
    entries.select { |entry| entry.state == state}
  end

  def search_by_street(street)
    entries.select { |entry| entry.street == street}
  end
end
