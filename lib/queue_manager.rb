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

  def print_out_queue(attribute)
    sort_by(attribute) if attribute
    new_queue.map do |entry|
      puts "#{entry.first_name}\t#{entry.last_name}\t#{entry.email}\t#{entry.phone_number}\t#{entry.street}\t#{entry.city}\t#{entry.state}\t#{entry.zipcode}\n\}"
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

def format_for_print
  "#{first_name}\t#{last_name}\t#{email_address}\t#{home_phone}\t#{street}\t#{entry.city}\t#{entry.state}\t#{zipcode}\n\}"
end
end

end
