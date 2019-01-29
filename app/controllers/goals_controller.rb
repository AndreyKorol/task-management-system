class GoalsController < ApplicationController
  def index
    @goals = Goal.all.order(:position)
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.position = Goal.count + 1

    respond_to do |format|
      if @goal.save
        format.js
      else
        format.js
      end
    end
  end

  def update
    @goal = Goal.find(params[:id])
    @goal.update(complete: !@goal.complete)
  end

  def update_position
    params[:item].each_with_index do |goal_id, index|
      goal = Goal.find(goal_id)
      goal.position = index + 1
      goal.save
    end
  end

  private

  def goal_params
    params.require(:goal).permit(:name)
  end
end