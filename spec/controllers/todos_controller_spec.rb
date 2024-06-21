require 'rails_helper'

RSpec.describe TodosController, type: :controller do
  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end

    it 'assigns all todos to @todos' do
      todo = Todo.create!(description: 'Test Todo')
      get :index
      expect(assigns(:todos)).to eq([todo])
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Todo' do
        expect {
          post :create, params: { todo: { description: 'Test Todo' } }
        }.to change(Todo, :count).by(1)
      end

      it 'redirects to the todos list' do
        post :create, params: { todo: { description: 'Test Todo' } }
        expect(response).to redirect_to(todos_path)
      end
    end

    context 'with invalid params' do
      it 'does not create a new Todo' do
        expect {
          post :create, params: { todo: { description: '' } }
        }.not_to change(Todo, :count)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested todo' do
      todo = Todo.create!(description: 'Test Todo')
      expect {
        delete :destroy, params: { id: todo.id }
      }.to change(Todo, :count).by(-1)
    end

    it 'redirects to the todos list' do
      todo = Todo.create!(description: 'Test Todo')
      delete :destroy, params: { id: todo.id }
      expect(response).to redirect_to(todos_path)
    end
  end
end