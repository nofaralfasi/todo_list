require 'test_helper'

class LabelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @label = labels(:one)
  end

  test 'should get index' do
    get labels_path
    assert_response :success
  end

  test 'should get new' do
    get new_label_path
    assert_response :success
  end

  test 'should create label' do
    assert_difference('Label.count') do
      post labels_path, params: { label: { title: 'New Label' } }
    end

    assert_redirected_to labels_path
  end

  test 'should get edit' do
    get edit_label_path(@label)
    assert_response :success
  end

  test 'should update label' do
    patch label_path(@label), params: { label: { title: @label.title } }
    assert_redirected_to labels_path
  end

  test 'should destroy label' do
    assert_difference('Label.count', -1) do
      delete label_path(@label)
    end

    assert_redirected_to labels_path
  end
end
