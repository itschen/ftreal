require 'test_helper'

class ParcelsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:parcels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create parcel" do
    assert_difference('Parcel.count') do
      post :create, :parcel => { }
    end

    assert_redirected_to parcel_path(assigns(:parcel))
  end

  test "should show parcel" do
    get :show, :id => parcels(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => parcels(:one).to_param
    assert_response :success
  end

  test "should update parcel" do
    put :update, :id => parcels(:one).to_param, :parcel => { }
    assert_redirected_to parcel_path(assigns(:parcel))
  end

  test "should destroy parcel" do
    assert_difference('Parcel.count', -1) do
      delete :destroy, :id => parcels(:one).to_param
    end

    assert_redirected_to parcels_path
  end
end
