class RidesController < ApplicationController
  def create
    @ride = Ride.new(user_id: session[:user_id], attraction_id: params[:id])
    flash[:notice] = @ride.take_ride
      if flash[:notice].include?("Sorry")
        redirect_to user_path(current_user)
      else
        @ride.save
        redirect_to user_path(current_user)
      end
  end
end
