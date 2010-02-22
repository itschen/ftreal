require 'test_helper'

class OwnersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:owners)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create owner" do
    assert_difference('Owner.count') do
      post :create, :owner => { }
    end

    assert_redirected_to owner_path(assigns(:owner))
  end

  test "should show owner" do
    get :show, :id => owners(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => owners(:one).to_param
    assert_response :success
  end

  test "should update owner" do
    put :update, :id => owners(:one).to_param, :owner => { }
    assert_redirected_to owner_path(assigns(:owner))
  end

  test "should destroy owner" do
    assert_difference('Owner.count', -1) do
      delete :destroy, :id => owners(:one).to_param
    end

    assert_redirected_to owners_path
  end
end
