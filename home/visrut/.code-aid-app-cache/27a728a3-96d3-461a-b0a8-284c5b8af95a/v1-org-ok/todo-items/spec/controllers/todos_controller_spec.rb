# spec/controllers/todos_controller_spec.rb
require 'rails_helper'

RSpec.describe TodosController, type: :controller do
  let(:valid_attributes) {
    { description: 'Test Todo' }
  }

  let(:invalid_attributes) {
    { description: nil }
  }

  describe "GET #index" do
    it "assigns all todos as @todos" do
      todo = Todo.create! valid_attributes
      get :index
      expect(assigns(:todos)).to eq([todo])
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Todo" do
        expect {
          post :create, params: { todo: valid_attributes }
        }.to change(Todo, :count).by(1)
      end

      it "redirects to the todos list" do
        post :create, params: { todo: valid_attributes }
        expect(response).to redirect_to(todos_path)
      end
    end

    context "with invalid params" do
      it "does not create a new Todo" do
        expect {
          post :create, params: { todo: invalid_attributes }
        }.to change(Todo, :count).by(0)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested todo" do
      todo = Todo.create! valid_attributes
      expect {
        delete :destroy, params: { id: todo.to_param }
      }.to change(Todo, :count).by(-1)
    end

    it "redirects to the todos list" do
      todo = Todo.create! valid_attributes
      delete :destroy, params: { id: todo.to_param }
      expect(response).to redirect_to(todos_path)
    end
  end
end