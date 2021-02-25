class Owner
  attr_reader :name,
              :occupation,
              :cars

  def initialize(name, occupation)
    @name = name
    @occupation = occupation
    @cars = []
  end

  # def buy(string)
  #   require "pry"; binding.pry
  #   string = Car.new(info)
  #   @cars << string
  # end
  #Don't know how to instantiate a new car on a method...I tried

  def buy(car)
    @cars << car
  end

  def vintage_cars
    vintage = []
    @cars.each do |car|
      vintage << car if car.year.to_i < 1996
    end
    vintage
  end

end
