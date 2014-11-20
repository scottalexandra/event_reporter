gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/cli'
require_relative "../lib/display"
require "stringio"

class CliTest < Minitest::Test
  def test_it_finds_by_zipcode
    outstream = StringIO.new
    instream = StringIO.new("load\nfind by zipcode\nquit\n")
    cli = Cli.new(instream, outstream)
    cli.start
    messages = outstream.string.split("\n")
    assert_equal Display.quitting, messages.last
    assert_equal 50, cli.queue.count
  end
end
