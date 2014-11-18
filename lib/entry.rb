class Entry

<<<<<<< HEAD

  attr_reader :first_name, :last_name, :email_address, :home_phone, :street, :city, :state, :zipcode
=======
  attr_reader :first_name, :last_name, :email_address, :home_phone, :street, :city, :state, :zipcode  # => nil
>>>>>>> b392bd33ac427c78a5e39b89a08ed2f04b7a66e8

  def initialize(data)
    @first_name    = data[:first_name].to_s.downcase
    @last_name     = data[:last_name].to_s.downcase
    @home_phone    = data[:home_phone]
    @email_address = data[:email_address].to_s.downcase
    @zipcode       = data[:zipcode]
    @city          = data[:city].to_s.downcase
    @state         = data[:state].to_s.downcase
    @street        = data[:street].to_s.downcase
    @data          = Loader.create_entries_from
  end

  def name
    "#{@first_name} #{@last_name}"
  end

  def format_for_csv
<<<<<<< HEAD
    instance_variables.map do |ivar|
      instance_variable_get(ivar)
    end
  end


=======
    instance_variables.map do |ivar|
      instance_variable_get(ivar)
    end
  end
end
>>>>>>> b392bd33ac427c78a5e39b89a08ed2f04b7a66e8
