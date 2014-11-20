require 'colorize'

module Display
  def self.welcome
    'Welcome to Event Reporter!'
  end

  def self.root_menu
    "Main Menu: Press 'h' for help. Press 'q' for quit."
  end

  def self.command_prompt
    "Enter a command (press 'm' for main menu): "
  end

  def self.quitting
    'You are now exiting Event Reporter. Goodbye!'
  end

  def self.load_file
    'File loaded successfully'
  end

  def self.count(number)
    "There are #{number} results in queue"
  end

  def self.clear
    'The queue has been cleared'
  end

  def self.placed_in_queue
    'Your search has been placed in queue'
  end

  def self.help_menu
    "Help Menu\nGet help on the following topics: \nhelp load \n"\
    "help queue count \nhelp queue clear \nhelp queue print \nhelp queue "\
    "save to \nhelp find by \n "
  end

  def self.help_load
    "Enter 'load' followed by the name of a file, to load information in the given "\
    'file to search from. If no file name is specified, information from'\
    "'event_reporter.csv' will be loaded by default."
  end

  def self.help_queue_count
    "Enter 'queue count' to return the number of entries in the current queue."
  end

  def self.help_queue_clear
    "Enter 'queue clear' to delete all entries in current queue."
  end

  def self.help_queue_print
    "Enter 'queue print' to print all entries in current queue."
    "Enter 'queue print by' followed by an attribute to print items in a queue "\
    'sorted by the given attribute.'
  end

  def self.help_queue_save_to
    "Enter 'queue_save_to' followed by the file name and extension to save items "\
    'in queue to the specified file.'
  end

  def self.help_find_by
    "Enter 'find' followed by an attribute and criteria to return a list of items "\
    'containing the criteria when sorted by the specified attribute.'
  end

  def self.invalid_input
    'Input is not valid'
  end
end
