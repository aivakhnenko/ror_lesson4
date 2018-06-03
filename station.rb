class Station
  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def arrive(train)
    @trains << train
  end

  def depart(train)
    @trains.delete(train)
  end

  def trains_by_type
    result_hash = Hash.new(0)
    trains.each { |train| result_hash[train.type] += 1 }
    result_hash
  end
end
