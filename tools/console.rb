require 'pry'
require_relative '../config/enviroment.rb'

#cost lifter gym
gym1 = Gym.new("Planet Fitness")
lifter1 = Lifter.new("Tashawn", 100)
membership1 =  Memebership.new(100, lifter1, gym1)

binding.pry

puts "Gains"
