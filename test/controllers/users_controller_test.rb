require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  def setup
    @user = users(:david)
    @other_user = users(:archer)
  end

  test "should redirect edit when not logged in" do
    get :edit, id: @user #navigate to /user/1/edit without being logged in
    assert_not flash.empty?
    assert_redirected_to login_path
  end

  test "should redirect update when not logged in" do
      patch :update, id: @user, user: { name: @user.name, email: @user.email }
      assert_not flash.empty?
      assert_redirected_to login_url
    end

    test "should redirect edit other user to root page"
      log_in_as @user
      get :edit, id: @other_user
      assert flash.empty?
      assert_redirected_to root_path 
    end

    test "should redirect update other user to root page"
      log_in_as @user
      patch :update, , id: @user, user: { name: @user.name, email: @user.email }
      assert flash.empty?
      assert_redirected_to root_path
    end
end
