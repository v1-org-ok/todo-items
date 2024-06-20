require 'rails_helper'

RSpec.describe TodosController, type: :controller do
  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
      expect(assigns(:todos)).not_to be_nil
    end
  end

  describe "POST #create" do
    it "creates a new Todo" do
      expect {
        post :create, params: { todo: { description: 'Test todo' } }
      }.to change(Todo, :count).by(1)
      expect(response).to redirect_to(todos_path)
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested todo" do
      todo = Todo.create!(description: 'Test todo')
      expect {
        delete :destroy, params: { id: todo.id }
      }.to change(Todo, :count).by(-1)
      expect(response).to redirect_to(todos_path)
    end
  end
end