require 'test_helper'

class MicropostTest < ActiveSupport::TestCase

  def setup
    @user = users(:david)
    # This code is not idiomatically correct.
    @micropost = @user.microposts.build(content: "Lorem ipsum")
  end

  test "should be valid" do
    assert @micropost.valid?
  end

  test "user id should be present" do
    @micropost.user_id = nil
    assert_not @micropost.valid?
  end

  test "micropost content should be valid" do
    @micropost.content = " "
    assert_not @micropost.valid?
  end

  test "micropost length should be 140 chars or less" do
    @micropost.content = "a" * 141
    assert_not @micropost.valid?
  end

  test "most recent micropost should be first" do
    assert_equal microposts(:orange), Micropost.first
  end
end
