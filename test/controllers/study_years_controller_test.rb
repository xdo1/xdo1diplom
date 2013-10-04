require 'test_helper'

class StudyYearsControllerTest < ActionController::TestCase
  setup do
    @study_year = study_years(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:study_years)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create study_year" do
    assert_difference('StudyYear.count') do
      post :create, study_year: {  }
    end

    assert_redirected_to study_year_path(assigns(:study_year))
  end

  test "should show study_year" do
    get :show, id: @study_year
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @study_year
    assert_response :success
  end

  test "should update study_year" do
    patch :update, id: @study_year, study_year: {  }
    assert_redirected_to study_year_path(assigns(:study_year))
  end

  test "should destroy study_year" do
    assert_difference('StudyYear.count', -1) do
      delete :destroy, id: @study_year
    end

    assert_redirected_to study_years_path
  end
end
