class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    attraction_tickets = self.attraction.tickets
    user_tickets = self.user.tickets
    attraction_min_height = self.attraction.min_height
    user_height = self.user.height
    if user_tickets < attraction_tickets && user_height < attraction_min_height
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
    elsif user_tickets < attraction_tickets
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    elsif user_height < attraction_min_height
      "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    else
      self.user.tickets -= attraction_tickets
      self.user.nausea += self.attraction.nausea_rating
      self.user.happiness += self.attraction.happiness_rating
      self.user.save
    end
  end


end
