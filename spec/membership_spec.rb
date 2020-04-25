require 'spec_helper'
#  - Get a list of all memberships √
describe 'Membership' do
  describe '#all'   do
  it 'know all memberships that have been created' do
    lifter2 = Lifter.new('Arnold')
     gym2 = Gym.new('Planet Fitness')

     membership2 = lifter2.new_membership(gym2, 2500)
       expect(Membership.all).to include(membership2)
     end
   end

   describe "#new" do
  it "initializes with a lifter, gym, and membership" do
    lifter2 = Lifter.new('Arnold')
     gym2 = Gym.new('Planet Fitness')

    expect{Membership.new(lifter2, gym2, 1000)}.to_not raise_error
  end
end

describe "#lifter" do
  it "belongs to a lifter" do
    lifter1 = Lifter.new("The Lifter")
    gym1 = Gym.new("Equinox")
    membership = lifter1.new_membership(gym1, 1000)
    expect(membership.lifter).to eq(lifter1)
  end
end

describe "#gym" do
  it "belongs to a gym" do
    lifter1 = Lifter.new("The Lifter")
    gym1 = Gym.new("Equinox")
    membership = lifter1.new_membership(gym1, 1000)
    expect(membership.gym).to eq(gym1)
  end
end
end
