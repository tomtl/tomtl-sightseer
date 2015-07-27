class VisitedSightsController < ApplicationController
  before_action :require_user

  def create
    @sight = Sight.find(params[:sight_id])
    @user = current_user

    @visited_sight = VisitedSight.new(user: @user, sight: @sight)
    if @visited_sight.save
      flash[:success] = "#{@sight.name} added to your list of sights visited"
    else
      flash[:danger] = "You already have this sight on your list"
    end
    render "sights/show"
  end
end
