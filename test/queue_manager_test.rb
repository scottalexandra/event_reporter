require_relative 'test_defaults'
require_relative '../lib/queue_manager'

class QueueManagerTest < Minitest::Test

  def test_new_que
    queue = QueueManager.new
    assert queue.respond_to?(:new_queue)
  end

  def test_queue_clear_exists
    queue = QueueManager.new
    assert queue.respond_to?(:clear)
  end

  def test_queue_count_exists
    queue = QueueManager.new
    assert queue.respond_to?(:count)
  end

  def test_queue_count_counts_queue
    queue = QueueManager.new
    queue.add_queue([1,2,3])
    assert_equal 3, queue.count
  end

  def test_add_queue_adds_queues_to_new_queue_array

    queue = QueueManager.new
    entries = [
      { first_name: 'allison', last_name: 'nguyen', phone_number: '615.438.5000' },
      { first_name: 'allison', last_name: 'hankins', phone_number: '414.520.5000' },
      { first_name: 'jennifer', last_name: 'cope', phone_number: '704.813.3000' }
    ]
    repository = EntryRepo.new(entries)
    entries = repository.search_by_first_name("allison").sort_by { |e| e.first_name }
    queue.add_queue(entries)
    assert_equal 2, queue.count
  end

  def test_queue_print_by_exits
    queue = QueueManager.new
    assert queue.respond_to?(:print_out_queue)
  end

  def test_queue_save_to_exits
    queue = QueueManager.new
    assert queue.respond_to?(:queue_save_to)
  end


end
