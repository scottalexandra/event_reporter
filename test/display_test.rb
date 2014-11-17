gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/display'

class DisplayTest < Minitest::Test


  def test_Welcome_Message
    assert_equal "Welcome to Event Reporter!", Display.welcome
  end

  def test_root_menu
    assert_equal "Press 'h' for help. Press 'q' for quit.", Display.root_menu
  end

  def test_command_prompt
    assert_equal "Enter a command: ", Display.command_prompt
  end

  def test_quitting
    assert_equal "You are now exiting Event Reporter. Goodbye!", Display.quitting
  end

  def test_load
    assert_equal "NewFile loaded successfully", Display.load("NewFile")
  end

  def test_count
    assert_equal "There are 3 results in queue", Display.count(3)
  end

  def test_clear
    assert_equal "The queue has been cleared", Display.clear
  end

  def test_placed_in_queue
    assert_equal "Your search has been placed in queue", Display.placed_in_queue
  end

  def test_help_menu
    assert Display.respond_to?(:help_menu)
  end

  def test_help_load
    assert Display.respond_to?(:help_load)
  end

  def test_help_queue_count
    assert Display.respond_to?(:help_queue_count)
  end

  def test_help_queue_clear
    assert Display.respond_to?(:help_queue_clear)
  end

  def test_help_queue_print
    assert Display.respond_to?(:help_queue_print)
  end

  def test_help_queue_print_by_attribute
    assert Display.respond_to?(:help_queue_print_by_attribute)
  end

  def test_help_queue_save_to
    assert Display.respond_to?(:help_queue_save_to)
  end

  def test_help_queue_find_by_attribute_criteria
    assert Display.respond_to?(:help_queue_find_by_attribute_criteria)
  end

  def test_help_quit
    assert Display.respond_to?(:help_quit)
  end

  def test_invalid_input
    assert_equal "Input is not valid", Display.invalid_input
  end
end
