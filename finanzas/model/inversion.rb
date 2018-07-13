class Inversion

  attr_accessor :monto

  def initialize(monto)
    @monto = monto.round(4)
  end

end
