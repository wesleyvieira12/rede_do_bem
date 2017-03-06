require 'test_helper'

class SobresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sobre = sobres(:one)
  end

  test "should get index" do
    get sobres_url
    assert_response :success
  end

  test "should get new" do
    get new_sobre_url
    assert_response :success
  end

  test "should create sobre" do
    assert_difference('Sobre.count') do
      post sobres_url, params: { sobre: { description: @sobre.description } }
    end

    assert_redirected_to sobre_url(Sobre.last)
  end

  test "should show sobre" do
    get sobre_url(@sobre)
    assert_response :success
  end

  test "should get edit" do
    get edit_sobre_url(@sobre)
    assert_response :success
  end

  test "should update sobre" do
    patch sobre_url(@sobre), params: { sobre: { description: @sobre.description } }
    assert_redirected_to sobre_url(@sobre)
  end

  test "should destroy sobre" do
    assert_difference('Sobre.count', -1) do
      delete sobre_url(@sobre)
    end

    assert_redirected_to sobres_url
  end
end
