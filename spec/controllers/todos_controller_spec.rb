# spec/controllers/todos_controller_spec.rb

require 'rails_helper'

RSpec.describe TodosController, type: :controller do
  let(:valid_attributes) {
    { description: 'Test Todo' }
  }

  describe 'GET #index' do
    it 'assigns @todos' do
      todo = Todo.create! valid_attributes
      get :index
      expect(assigns(:todos)).to eq([todo])
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new todo' do
        expect {
          post :create, params: { todo: valid_attributes }
        }.to change(Todo, :count).by(1)
      end

      it 'redirects to the todos index' do
        post :create, params: { todo: valid_attributes }
        expect(response).to redirect_to(todos_path)
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:todo) { Todo.create! valid_attributes }

    it 'deletes the todo' do
      expect {
        delete :destroy, params: { id: todo.id }
      }.to change(Todo, :count).by(-1)
    end

    it 'redirects to todos#index' do
      delete :destroy, params: { id: todo.id }
      expect(response).to redirect_to(todos_path)
    end
  end
end