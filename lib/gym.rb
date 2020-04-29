require_relative '../config/environment.rb'

class Gym
  @@all = []
  attr_accessor :name
  def initialize(name)
    @name = name
    Gym.all << self
  end

  def self.all
    @@all
  end

  def memberships
    Membership.all.collect{ |membership| membership.gym == self ? membership : nil}.compact
  end

  def lifters
    self.memberships.map{ |membership| membership.lifter }
  end

  def combined_lift_total
    self.lifters.map{ |lifter| lifter.lift_total }.sum
  end

  def lifters_names
    self.lifters.map{ |lifter| lifter.name }
  end

end
