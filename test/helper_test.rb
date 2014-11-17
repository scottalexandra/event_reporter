gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/helper'

class HelperTest < Minitest::Test

  def test_quit?
    help = Helper.new("q")
    assert help.quit?
  end

  def test_help_menu?
    help = Helper.new('help')
    assert help.help_menu?
  end

  def test_load?
    help = Helper.new('load')
    assert help.help_load?
  end

  def test_help_queue_count?
    help = Helper.new('queue count')
    assert help.help_queue_count?
  end

  def test_help_queue_clear?
    help = Helper.new('help queue clear')
    assert help.help_queue_clear?
  end

  def test_help_queue_print?
    help = Helper.new('help queue print')
    assert help.help_queue_print?
  end

  def test_help_queue_save_to?
    help = Helper.new('queue save to')
    assert help.help_queue_save_to?
  end

  def test_help_find_by?
    help = Helper.new("queue find by")
    assert help.help_queue_find_by?
  end
end
