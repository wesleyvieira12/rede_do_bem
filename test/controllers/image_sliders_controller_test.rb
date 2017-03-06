require 'test_helper'

class ImageSlidersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @image_slider = image_sliders(:one)
  end

  test "should get index" do
    get image_sliders_url
    assert_response :success
  end

  test "should get new" do
    get new_image_slider_url
    assert_response :success
  end

  test "should create image_slider" do
    assert_difference('ImageSlider.count') do
      post image_sliders_url, params: { image_slider: {  } }
    end

    assert_redirected_to image_slider_url(ImageSlider.last)
  end

  test "should show image_slider" do
    get image_slider_url(@image_slider)
    assert_response :success
  end

  test "should get edit" do
    get edit_image_slider_url(@image_slider)
    assert_response :success
  end

  test "should update image_slider" do
    patch image_slider_url(@image_slider), params: { image_slider: {  } }
    assert_redirected_to image_slider_url(@image_slider)
  end

  test "should destroy image_slider" do
    assert_difference('ImageSlider.count', -1) do
      delete image_slider_url(@image_slider)
    end

    assert_redirected_to image_sliders_url
  end
end
