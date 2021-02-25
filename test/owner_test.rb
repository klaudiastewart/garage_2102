require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/car'
require './lib/owner'

class OwnerTest < Minitest::Test
  def test_owner_exists
    owner_1 = Owner.new('Regina George', 'Heiress')

    assert_instance_of Owner, owner_1
  end

  def test_owner_has_attributes
    owner_1 = Owner.new('Regina George', 'Heiress')

    assert_equal "Regina George", owner_1.name
    assert_equal "Heiress", owner_1.occupation
  end

  def test_owner_can_have_cars
    owner_1 = Owner.new('Regina George', 'Heiress')
    car_1 = Car.new({description: 'Green Ford Mustang', year: '1967'})
    car_2 = Car.new({description: 'Silver BMW 3-Series', year: '2001'})
    car_3 = Car.new({description: 'Red Chevrolet Corvette', year: '1963'})

    assert_equal [], owner_1.cars

    owner_1.buy(car_1)

    assert_equal [car_1], owner_1.cars

    owner_1.buy(car_2)
    owner_1.buy(car_3)

    assert_equal [car_1, car_2, car_3], owner_1.cars
  end

  def test_for_vintage_cars
    owner_1 = Owner.new('Regina George', 'Heiress')
    car_1 = Car.new({description: 'Green Ford Mustang', year: '1967'})
    car_2 = Car.new({description: 'Silver BMW 3-Series', year: '2001'})
    car_3 = Car.new({description: 'Red Chevrolet Corvette', year: '1963'})

    owner_1.buy(car_1)
    owner_1.buy(car_2)
    owner_1.buy(car_3)

    assert_equal [car_1, car_3], owner_1.vintage_cars
  end
end
