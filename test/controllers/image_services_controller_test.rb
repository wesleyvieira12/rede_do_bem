require 'test_helper'

class ImageServicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @image_service = image_services(:one)
  end

  test "should get index" do
    get image_services_url
    assert_response :success
  end

  test "should get new" do
    get new_image_service_url
    assert_response :success
  end

  test "should create image_service" do
    assert_difference('ImageService.count') do
      post image_services_url, params: { image_service: {  } }
    end

    assert_redirected_to image_service_url(ImageService.last)
  end

  test "should show image_service" do
    get image_service_url(@image_service)
    assert_response :success
  end

  test "should get edit" do
    get edit_image_service_url(@image_service)
    assert_response :success
  end

  test "should update image_service" do
    patch image_service_url(@image_service), params: { image_service: {  } }
    assert_redirected_to image_service_url(@image_service)
  end

  test "should destroy image_service" do
    assert_difference('ImageService.count', -1) do
      delete image_service_url(@image_service)
    end

    assert_redirected_to image_services_url
  end
end
