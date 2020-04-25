require_relative '../config/environment.rb'
class Lifter
  # @@all = []
  attr_accessor :name, :lift_total

  def initialize(name, lift_total=nil)
    @name = name
    @lift_total = lift_total

  end

  def all
     Membership.all.collect{ |membership| membership.lifter}
  end

  def memberships
    Membership.all.select{|membership| membership.lifter == self ? membership : nil}
  end

  def gyms
    self.memberships.collect{ |m| m.gym }
  end

  def average_lift_total
   Membership.all.collect{ |membership| membership.lifter.lift_total}.compact.sum /
   Membership.all.collect{ |membership| membership.lifter.lift_total ? membership.lifter : nil}.compact.count.to_f
  end

  def membership_total
   Membership.all.collect{ |membership| membership.lifter == self ? membership.cost : nil}.compact.sum
  end

  def new_membership(gym, cost)
    Membership.new(self, gym, cost)
  end
end
