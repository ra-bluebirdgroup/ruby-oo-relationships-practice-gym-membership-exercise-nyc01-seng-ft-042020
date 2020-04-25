require_relative '../config/environment.rb'

class Gym
  attr_accessor :name
  def initialize(name)
    @name = name

  end

  def self.all
    nil
  end

  def memberships
    Membership.all.collect{ |membership| membership.gym == self ? membership : nil}.compact
  end

  def lifters
    Membership.all.collect{ |membership| membership.gym == self ? membership.lifter : nil}.compact
  end

  def combined_lift_total
    Membership.all.collect{ |membership| membership.gym == self ? membership.lifter.lift_total : nil}.compact.sum
  end

  def lifters_names
    Membership.all.collect{ |membership| membership.gym == self ? membership.lifter.name : nil}.compact
  end

  def new_membership(lifter, cost)
    Membership.new(lifter, self, cost)
  end

  def gyms
    Membership.all.collect{ |membership| membership.gym}
  end


end
