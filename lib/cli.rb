require_relative 'display'
require_relative 'evaluate_input'
require_relative 'entry_repo'
require_relative 'queue_manager'
require_relative 'loader'
require 'pry'
require 'pry-byebug'

class Cli
  attr_reader :instream,
              :outstream,
              :display,
              :user_input,
              :queue

  def initialize(instream, outstream)
    @instream = instream
    @outstream = outstream
    @user_input = ''
    @queue = QueueManager.new
  end

  def start
    outstream.puts Display.welcome
    outstream.puts Display.root_menu
    loop do
      outstream.puts Display.command_prompt
      user_input = instream.gets.strip
      eval_input = EvaluateInput.new(user_input)
      break if eval_input.quit?
      process_initial_commands(eval_input)
    end
    outstream.puts Display.quitting
  end

  def process_initial_commands(eval_input)
    if eval_input.help_menu?
      outstream.puts Display.help_menu
    elsif eval_input.help_load?
      outstream.puts Display.help_load

    elsif eval_input.help_queue_count?
      outstream.puts Display.help_queue_count

    elsif eval_input.help_queue_clear?
      outstream.puts Display.help_queue_clear

    elsif eval_input.help_queue_print?
      outstream.puts Display.help_queue_print

    elsif eval_input.help_queue_save_to?
      outstream.puts Display.help_queue_save_to

    elsif eval_input.help_find?
      outstream.puts Display.help_find

    elsif eval_input.root_menu?
      outstream.puts Display.root_menu

    elsif
      process_program_commands(eval_input)
    end
  end

  def process_program_commands(eval_input)
    if eval_input.load?
      filename = eval_input.return_attribute
      contents = Loader.create_entries_from(filename)
      @attendees = EntryRepo.new(contents)
      outstream.puts Display.load_file

    elsif eval_input.queue_count?
      outstream.puts Display.count("#{queue.count}")

    elsif eval_input.queue_clear?
      queue.clear
      outstream.puts Display.clear

    elsif eval_input.queue_print?
      attribute = eval_input.return_attribute
      queue.print_out_queue(attribute)

    elsif eval_input.find?
      eval_input.return_find_by_criteria
      attribute = eval_input.attribute
      criteria = eval_input.criteria
      new_queue = @attendees.find_attribute_criteria(attribute, criteria)
      queue.add_queue(new_queue)
      outstream.puts Display.placed_in_queue

    end
  end
end
