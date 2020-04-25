require 'spec_helper'
# **Lifter**
#
#   - Get a list of all lifters √
#
#   - Get a list of all the memberships that a specific lifter has √
#
#   - Get a list of all the gyms that a specific lifter has memberships to √
#
#   - Get the average lift total of all lifters √
#
#   - Get the total cost of a specific lifter's gym memberships √
#
#   - Given a gym and a membership cost, sign a specific lifter up for a new gym √

describe 'Lifter' do
  describe '#name' do
    it 'has a name' do
      lifter1 = Lifter.new('Vegan Gains')
      expect(lifter1.name).to eq('Vegan Gains')
  end
end

describe '#new' do
  it 'initializes with a name and a lift total' do
    new_lifter = Lifter.new('Liftie')

    expect { Lifter.new('The Rock') }.to_not raise_error
   end
 end

 describe '#all' do
   it 'Get a list of all lifters' do
   lifter1 = Lifter.new('The Lifter')
   lifter2 = Lifter.new('Arnold')
    gym1 = Gym.new('Equinox')

   membership1 = Membership.new(lifter1, gym1, 1000)
   membership2 = Membership.new(lifter2, gym1, 500)

   expect(lifter1.all).to include(lifter2)
   expect(lifter2.all).to include(lifter1)

 end
end

describe '#average_lift_total' do
  it 'get the average lift total of all lifters' do
    lifter1 = Lifter.new('The Lifter', 25)
    lifter2 = Lifter.new('Arnold', 50)
    gym1 = Gym.new('Equinox')

    membership1 = Membership.new(lifter1, gym1, 1000)
    membership2 = Membership.new(lifter2, gym1, 500)

    expect(lifter1.average_lift_total).to eq(93.75)

  end
end

describe '#membership_total' do
  it 'gets the total cost of a specific lifter\'s gym memberships' do
    lifter1 = Lifter.new('The Lifter', 25)
    lifter2 = Lifter.new('Arnold', 50)
    gym1 = Gym.new('Equinox')
    gym2 = Gym.new('The Park')
    membership1 = Membership.new(lifter1, gym1, 1000)
    membership2 = Membership.new(lifter1, gym2, 500)
    membership3 = Membership.new(lifter2, gym2, 500)

    expect(lifter1.membership_total).to eq(1500)
    expect(lifter2.membership_total).to eq(500)

  end
end

 describe '#memberships' do
   it 'returns all memberships associated with this Lifter' do
     lifter1 = Lifter.new('The Lifter')
     lifter2 = Lifter.new('Arnold')
      gym1 = Gym.new('Equinox')
      gym2 = Gym.new('Planet Fitness')
      membership1 = Membership.new(lifter1, gym1, 1000)
      membership2 = Membership.new(lifter2, gym2, 500)

      expect(lifter1.memberships).to include(membership1)
      expect(lifter2.memberships).to include(membership2)
      end
    end

    describe '#new_membership' do
      it 'given a gym and a cost, creates a new membership' do
         lifter1 = Lifter.new('The Lifter')
         gym1 = Gym.new('Equinox')
         membership1 = lifter1.new_membership(gym1, 1000)
         expect(lifter1.memberships).to include(membership1)
        expect(membership1.lifter).to eq(lifter1)
  end
end

 describe '#gyms' do
  it 'has many gyms, through memeberships' do
       lifter1 = Lifter.new('The Lifter')
        gym1 = Gym.new('Equinox')
        membership1 = Membership.new(lifter1, gym1, 1000)
        expect(lifter1.gyms).to include(gym1)

    end
  end

end
