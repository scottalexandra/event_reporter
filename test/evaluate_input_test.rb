gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/evaluate_input'
require_relative 'test_defaults'

class EvaluateInputTest < Minitest::Test

  def test_quit?
    help = EvaluateInput.new("q")
    assert help.quit?
  end

  def test_help_menu?
    help = EvaluateInput.new('help')
    assert help.help_menu?
  end

  def test_load?
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
end
