class Entry

  attr_reader :first_name, :last_name, :email_address, :home_phone, :street, :city, :state, :zipcode  # => nil

  def initialize(data)
    @first_name    = data[:first_name].to_s.downcase
    @last_name     = data[:last_name].to_s.downcase
    @home_phone    = data[:home_phone]
    @email_address = data[:email_address].to_s.downcase
    @zipcode       = data[:zipcode]
    @city          = data[:city].to_s.downcase
    @state         = data[:state].to_s.downcase
    @street        = data[:street].to_s.downcase
  end

  def name
    "#{@first_name} #{@last_name}"
  end

  def format_for_csv
    intance_variables.map do |ivar|
      instance_variable_get(ivar)
    end
  end
end
