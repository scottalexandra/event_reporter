require_relative 'entry_repo'


class QueueManager
  attr_reader :new_queue  #:entry_repo


  def initialize
    @new_queue = []
  end

  def clear
    @new_queue = []
  end

  def count
    new_queue.flatten.count
  end

  def add_queue(queue)
    new_queue << queue
  end

  def print
  end

  def print_by
  end

  def save
  end

  def save_to
  end


end
