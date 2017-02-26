require 'rspec'
require_relative '../src/rover'

describe 'Rover' do

  let(:rover) { Rover.new(:N, 0, 0) }

  describe 'properties' do
    it 'has an initial heading' do
      expect(rover).to respond_to :heading
    end

    it 'has an initial :x_pos' do
      expect(rover).to respond_to :pos
    end
  end 

  describe '#step' do
    it 'point to W when turn left from N' do
      rover = Rover.new(:N,0,0)
      rover.step 'l'
      expect(rover.heading).to eql :W
    end
    
    it 'point to S when turn left twice from N' do
      rover = Rover.new(:N,0,0)
      rover.step 'll'
      expect(rover.heading).to eql :S
    end
    
    it 'point to move forward turn right to face east and move forward once more' do
      rover = Rover.new(:N,0,0)
      rover.step 'mrm'
      expect(rover.heading).to eql :E
      expect(rover.pos).to include(x:1, y:1)
    end
    
     it 'should raise error message to state outside of plateau boundaries' do
      rover = Rover.new(:N,0,0)
      plateau = Plateau.new "55"
      rover.step 'lm'
      expect(rover.heading).to eql :W
      expect { raise "Rover moved out of bounds" }.to raise_error("Rover moved out of bounds")
      end
 
    it 'point to E when turn right from N' do
      rover = Rover.new(:N,0,0)
      rover.step 'r'
      expect(rover.heading).to eql :E
    end

    it 'move forward one position when M and facing N' do
      rover = Rover.new(:N,0,0)
      rover.step 'm'
      expect(rover.pos).to include(x:0, y:1)  
    end  
  end 
end