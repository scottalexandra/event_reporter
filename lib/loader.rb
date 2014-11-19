require "csv"
require_relative 'entry'
class Loader

  def self.create_entries_from(filename)
    filename = "event_attendees.csv" if filename == nil

    # require 'pry'
    # binding.pry
    contents = CSV.open("../data/#{filename}", headers: true, header_converters: :symbol)
    contents.collect { |row| Entry.new(row) }
  end

end
