require 'rails_helper'

RSpec.describe GoalsController, type: :controller do
  let(:goal){create(:goal)}

  it '#index' do
    get :index
    expect(response).to have_http_status :ok
  end

  describe '#create' do
    let(:create_params){
      {
        goal: {
          name: 'Task'
        }
      }
    }

    it '#create' do
      expect_any_instance_of(Goal).to receive(:save).and_return(true)
      post :create, params: create_params, format: :js
      expect(assigns(:goal)).to be_a_new(Goal).with(create_params[:goal])
    end
  end

  it '#update' do
    expect(Goal).to receive(:find).with("#{goal.id}").and_return(goal) 
    expect{put :update, params: {id: goal.id}}.to change{goal.complete}.to(!goal.complete)
  end

  describe '#update_position' do
    let(:update_params){
      {
        item: ['4', '5', '6']
      }
    }

    it '#update_position' do
      expect(Goal).to receive(:find).exactly(update_params[:item].size).times.and_return(goal)
      expect{put :update_position, params: update_params}.to change{goal.position}.to(update_params[:item].size)
    end
  end
end
