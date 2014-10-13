require 'test_helper'

class RestaurentsControllerTest < ActionController::TestCase
  setup do
    @restaurent = restaurents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:restaurents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create restaurent" do
    assert_difference('Restaurent.count') do
      post :create, restaurent: { address: @restaurent.address, name: @restaurent.name, phone: @restaurent.phone, website: @restaurent.website }
    end

    assert_redirected_to restaurent_path(assigns(:restaurent))
  end

  test "should show restaurent" do
    get :show, id: @restaurent
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @restaurent
    assert_response :success
  end

  test "should update restaurent" do
    patch :update, id: @restaurent, restaurent: { address: @restaurent.address, name: @restaurent.name, phone: @restaurent.phone, website: @restaurent.website }
    assert_redirected_to restaurent_path(assigns(:restaurent))
  end

  test "should destroy restaurent" do
    assert_difference('Restaurent.count', -1) do
      delete :destroy, id: @restaurent
    end

    assert_redirected_to restaurents_path
  end
end
