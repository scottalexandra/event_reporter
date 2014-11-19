gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/evaluate_input'
require_relative 'test_defaults'

class EvaluateInputTest < Minitest::Test


  def test_return_attribute_returns_the_attribute
    user_input = EvaluateInput.new("queue print by zipcode")
    assert_equal "zipcode",  user_input.return_attribute
  end

  def test_return_attribute_doesnt_return_anything
    user_input = EvaluateInput.new("queue print")
    refute user_input.return_attribute
  end

  def test_return_find_by_criteria
    user_input = EvaluateInput.new("queue find by attribute criteria")
    assert_equal ["attribute","criteria"], user_input.return_find_by_criteria
  end


  def test_quit?
    help = EvaluateInput.new("q")
    assert help.quit?
  end

  def test_help_menu?
    help = EvaluateInput.new('help')
    assert help.help_menu?
  end

  def test_load_works
    help = EvaluateInput.new('load')
    assert help.help_load?
  end

  def test_help_queue_count?
    help = EvaluateInput.new('queue count')
    assert help.help_queue_count?
  end

  def test_help_queue_clear?
    help = EvaluateInput.new('help queue clear')
    assert help.help_queue_clear?
  end

  def test_help_queue_print?
    help = EvaluateInput.new('help queue print')
    assert help.help_queue_print?
  end

  def test_help_queue_save_to?
    help = EvaluateInput.new('queue save to')
    assert help.help_queue_save_to?
  end

  def test_help_find_by?
    help = EvaluateInput.new("help find by")
    assert help.help_find_by?
  end

  def test_load?
    user_input = EvaluateInput.new("load file.csv")
    assert user_input.load?
  end

  def test_queue_count?
    user_input = EvaluateInput.new("queue count")
    assert user_input.queue_count?
  end

  def test_queue_clear?
    user_input = EvaluateInput.new("queue clear")
    assert user_input.queue_clear?
  end

  def test_queue_print?
    user_input = EvaluateInput.new("queue print by")
    refute user_input.queue_print?
  end

  def test_queue_print_by
    user_input = EvaluateInput.new("queue print")
    refute user_input.queue_print_by?
  end

  def test_queue_print_by_again
    user_input = EvaluateInput.new("print by attribute")
    assert user_input.queue_print_by?
  end

  def test_queue_save_to
    user_input = EvaluateInput.new("save to attribute")
    assert user_input.queue_save_to?
  end

  def test_queue_save_to_again
    user_input = EvaluateInput.new("save attribute")
    refute user_input.queue_save_to?
  end

  def test_queue_find_by
    user_input = EvaluateInput.new("find by attribute criteria")
    assert user_input.find_by?
  end

  def test_queue_find_by_again
    user_input = EvaluateInput.new("find")
    refute user_input.find_by?
  end

end
