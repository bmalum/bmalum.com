require 'test_helper'

class ComputationUnitsControllerTest < ActionController::TestCase
  setup do
    @computation_unit = computation_units(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:computation_units)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create computation_unit" do
    assert_difference('ComputationUnit.count') do
      post :create, computation_unit: { CPU_Clock: @computation_unit.CPU_Clock, CPU_Cores: @computation_unit.CPU_Cores, NIC: @computation_unit.NIC, added: @computation_unit.added, location: @computation_unit.location, name: @computation_unit.name, online: @computation_unit.online, ram: @computation_unit.ram, storage: @computation_unit.storage, updated: @computation_unit.updated }
    end

    assert_redirected_to computation_unit_path(assigns(:computation_unit))
  end

  test "should show computation_unit" do
    get :show, id: @computation_unit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @computation_unit
    assert_response :success
  end

  test "should update computation_unit" do
    patch :update, id: @computation_unit, computation_unit: { CPU_Clock: @computation_unit.CPU_Clock, CPU_Cores: @computation_unit.CPU_Cores, NIC: @computation_unit.NIC, added: @computation_unit.added, location: @computation_unit.location, name: @computation_unit.name, online: @computation_unit.online, ram: @computation_unit.ram, storage: @computation_unit.storage, updated: @computation_unit.updated }
    assert_redirected_to computation_unit_path(assigns(:computation_unit))
  end

  test "should destroy computation_unit" do
    assert_difference('ComputationUnit.count', -1) do
      delete :destroy, id: @computation_unit
    end

    assert_redirected_to computation_units_path
  end
end
