class Ride
  attr_reader :name, :min_height, :admission_fee, :excitement, :rider_log

  def initialize(details)
    @name = details[:name]
    @min_height = details[:min_height]
    @admission_fee = details[:admission_fee]
    @excitement = details[:excitement]
    @rider_log = {}
  end

  def board_rider(visitor)
    if visitor.tall_enough?(@min_height) && visitor.preferences.include?(@excitement) && visitor.spending_money >= @admission_fee
      visitor.spending_money -= @admission_fee
      @rider_log[visitor] = (@rider_log[visitor] || 0) + 1
    end
  end

  def total_revenue
    @rider_log.sum { |visitor, rides| rides * @admission_fee }
  end
end
