require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
def setup
  @user = users(:david)
end

end
  test "login with invalid information" do
    get login_path #Visit the login path.
    assert_template 'sessions/new'#Verify that the new sessions form renders properly.
    post login_path, session: {email: "user@invalid.example", password: ""} #try invalid hash
    assert_template 'sessions/new' #verify new session re-render
    assert_not flash.empty? #verify flash message. Same as assert flash.any? ?
    get root_path #check homepage
    assert flash.empty? #check flash
  end
  # test "the truth" do
  #   assert true
  # end
end
