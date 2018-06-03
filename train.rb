class Train
  attr_reader :number, :railcars, :speed, :route, :station

  def initialize(number)
    @number = number
    @railcars = []
    @speed = 0
    @route = nil
    @station = nil
  end

  def type
  end

  def speed_up(speed_delta)
    @speed += speed_delta if speed_delta > 0
  end

  def stop
    @speed = 0
  end

  def attach_railcar(railcar)
    @railcars << railcar if speed.zero? && railcar.type == type
  end

  def remove_railcar(railcar)
    @railcars.delete(railcar) if speed.zero?
  end

  def assign_route(route)
    @route = route
    @station = route.first_station
    @station.arrive(self)
  end

  def goto_next_station
    if station
      if station != route.last_station
        @station.depart(self)
        @station = next_station
        @station.arrive(self)
      end
    end
  end

  def goto_prev_station
    if station
      if station != route.first_station
        @station.depart(self)
        @station = prev_station
        @station.arrive(self)
      end
    end
  end

  def prev_station
    @route.stations[route.stations.find_index(station) - 1] if route && station != route.first_station
  end

  def next_station
    @route.stations[route.stations.find_index(station) + 1] if route && (station != route.last_station)
  end
end
