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

  def queue_save_to(_filename)
    CSV.open('filename', 'w') do |csv|
      csv << ['FIRST NAME', 'LAST NAME', 'EMAIL', 'ZIPCODE', 'CITY', 'STATE', 'ADDRESS', 'PHONE']
      new_queue.each do |entry|
        csv << entry.format_for_csv
      end
    end
  end
end
