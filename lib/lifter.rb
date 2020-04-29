require_relative '../config/environment.rb'
class Lifter
  @@all = []
  attr_accessor :name, :lift_total

  def initialize(name, lift_total=nil)
    @name = name
    @lift_total = lift_total
    Lifter.all << self
  end

  def self.all
   @@all
  end

  def memberships
    Membership.all.select{|membership| membership.lifter == self ? membership : nil}.compact
  end

  def gyms
    self.memberships.map{ |m| m.gym }
  end

  def self.ifteaverage_lift_total
   Lifter.all.map { |e| e.lift_total }.sum / Lifter.all.count
 end

  def memberships_total_cost
   Membership.all.collect{ |membership| membership.lifter == self ? membership.cost : nil}.compact.sum
  end

  def new_membership(gym, cost)
    Membership.new(self, gym, cost)
  end
end
