require 'pry'
require_relative '../config/environment.rb'

#cost lifter gym
gym1 = Gym.new("Planet Fitness")
gym2 = Gym.new("Planet Fitness 2")
lifter1 = Lifter.new("Tashawn", 100)
lifter2 = Lifter.new("Tashawn2", 200)
membership1 =  Membership.new(lifter1, gym1, 100)
membership2 =  Membership.new(lifter2, gym2, 100)

lifter1.new_membership(gym2, 300)
binding.pry

puts "Gains"
