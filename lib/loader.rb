require "csv"
require_relative 'entry'
class Loader

  def self.create_entries_from(filename = "event_attendees.csv")
    contents = CSV.foreach("./data/#{filename}", headers: true, header_converters: :symbol)
    contents.collect { |row| Entry.new(row) }
  end

end
