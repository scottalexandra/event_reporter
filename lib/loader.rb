require 'csv'
require_relative 'entry'
# require_relative 'sanitizer'
class Loader
  attr_reader :contents

  def self.create_entries_from(filename)
    filename = 'event_attendees.csv' if filename.nil?
    filepath = File.join(__dir__, '..', 'data', filename)

    csv = CSV.open(filepath, headers: true, header_converters: :symbol)
    contents = csv.collect { |row| Entry.new(row) }
  end
end
