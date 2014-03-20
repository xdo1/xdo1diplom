require 'test_helper'

class StudyPeriodsControllerTest < ActionController::TestCase
  setup do
    @study_period = study_periods(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:study_periods)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create study_period" do
    assert_difference('StudyPeriod.count') do
      post :create, study_period: {  }
    end

    assert_redirected_to study_period_path(assigns(:study_period))
  end

  test "should show study_period" do
    get :show, id: @study_period
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @study_period
    assert_response :success
  end

  test "should update study_period" do
    patch :update, id: @study_period, study_period: {  }
    assert_redirected_to study_period_path(assigns(:study_period))
  end

  test "should destroy study_period" do
    assert_difference('StudyPeriod.count', -1) do
      delete :destroy, id: @study_period
    end

    assert_redirected_to study_periods_path
  end
end
