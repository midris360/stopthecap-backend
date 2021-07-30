require "test_helper"

class VinylsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vinyl = vinyls(:one)
  end

  test "should get index" do
    get vinyls_url, as: :json
    assert_response :success
  end

  test "should create vinyl" do
    assert_difference('Vinyl.count') do
      post vinyls_url, params: { vinyl: { name: @vinyl.name, title: @vinyl.title, user_id: @vinyl.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show vinyl" do
    get vinyl_url(@vinyl), as: :json
    assert_response :success
  end

  test "should update vinyl" do
    patch vinyl_url(@vinyl), params: { vinyl: { name: @vinyl.name, title: @vinyl.title, user_id: @vinyl.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy vinyl" do
    assert_difference('Vinyl.count', -1) do
      delete vinyl_url(@vinyl), as: :json
    end

    assert_response 204
  end
end
