class EvaluateInput

  attr_accessor :user_input

  def initialize(user_input)
    @user_input = user_input.downcase
  end

  def return_attribute
    user_input.split[-1] if user_input.split.count > 2
  end

  def return_find_by_criteria
    user_input.split[-2..-1] if user_input.split.count > 3
  end
  

  def quit?
    user_input == 'q' || user_input == 'quit'
  end

  def root_menu?
    user_input == 'm' || user_input == "main menu"
  end

  def help_menu?
    user_input == 'h' || user_input == 'help'
  end

  def help_load?
    user_input == 'help load' || user_input == 'load'
  end

  def help_queue_count?
    user_input == 'help queue count' || user_input == 'queue count'
  end

  def help_queue_clear?
    user_input == 'help queue clear' || user_input == 'queue clear'
  end

  def help_queue_print?
    user_input == 'help queue print' || user_input == 'queue print'
  end

  def help_queue_save_to?
    user_input == 'help queue save to' || user_input == 'queue save to'
  end

  def help_find_by?
    user_input == 'help find by' || user_input == 'find by'
  end

  def load?
    user_input.include?('load')
  end

  def queue_count?
    user_input == 'queue count'
  end

  def queue_clear?
    user_input == 'queue clear'
  end

  def queue_print?
    user_input == 'queue print'
  end

  def queue_print_by?
    user_input.include?('print by')
  end

  def queue_save_to?
    user_input.include?('save to')
  end

  def find_by?
    user_input.include?('find by')
  end
end
