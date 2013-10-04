require 'test_helper'

class SubFacultiesControllerTest < ActionController::TestCase
  setup do
    @sub_faculty = sub_faculties(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sub_faculties)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sub_faculty" do
    assert_difference('SubFaculty.count') do
      post :create, sub_faculty: {  }
    end

    assert_redirected_to sub_faculty_path(assigns(:sub_faculty))
  end

  test "should show sub_faculty" do
    get :show, id: @sub_faculty
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sub_faculty
    assert_response :success
  end

  test "should update sub_faculty" do
    patch :update, id: @sub_faculty, sub_faculty: {  }
    assert_redirected_to sub_faculty_path(assigns(:sub_faculty))
  end

  test "should destroy sub_faculty" do
    assert_difference('SubFaculty.count', -1) do
      delete :destroy, id: @sub_faculty
    end

    assert_redirected_to sub_faculties_path
  end
end
