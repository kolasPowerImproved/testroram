require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save task without title" do
    task = Task.new
    assert_not task.save
  end
end
