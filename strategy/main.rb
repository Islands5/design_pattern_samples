class Person
  def initialize name
    @name = name
  end
  def set_vehicle vehicle
    @vehicle = vehicle
  end
  def move
    "#{@name}: #{@vehicle.move}"
  end
end

class Vehicle
  def move
    raise "実装してね"
  end
end

class Car < Vehicle
  def move
    "車で移動"
  end
end

class AirPlain < Vehicle
  def move
    "飛行機で移動"
  end
end


goto = Person.new "五島"
goto.set_vehicle Car.new
puts goto.move

yoshii = Person.new "吉井"
yoshii.set_vehicle AirPlain.new
puts yoshii.move
