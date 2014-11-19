require_relative 'entry_repo'
#require 'CSV'



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
      puts 'FIRST NAME LAST NAME EMAIL ZIPCODE CITY STATE ADDRESS PHONE'
    new_queue.map do |entry|
      puts "#{entry.first_name}\t#{entry.last_name}\t#{entry.email_address}\t#{entry.home_phone}\t#{entry.street}\t#{entry.city}\t#{entry.state}\t#{entry.zipcode}\n\}"
    end
  end

  def sort_by(attribute)
    new_queue.sort! { |entry| entry.send(attribute) }
  end


  def queue_save_to(filename)
    CSV.open('filename', "w") do |csv|
      csv << ['FIRST NAME','LAST NAME','EMAIL','ZIPCODE','CITY','STATE','ADDRESS','PHONE']
      new_queue.each do |entry|
        csv << entry.format_for_csv
      end
    end
  end

end
