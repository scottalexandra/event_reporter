class EvaluateInput
  attr_accessor :user_input, :attribute, :criteria

  def initialize(user_input)
    @user_input = user_input.downcase
    @attribute = ''
    @criteria = ''
  end

  def return_attribute
    user_input.split[-1] if user_input.split.count > 2
  end

  def return_find_by_criteria
    if user_input.split.count > 4
      results = user_input.split[1..-1]
      @attribute = results[0]
      @criteria = results[1..-1].join(" ")
    elsif user_input.split.count == 3
      results = user_input.split[-2..-1]
      @attribute = results[-2]
      @criteria = results[-1]
    elsif user_input.split.count == 4
      results = user_input.split[-3..-1]
      @attribute = results[0..1].join('_')
      @criteria = results[2]
    end
  end

  def quit?
    user_input == 'q' || user_input == 'quit'
  end

  def root_menu?
    user_input == 'm' || user_input == 'main menu'
  end

  def help_menu?
    user_input == 'h' || user_input == 'help'
  end

  def help_load?
    user_input == 'help load'
  end

  def help_queue_count?
    user_input == 'help queue count'
  end

  def help_queue_clear?
    user_input == 'help queue clear'
  end

  def help_queue_print?
    user_input == 'help queue print'
  end

  def help_queue_save_to?
    user_input == 'help queue save to'
  end

  def help_find?
    user_input == 'help find'
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
    user_input.include?('queue save to')
  end

  def find?
    user_input.split[0] == ('find')
  end
end
