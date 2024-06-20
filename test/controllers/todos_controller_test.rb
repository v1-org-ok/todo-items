require "test_helper"

class TodosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get todos_url
    assert_response :success
    assert_not_nil assigns(:todos)
  end

  test "should create todo" do
    assert_difference('Todo.count') do
      post todos_url, params: { todo: { description: 'Test todo' } }
    end
    assert_redirected_to todos_url
  end

  test "should destroy todo" do
    todo = Todo.create(description: 'Test todo')
    assert_difference('Todo.count', -1) do
      delete todo_url(todo)
    end
    assert_redirected_to todos_url
  end
end