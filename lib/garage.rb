class Garage
  attr_reader :name, :customers

  def initialize(name)
    @name = name
    @customers = []
  end

  def add_customer(customer)
    @customers << customer
  end

  def all_cars
    all_cars = []
    @customers.map do |customer|
      all_cars << customer.cars
    end
    all_cars.flatten
  end

  def cars_by_make
    all_makes = all_cars.map do |car|
      car.make
    end
    {
      Ford: all_cars.include?("Ford"),
      Chevrolet: all_cars.include?("Chevrolet"),
      Volvo: all_cars.include?("Volvo")
    }
    # require "pry"; binding.pry
  end

  def oldest_cars
    old = []

    # 3.times do
    all_cars.min_by do |car|
      old << car
    end
    return old[0..2]
    # require "pry"; binding.pry
  end
end
