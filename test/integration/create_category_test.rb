require "test_helper"

class CreateCategoryTest < ActionDispatch::IntegrationTest
  test "get new category form and create category" do
    get "/categories/new"
    assert_response :success
    assert_difference('Category.count', 1) do
      post categories_url, params: { category: { name: 'Sports' } }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "Sports",response.body #確保響應體中包含新創建的類別名稱
    end
end