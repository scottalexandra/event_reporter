require 'csv'
require 'pry'
class Sanitizer
  def self.clean_first_name(first_name)
    first_name.strip.downcase
  end

  def self.clean_last_name(last_name)
    last_name.strip.downcase
  end

  def self.clean_home_phone(home_phone)
    phone = home_phone.chars
    # binding.pry
    # area_code = phone[0..2].join
    # first_three = phone[3..5].join
    # last_four = phone[6..9].join
    # "(" + area_code + ")" + first_three + "-" + last_four
    home_phone.to_s.scan(/\d/).join.rjust(10, "0")[0..9]
  
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
