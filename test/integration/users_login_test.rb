require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:david)
  end

  def log_in_as(user, options = {})
    password    = options[:password]    || 'password'
    remember_me = options[:remember_me] || '1'
    if integration_test?
      post login_path, session: { email:       user.email,
                                  password:    password,
                                  remember_me: remember_me }
    else
      session[:user_id] = user.id
    end
  end

  def integration_test?
    defined?(post_via_redirect)
  end

  test "login with remembering" do
    self.log_in_as(@user, remember_me: '1')
    assert_not_nil cookies['remember_token']
    assert_redirected_to @user
    assert_not flash.empty?
  end

  test "login without remembering" do
    self.log_in_as(@user, remember_me: '0')
    assert_nil cookies['remember_token']
  end
end
