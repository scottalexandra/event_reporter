require 'csv'

class Sanitizer
  def self.clean_first_name(first_name)
    first_name.strip.downcase
  end

  def self.clean_last_name(last_name)
    last_name.strip.downcase
  end

  def self.clean_home_phone(home_phone)
    home_phone.to_s.scan(/\S+[\s]\d+[\D]\d{4}/).join.rjust(14, '0')[0..14]
  end

  def self.clean_city(city)
    city.to_s.strip.split.map(&:downcase) * ' '
  end

  def self.clean_state(state)
    state.to_s.strip.upcase[0..1]
  end

  def self.clean_zipcode(zipcode)
    zipcode.to_s.rjust(5, '0')[0..4]
  end
end
