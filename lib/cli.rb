require_relative 'display'
require_relative 'evaluate_input'
require_relative 'entry_repo'
require_relative 'queue_manager'
require_relative 'loader'

class Cli
  attr_reader :instream,
              :outstream,
              :display
              :user_input


  def initialize(instream, outstream)
    @instream = instream
    @outstream = outstream
    @user_input = ""
  end

  def start
    outstream.puts Display.welcome
    outstream.puts Display.root_menu
    loop do
      outstream.puts Display.command_prompt
      user_input = instream.gets.strip
      eval_input = EvaluateInput.new(user_input)
      break if eval_input.quit?
      proccess_commands(eval_input)
    end
    outstream.puts Display.quitting
  end

  def process_commands(eval_input)
    if eval_input.help_menu?
      outstream.puts Display.help_menu
      process_help_commands(eval_input)
    end
  end

  def proccess_help_commands(eval_input)
    if eval_input.help_load?
      outstream.puts Display.help_load
    elsif eval_input.help_queue_count?
      outstream.puts Display.help_queue_count
    elsif eval_input.help_queue_clear?
      outstream.puts Display.help_queue_clear
    elsif eval_input.help_queue_print?
      outstream.puts Display.help_queue_print
    elsif eval_input.help_queue_save_to?
      outstream.puts Display.help_queue_save_to
    elsif eval_input.help_find_by?
      outstream.puts Display.help_find_by
    elsif eval_input.root_menu?
      outstream.puts Display.root_menu
    else
      outstream.puts Display.invalid_input
    end
  end




end

Cli.new($stdin, $stdout).start
