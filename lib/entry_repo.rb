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
end
