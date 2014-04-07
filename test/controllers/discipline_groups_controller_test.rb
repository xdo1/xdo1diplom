require 'test_helper'

class DisciplineGroupsControllerTest < ActionController::TestCase
  setup do
    @discipline_group = discipline_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:discipline_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create discipline_group" do
    assert_difference('DisciplineGroup.count') do
      post :create, discipline_group: { belongs_to: @discipline_group.belongs_to, name: @discipline_group.name, weeks_by_plan: @discipline_group.weeks_by_plan }
    end

    assert_redirected_to discipline_group_path(assigns(:discipline_group))
  end

  test "should show discipline_group" do
    get :show, id: @discipline_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @discipline_group
    assert_response :success
  end

  test "should update discipline_group" do
    patch :update, id: @discipline_group, discipline_group: { belongs_to: @discipline_group.belongs_to, name: @discipline_group.name, weeks_by_plan: @discipline_group.weeks_by_plan }
    assert_redirected_to discipline_group_path(assigns(:discipline_group))
  end

  test "should destroy discipline_group" do
    assert_difference('DisciplineGroup.count', -1) do
      delete :destroy, id: @discipline_group
    end

    assert_redirected_to discipline_groups_path
  end
end
