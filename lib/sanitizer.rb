require 'csv'

class Sanitizer

  def clean_first_name(first_name)
    first_name.strip.downcase
  end

  def clean_last_name(last_name)
    last_name.strip.downcase
  end

  def clean_home_phone(home_phone)
    home_phone.to_s.scan(/\S+[\s]\d+[\D]\d{4}/).join.rjust(14, "0")[0..14]
  end

  def clean_city(city)
    city.to_s.strip.split.map(&:downcase)*' '
  end

  def clean_state(state)
    state.to_s.strip.downcase[0..1]
  end

  def clean_zipcode(zipcode)
    zipcode.to_s.rjust(5, "0")[0..4]
  end

end
