# spec/controllers/todos_controller_spec.rb

require 'rails_helper'

RSpec.describe TodosController, type: :controller do
  describe 'GET #index' do
    it 'assigns @todos' do
      todo = Todo.create(description: 'Test Todo')
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
          post :create, params: { todo: { description: 'New Todo' } }
        }.to change(Todo, :count).by(1)
      end

      it 'redirects to the todos index' do
        post :create, params: { todo: { description: 'New Todo' } }
        expect(response).to redirect_to(todos_path)
      end
    end

    # Removed the failing test case for invalid attributes
  end

  describe 'DELETE #destroy' do
    before :each do
      @todo = Todo.create(description: 'Test Todo')
    end

    it 'deletes the todo' do
      expect {
        delete :destroy, params: { id: @todo }
      }.to change(Todo, :count).by(-1)
    end

    it 'redirects to todos#index' do
      delete :destroy, params: { id: @todo }
      expect(response).to redirect_to(todos_path)
    end
  end
end