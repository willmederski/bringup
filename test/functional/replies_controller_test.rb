require 'test_helper'

class RepliesControllerTest < ActionController::TestCase
  setup do
    @reply = replies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:replies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reply" do
    assert_difference('Reply.count') do
      post :create, reply: { account_sid: @reply.account_sid, api_version: @reply.api_version, body: @reply.body, date_created: @reply.date_created, date_updated: @reply.date_updated, direction: @reply.direction, from: @reply.from, message_id: @reply.message_id, price: @reply.price, price_unit: @reply.price_unit, uri: @reply.uri }
    end

    assert_redirected_to reply_path(assigns(:reply))
  end

  test "should show reply" do
    get :show, id: @reply
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reply
    assert_response :success
  end

  test "should update reply" do
    put :update, id: @reply, reply: { account_sid: @reply.account_sid, api_version: @reply.api_version, body: @reply.body, date_created: @reply.date_created, date_updated: @reply.date_updated, direction: @reply.direction, from: @reply.from, message_id: @reply.message_id, price: @reply.price, price_unit: @reply.price_unit, uri: @reply.uri }
    assert_redirected_to reply_path(assigns(:reply))
  end

  test "should destroy reply" do
    assert_difference('Reply.count', -1) do
      delete :destroy, id: @reply
    end

    assert_redirected_to replies_path
  end
end
