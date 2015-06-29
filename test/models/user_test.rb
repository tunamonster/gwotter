require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:david)
  end

  test "deleting user also deletes microposts" do
    @user.save
    @user.microposts.create!(content: "testestest")
    assert_difference 'Micropost.count', -1 do
      @user.destroy
    end
  end

end
