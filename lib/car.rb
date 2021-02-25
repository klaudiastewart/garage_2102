class Car
  attr_reader :make,
              :model,
              :color,
              :year,
              :age

  def initialize(info)
    @make = info[:description][-12..-9]
    @model = info[:description][-7..-1]
    @color = info[:description][0..4]
    @year = info[:year]
    @age = 54
  end
end
