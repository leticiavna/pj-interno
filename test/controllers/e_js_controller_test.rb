require 'test_helper'

class EJsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ej = ejs(:one)
  end

  test "should get index" do
    get ejs_url, as: :json
    assert_response :success
  end

  test "should create ej" do
    assert_difference('Ej.count') do
      post ejs_url, params: { ej: { title: @ej.title, university_id: @ej.university_id } }, as: :json
    end

    assert_response 201
  end

  test "should show ej" do
    get ej_url(@ej), as: :json
    assert_response :success
  end

  test "should update ej" do
    patch ej_url(@ej), params: { ej: { title: @ej.title, university_id: @ej.university_id } }, as: :json
    assert_response 200
  end

  test "should destroy ej" do
    assert_difference('Ej.count', -1) do
      delete ej_url(@ej), as: :json
    end

    assert_response 204
  end
end
