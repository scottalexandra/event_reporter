require_relative 'sanitizer'

class Entry
  attr_reader :first_name, :last_name, :email_address, :home_phone, :street, :city, :state, :zipcode

  def initialize(data)
    @first_name    = Sanitizer.clean_first_name(data[:first_name])
    @last_name     = Sanitizer.clean_last_name(data[:last_name])
    @home_phone    = Sanitizer.clean_home_phone(data[:home_phone])
    @email_address = data[:email_address].to_s.downcase
    @zipcode       = Sanitizer.clean_zipcode(data[:zipcode])
    @city          = Sanitizer.clean_city(data[:city])
    @state         = Sanitizer.clean_state(data[:state])
    @street        = data[:street].to_s.downcase
  end

  # def name
  #   "#{@first_name} #{@last_name}"
  # end
  #
  #
  # end
end
