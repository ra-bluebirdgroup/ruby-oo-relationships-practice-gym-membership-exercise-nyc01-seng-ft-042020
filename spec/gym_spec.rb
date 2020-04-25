require 'spec_helper'
# **Gym**
#
#   - Get a list of all gyms √
#
#   - Get a list of all memberships at a specific gym  √
#
#   - Get a list of all the lifters that have a membership to a specific gym √
#
#   - Get a list of the names of all lifters that have a membership to that gym √
#
#   - Get the combined lift total of every lifter has a membership to that gym √

describe 'Gym' do
  describe '#name' do
    it 'has a name' do
      gym1 = Gym.new('Equinox')
      expect(gym1.name).to eq('Equinox')
  end
end

describe '#new' do
  it 'new does not raise an error, initializes with a name' do
    new_gym = Gym.new('Equinox')
    expect { Gym.new('NEW GYM') }.to_not raise_error

   end
 end

 describe '#memberships' do
   it 'returns all memberships associated with this gym' do
     lifter1 = Lifter.new('The Lifter')
     lifter2 = Lifter.new('Arnold')
      gym1 = Gym.new('Equinox')
      gym2 = Gym.new('Planet Fitness')
      membership1 = Membership.new(lifter1, gym1, 1000)
      membership2 = Membership.new(lifter2, gym2, 500)

      expect(gym1.memberships).to include(membership1)
      expect(gym2.memberships).to include(membership2)
      end
    end

    describe '#lifters' do
      it 'returns a list of all lifters associated with this gym' do
        lifter1 = Lifter.new('The Lifter')
        lifter2 = Lifter.new('Arnold')
         gym1 = Gym.new('Equinox')
         gym2 = Gym.new('Planet Fitness')
         membership1 = Membership.new(lifter1, gym1, 1000)
         membership2 = Membership.new(lifter2, gym2, 500)

         expect(gym1.lifters).to include(lifter1)
         expect(gym2.lifters).to include(lifter2)
       end
     end

     describe '#combined_lift_total' do
       it 'returns the combined lift total of every lifter that has a membership to this gym' do
         lifter1 = Lifter.new('The Lifter', 100)
         lifter2 = Lifter.new('Arnold', 200)
          gym1 = Gym.new('Equinox')
          gym2 = Gym.new('Planet Fitness')
          membership1 = Membership.new(lifter1, gym1, 1000)
          membership2 = Membership.new(lifter2, gym1, 500)

          expect(gym1.combined_lift_total).to eq(300)
          expect(gym2.combined_lift_total).to eq(0)
        end
      end

      describe '#lifters_names' do
        it 'returns all a list of all lifter names associated with this gym' do
          lifter1 = Lifter.new('The Lifter')
          lifter2 = Lifter.new('Arnold')
           gym1 = Gym.new('Equinox')
           gym2 = Gym.new('Planet Fitness')
           membership1 = Membership.new(lifter1, gym1, 1000)
           membership2 = Membership.new(lifter2, gym2, 500)

           expect(gym1.lifters_names).to include(lifter1.name)
           expect(gym2.lifters_names).to include(lifter2.name)
         end
       end


    describe '#new_membership' do
      it 'given a lifter and a cost, creates a new membership' do
         lifter1 = Lifter.new('The Lifter')
         gym1 = Gym.new('Equinox')
         membership1 = gym1.new_membership(lifter1, 1000)

         expect(Membership.all).to include(membership1)
        expect(gym1.gyms).to include(gym1)

       end
      end

 describe '#gyms' do
  it 'Get a list of all gyms' do
       lifter1 = Lifter.new('The Lifter')
       lifter2 = Lifter.new('The Lifter 2')
        gym1 = Gym.new('Equinox')
        gym2 = Gym.new('Planet Fitness')
        membership1 = Membership.new(lifter1, gym1, 1000)
        membership2 = Membership.new(lifter2, gym2, 500)

        expect(gym1.gyms).to include(gym2)
    end
  end

end
