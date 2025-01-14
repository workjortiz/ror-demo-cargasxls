require "test_helper"

class UnitMeasuresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @unit_measure = unit_measures(:one)
  end

  test "should get index" do
    get unit_measures_url
    assert_response :success
  end

  test "should get new" do
    get new_unit_measure_url
    assert_response :success
  end

  test "should create unit_measure" do
    assert_difference("UnitMeasure.count") do
      post unit_measures_url, params: { unit_measure: { iso_code: @unit_measure.iso_code, name: @unit_measure.name } }
    end

    assert_redirected_to unit_measure_url(UnitMeasure.last)
  end

  test "should show unit_measure" do
    get unit_measure_url(@unit_measure)
    assert_response :success
  end

  test "should get edit" do
    get edit_unit_measure_url(@unit_measure)
    assert_response :success
  end

  test "should update unit_measure" do
    patch unit_measure_url(@unit_measure), params: { unit_measure: { iso_code: @unit_measure.iso_code, name: @unit_measure.name } }
    assert_redirected_to unit_measure_url(@unit_measure)
  end

  test "should destroy unit_measure" do
    assert_difference("UnitMeasure.count", -1) do
      delete unit_measure_url(@unit_measure)
    end

    assert_redirected_to unit_measures_url
  end
end
