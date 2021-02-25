require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/car'
require './lib/owner'
require './lib/garage'

class GarageTest < Minitest::Test
  def test_garage_exists
    garage = Garage.new('Totally Safe Parking')

    assert_instance_of Garage, garage
  end

  def test_garage_attributes
    garage = Garage.new('Totally Safe Parking')

    assert_equal 'Totally Safe Parking', garage.name
  end

  def test_for_customers
    garage = Garage.new('Totally Safe Parking')
    owner_1 = Owner.new('Regina George', 'Heiress')
    owner_2 = Owner.new('Glen Coco', 'Unknown')

    garage.add_customer(owner_1)
    garage.add_customer(owner_2)

    assert_equal [owner_1, owner_2], garage.customers
  end

  def test_garage_has_all_cars
    garage = Garage.new('Totally Safe Parking')
    owner_1 = Owner.new('Regina George', 'Heiress')
    owner_2 = Owner.new('Glen Coco', 'Unknown')
    car_1 = Car.new({description: 'Green Ford Mustang', year: '1967'})
    car_2 = Car.new({description: 'Blue Ford Escape', year: '2001'})
    car_3 = Car.new({description: 'Green Chevrolet Corvette', year: '1963'})
    car_4 = Car.new({description: 'Silver Volvo XC90', year: '2020'})

    owner_1.buy(car_1)
    owner_1.buy(car_2)
    owner_2.buy(car_3)
    owner_2.buy(car_4)

    garage.add_customer(owner_1)
    garage.add_customer(owner_2)

    assert_equal [car_1, car_2, car_3, car_4], garage.all_cars
  end

  def test_garage_cars_by_make
    garage = Garage.new('Totally Safe Parking')
    owner_1 = Owner.new('Regina George', 'Heiress')
    owner_2 = Owner.new('Glen Coco', 'Unknown')
    car_1 = Car.new({description: 'Green Ford Mustang', year: '1967'})
    car_2 = Car.new({description: 'Blue Ford Escape', year: '2001'})
    car_3 = Car.new({description: 'Green Chevrolet Corvette', year: '1963'})
    car_4 = Car.new({description: 'Silver Volvo XC90', year: '2020'})

    owner_1.buy(car_1)
    owner_1.buy(car_2)
    owner_2.buy(car_3)
    owner_2.buy(car_4)

    garage.add_customer(owner_1)
    garage.add_customer(owner_2)

    make = {
      "Ford" => [car_1, car_2],
      "Chevrolet" => [car_3],
      "Volvo" => [car_4]
    }

    assert_equal make, garage.cars_by_make
  end

  def test_garage_for_three_oldest_cars
    garage = Garage.new('Totally Safe Parking')
    owner_1 = Owner.new('Regina George', 'Heiress')
    owner_2 = Owner.new('Glen Coco', 'Unknown')
    car_1 = Car.new({description: 'Green Ford Mustang', year: '1967'})
    car_2 = Car.new({description: 'Blue Ford Escape', year: '2001'})
    car_3 = Car.new({description: 'Green Chevrolet Corvette', year: '1963'})
    car_4 = Car.new({description: 'Silver Volvo XC90', year: '2020'})

    owner_1.buy(car_1)
    owner_1.buy(car_2)
    owner_2.buy(car_3)
    owner_2.buy(car_4)

    garage.add_customer(owner_1)
    garage.add_customer(owner_2)

    assert_equal [car_1, car_2, car_3], garage.oldest_cars
  end
end
