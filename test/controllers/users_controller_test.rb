require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  def setup
    @user       = users(:david) #admin
    @other_user = users(:archer)
  end

  test "should redirect index when not logged in" do
    get :index
    assert_redirected_to login_url
  end

  test "should redirect when deleting as non-admin" do
    log_in_as(@other_user)
    assert_no_difference 'User.count' do
      delete :destroy, id: @user
    end    
    assert_redirected_to root_url
  end

end
