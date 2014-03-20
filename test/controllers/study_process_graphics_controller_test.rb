require 'test_helper'

class StudyProcessGraphicsControllerTest < ActionController::TestCase
  setup do
    @study_process_graphic = study_process_graphics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:study_process_graphics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create study_process_graphic" do
    assert_difference('StudyProcessGraphic.count') do
      post :create, study_process_graphic: {  }
    end

    assert_redirected_to study_process_graphic_path(assigns(:study_process_graphic))
  end

  test "should show study_process_graphic" do
    get :show, id: @study_process_graphic
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @study_process_graphic
    assert_response :success
  end

  test "should update study_process_graphic" do
    patch :update, id: @study_process_graphic, study_process_graphic: {  }
    assert_redirected_to study_process_graphic_path(assigns(:study_process_graphic))
  end

  test "should destroy study_process_graphic" do
    assert_difference('StudyProcessGraphic.count', -1) do
      delete :destroy, id: @study_process_graphic
    end

    assert_redirected_to study_process_graphics_path
  end
end
