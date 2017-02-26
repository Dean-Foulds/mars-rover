require_relative 'plateau'

class Rover
    attr_reader :heading
    attr_reader :pos
    def initialize(heading, x_pos, y_pos)
        @heading = heading
        @pos = {x: x_pos, y: y_pos}
    end

    def step(command)
        c = command.split('')
        c.each do |command|
        command.downcase
        turn_left if command.eql? 'l'
        turn_right if command.eql? 'r'
        move_fwd if command.eql? 'm'
    end
    
    end 

    def turn_left 
      turn -1
    end 

    def turn_right 
      turn +1
    end  

    def move_fwd
    offset_x = 0
    offset_y = 0

    offset_y=1 if heading.eql? :N
    offset_y=-1 if heading.eql? :S
    offset_x=-1 if heading.eql? :W
    offset_x=1 if heading.eql? :E

    @pos[:x]+=offset_x
    @pos[:y]+=offset_y
  end

    def turn(heading_change)
        directions = [:N, :E, :S, :W]
        current_point = directions.index(@heading) + heading_change

        current_point=0 if current_point>directions.count-1
        current_point = directions.count-1 if current_point<0  

        @heading = directions[current_point]
    end

     def to_s
        x_crossed = @pos[:x] > @plateau[0].to_i || @pos[:x] < 0
		y_crossed = @pos[:y] > @plateau[1].to_i || @pos[:y] < 0 
		raise "Rover moved out of bounds" if (x_crossed || y_crossed)
        return "#{@pos}, #{@heading}" 
     end       
end    