require_relative 'entry_repo'
require 'table_print'

class QueueManager
  attr_accessor :new_queue

  def initialize
    @new_queue = []
  end

  def clear
    @new_queue = []
  end

  def count
    new_queue.count
  end

  def add_queue(queue)
    new_queue << queue
    new_queue.flatten!
  end

  def print_out_queue(attribute = nil)
    sort_by(attribute) if attribute
    tp new_queue
  end

  def sort_by(attribute)
    new_queue.sort! { |entry| entry.send(attribute) }
  end

  # def queue_save_to(_filename)
  #   CSV.open('filename', 'w') do |csv|
  #     csv << ['FIRST NAME', 'LAST NAME', 'EMAIL', 'ZIPCODE', 'CITY', 'STATE', 'ADDRESS', 'PHONE']
  #     new_queue.each do |entry|
  #       csv << format_for_csv
  #     end
  #   end
  # end
  #
  # def format_for_csv
  #   instance_variables.map do |ivar|
  #     instance_variable_get(ivar)
  #   end
  # end

  def queue_save_to(file)
    CSV.open("data/#{file}", 'w') do |csv|
      column_names = %w( first_name last_name email_address home_phone street city state zipcode )
      csv << column_names
      new_queue.each do |result|
        csv << column_names.collect { |col| result.send(col) }
      end
    end
  end
end
