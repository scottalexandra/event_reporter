require "csv"

class Loader

  def load_default_file(path = "event_attendees.csv")
    path = path('./data/event_attendees.csv')
    contents = CSV.open(path, headers: true, header_converters: :symbol)
  end

  def save_queue_file(queue, path = "saved_queue.csv")
    header = " last_name, first_name, email, zipcode, city, state, address, phone"
    path = path('./data/saved_queue.csv')
    CSV.open(path, "w") do |csv|
      csv << header.split(',')
    end
  end
end




#load the default file

#save the queue, must be able to save file with the expected header info:

  #last_name / first_name / email / zipcode / city / state / address / phone

  #user needs to be able to write - 'w' file. Method must have ability to organize,
  #"split" the header info.

  #saved queue needs to be parsed - method?




#
