require 'test_helper'

class ParentsControllerTest < ActionController::TestCase
  setup do
    @parent = parents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:parents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create parent" do
    assert_difference('Parent.count') do
      post :create, parent: { child_nm: @parent.child_nm, class_code: @parent.class_code, delivery_time: @parent.delivery_time, first_nm: @parent.first_nm, last_nm: @parent.last_nm, phone_number: @parent.phone_number, relationship: @parent.relationship }
    end

    assert_redirected_to parent_path(assigns(:parent))
  end

  test "should show parent" do
    get :show, id: @parent
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @parent
    assert_response :success
  end

  test "should update parent" do
    put :update, id: @parent, parent: { child_nm: @parent.child_nm, class_code: @parent.class_code, delivery_time: @parent.delivery_time, first_nm: @parent.first_nm, last_nm: @parent.last_nm, phone_number: @parent.phone_number, relationship: @parent.relationship }
    assert_redirected_to parent_path(assigns(:parent))
  end

  test "should destroy parent" do
    assert_difference('Parent.count', -1) do
      delete :destroy, id: @parent
    end

    assert_redirected_to parents_path
  end
end
