require_relative '../config/environment.rb'
class Membership
  @@all = []

  attr_reader :cost
  attr_accessor :lifter, :gym

  def initialize(lifter, gym, cost) # so this could be a hash like: initialize(hash)
    @cost = cost
    @lifter = lifter
    @gym = gym
    Membership.all << self
  end

  def self.all
    @@all
  end
  #
  def all
   Membership.all
  end

end
